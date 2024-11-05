import {
  ConflictException,
  HttpException,
  HttpStatus,
  Injectable,
} from '@nestjs/common';
import { CreateLanguageDto } from './dto/create-language.dto';
import { UpdateLanguageDto } from './dto/update-language.dto';
import { Language, Prisma } from '@prisma/client'; // Імпортуємо тип Language
import { PrismaService } from '../../../prisma/prisma.service';
import { PrismaClientKnownRequestError } from '@prisma/client/runtime/library';

@Injectable()
export class LanguagesService {
  constructor(private readonly prisma: PrismaService) {}

  async create(createLanguageDto: CreateLanguageDto): Promise<Language> {
    try {
      return await this.prisma.language.create({
        data: createLanguageDto,
      });
    } catch (error) {
      if (error instanceof PrismaClientKnownRequestError) {
        // Перевірка коду помилки Prisma для унікальності
        if (error.code === 'P2002') {
          const targetField = error.meta?.target || 'уникальное поле';
          throw new ConflictException(
            `Унікальність порушено: поле "${targetField}" повинно бути унікальним.`,
          );
        }
      }
      // Інші випадки помилок
      throw new HttpException(
        'Не вдалося створити запис через невідому помилку',
        HttpStatus.INTERNAL_SERVER_ERROR,
      );
    }
  }

  async findAll(): Promise<Language[]> {
    return this.prisma.language.findMany();
  }

  async findOne(id: number): Promise<Language | null> {
    return this.prisma.language.findUnique({
      where: { id },
    });
  }

  async update(
    id: number,
    updateLanguageDto: UpdateLanguageDto,
  ): Promise<Language> {
    return this.prisma.language.update({
      where: { id },
      data: updateLanguageDto,
    });
  }

  async remove(id: number): Promise<Language> {
    return this.prisma.language.delete({
      where: { id },
    });
  }
}
