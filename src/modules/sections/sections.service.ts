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
      // Якщо translations передані та є порожнім масивом, видаляємо всі переклади
      if (translations !== undefined && translations.length === 0) {
        await this.prisma.sectionTranslation.deleteMany({
          where: { sectionId: section.id },
        });
      }

      // Перевіряємо кожен елемент translations, щоб переконатись, що всі мають id
      translations?.forEach((translation) => {
        if (!translation.id) {
          throw new HttpException(
            'translation.id is required',
            HttpStatus.BAD_REQUEST, // Статус 400 для помилки валідації
          );
        }
      });

      // Перевіряємо, чи є хоча б одне перекладене значення для оновлення
      const validTranslations = translations?.filter(
        (translation) => translation.id !== undefined,
      );

      // Виконуємо оновлення тільки якщо translations не пусте або не відсутнє
      const updateData: any = {
        name: sectionData.name ? sectionData.name : section.name, // Оновлюємо поле name, якщо воно змінилося
      };

      if (validTranslations && validTranslations.length > 0) {
        updateData.translations = {
          upsert: validTranslations.map(
            (translation: UpdateSectionTranslationDto) => {
              const updateTranslationData: any = {};

              if (translation.title !== undefined) {
                updateTranslationData.title = translation.title;
              }
              if (translation.description !== undefined) {
                updateTranslationData.description = translation.description;
              }
              if (translation.languageId !== undefined) {
                updateTranslationData.languageId = translation.languageId;
              }

              return {
                where: { id: translation.id }, // Оновлюємо через id
                update: updateTranslationData,
                create: {
                  languageId: translation.languageId ?? 1,
                  title: translation.title ?? '',
                  description: translation.description ?? '',
                },
              };
            },
          ),
        };
      }

      return await this.prisma.section.update({
        where: { id: section.id },
        data: updateData, // Оновлюємо тільки те, що передано
        include: { translations: true },
      });
    } catch (error) {
      console.error(error);

      if (error instanceof Prisma.PrismaClientKnownRequestError) {
        if (error.code === 'P2025') {
          throw new NotFoundException(`Section with ID ${id} not found.`);
        }
        if (error.code === 'P2002') {
          throw new HttpException(
            'Unique constraint failed on a field. Please ensure unique values.',
            HttpStatus.CONFLICT,
          );
        }
      }

      // Якщо помилка не з Prisma, повертаємо її як HttpException
      if (error instanceof HttpException) {
        throw error; // Прокидаємо вже підготовлену помилку
      }

      // Якщо сталася невідома помилка, повертаємо внутрішню помилку 500
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
