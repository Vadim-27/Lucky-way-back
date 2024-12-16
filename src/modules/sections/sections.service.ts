import {
  ConflictException,
  HttpException,
  HttpStatus,
  Injectable,
  NotFoundException,
} from '@nestjs/common'; // Імплементуємо NotFoundException
import { PrismaService } from '../../../prisma/prisma.service';
import { Section, Prisma } from '@prisma/client';
import {
  CreateSectionDto,
  ResponseSectionDto,
  UpdateSectionDto,
} from './dto/sections.dto';
import { PrismaClientKnownRequestError } from '@prisma/client/runtime/library';
import { UpdateSectionTranslationDto } from '../section-translation/dto/section-translation.dto';

@Injectable()
export class SectionsService {
  constructor(private readonly prisma: PrismaService) {}

  // Метод для створення нової секції
  // sections.service.ts
  async create(createSectionDto: CreateSectionDto): Promise<Section> {
    try {
      return await this.prisma.section.create({
        data: {
          name: createSectionDto.name,
          translations: {
            create: createSectionDto.translations?.map((translation) => ({
              languageId: translation.languageId,
              title: translation.title,
              description: translation.description,
            })),
          },
        },
        include: {
          translations: true, // Додаємо це, щоб включити переклади
        },
      });
    } catch (error) {
      // Перевіряємо наявність помилки унікальності
      if (
        error instanceof PrismaClientKnownRequestError &&
        error.code === 'P2002' // Код помилки для порушення унікальності
      ) {
        throw new ConflictException(
          `Unique constraint failed on fields: sectionId, languageId`,
        );
      }
      throw error; // Інші помилки передаємо далі
    }
  }

  // Метод для отримання всіх секцій
  async findAll(): Promise<Section[]> {
    return this.prisma.section.findMany({
      include: {
        translations: true, // Включаємо переклади у відповідь
      },
      orderBy: {
        id: 'asc', // або 'desc' для сортування за спаданням
      },
    });
  }

  // Метод для отримання секції за ID
  async findOne(id: number): Promise<Section> {
    const section = await this.prisma.section.findUnique({
      where: { id },
      include: {
        translations: true, // Включаємо переклади у відповідь
      },
    });

    // Якщо секція не знайдена, генеруємо виключення
    if (!section) {
      throw new NotFoundException(`Section with ID ${id} not found`);
    }

    return section;
  }

  // Метод для оновлення секції
  async update(
    id: number,
    updateSectionDto: UpdateSectionDto,
  ): Promise<ResponseSectionDto> {
    const section = await this.findOne(id);

    const { translations, ...sectionData } = updateSectionDto;

    try {
      const updateData: any = {
        name: sectionData.name ?? section.name,
      };

      if (translations && translations.length > 0) {
        updateData.translations = {
          upsert: translations.map((translation) => ({
            where: {
              sectionId_languageId: {
                sectionId: id,
                languageId: translation.languageId,
              },
            },
            update: {
              title: translation.title,
              description: translation.description,
            },
            create: {
              sectionId: id,
              languageId: translation.languageId,
              title: translation.title ?? '',
              description: translation.description ?? '',
            },
          })),
        };
      }

      return await this.prisma.section.update({
        where: { id: section.id },
        data: {
          name: sectionData.name ?? section.name,
          translations: {
            upsert: translations.map((translation) => ({
              where: {
                sectionId_languageId: {
                  sectionId: section.id,
                  languageId: translation.languageId,
                },
              },
              update: {
                title: translation.title ?? '',
                description: translation.description ?? '',
              },
              create: {
                languageId: translation.languageId, // Не передавайте sectionId тут
                title: translation.title ?? '',
                description: translation.description ?? '',
              },
            })),
          },
        },
        include: { translations: true }, // Включення перекладів
      });
    } catch (error) {
      console.error(error);
      throw new HttpException(
        'Failed to update section',
        HttpStatus.INTERNAL_SERVER_ERROR,
      );
    }
  }

  // Метод для видалення секції
  async remove(id: number): Promise<string> {
    const section = await this.findOne(id); // Перевіряємо наявність секції

    // Спочатку видаляємо всі переклади, пов'язані з цією секцією
    await this.prisma.sectionTranslation.deleteMany({
      where: { sectionId: section.id }, // Знаходимо всі переклади для цієї секції
    });

    // Тепер видаляємо саму секцію
    await this.prisma.section.delete({
      where: { id: section.id }, // Використовуємо знайдений ID
    });

    return `Section with ID ${id} deleted`;
  }
}
