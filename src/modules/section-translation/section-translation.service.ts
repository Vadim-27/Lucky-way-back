// section-translation.service.ts
import {
  Injectable,
  NotFoundException,
  HttpException,
  HttpStatus,
} from '@nestjs/common';
import {
  CreateSectionTranslationDto,
  UpdateSectionTranslationDto,
} from './dto/section-translation.dto';
import { PrismaService } from '../../../prisma/prisma.service';

@Injectable()
export class SectionTranslationService {
  constructor(private readonly prisma: PrismaService) {}

  // Створення нового перекладу для Section
  async create(data: CreateSectionTranslationDto) {
    if (data.languageId) {
      const lang = this.prisma.language.findUnique({
        where: { id: data.languageId },
      });
      if (!lang) {
        throw new HttpException('languageId not found', HttpStatus.NOT_FOUND);
      }
    }
    return this.prisma.sectionTranslation.create({ data });
  }

  // Повернення всіх перекладів для Section
  async findAll() {
    return this.prisma.sectionTranslation.findMany();
  }

  // Повернення перекладу за ID
  async findOne(id: number) {
    const sectionTranslation = await this.prisma.sectionTranslation.findUnique({
      where: { id },
    });
    if (!sectionTranslation) {
      throw new NotFoundException(`SectionTranslation with ID ${id} not found`);
    }
    return sectionTranslation;
  }

  // Оновлення перекладу за section ID
  async update(sectionId: number, data: UpdateSectionTranslationDto) {
    const { languageId, title, description } = data;

    return await this.prisma.sectionTranslation.upsert({
      where: {
        sectionId_languageId: { sectionId, languageId },
      },
      update: {
        title: title ?? undefined,
        description: description ?? undefined,
      },
      create: {
        sectionId,
        languageId,
        title: title ?? '',
        description: description ?? '',
      },
    });
  }

  // Видалення перекладу за ID
  async remove(id: number) {
    await this.findOne(id); // Перевіряємо наявність перекладу перед видаленням
    await this.prisma.sectionTranslation.delete({ where: { id } });
    return `SectionTranslation with ID ${id} deleted`;
  }
}
