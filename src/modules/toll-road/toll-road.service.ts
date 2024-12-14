import { Injectable } from '@nestjs/common';
import { PrismaService } from '../../../prisma/prisma.service';
import { CreateTollRoadDto, UpdateTollRoadDto } from './dto/tollRoad.dto';

@Injectable()
export class TollRoadService {
  constructor(private prisma: PrismaService) {}

  async createTollRoad(data: CreateTollRoadDto) {
    // Створюємо платну дорогу
    const tollRoad = await this.prisma.tollRoad.create({ data });

    // Оновлюємо інформацію про країну, де була створена платна дорога
    if (tollRoad) {
      await this.prisma.country.update({
        where: { id: data.country_id }, // Припускаємо, що у data є countryId
        data: { has_toll_roads: true },
      });
    }

    return tollRoad;
  }

  async getAllTollRoads() {
    return this.prisma.tollRoad.findMany();
  }

  async getTollRoadById(id: number) {
    return this.prisma.tollRoad.findUnique({ where: { id } });
  }

  async updateTollRoad(id: number, data: UpdateTollRoadDto) {
    return this.prisma.tollRoad.update({ where: { id }, data });
  }

  // Видалення платної дороги
  async deleteTollRoad(id: number) {
    // Отримуємо платну дорогу, щоб визначити країну
    const tollRoad = await this.prisma.tollRoad.findUnique({
      where: { id },
      select: { country_id: true }, // Отримуємо тільки country_id
    });

    if (!tollRoad) {
      throw new Error('Платну дорогу не знайдено.');
    }

    // Видаляємо платну дорогу
    await this.prisma.tollRoad.delete({ where: { id } });

    // Перевіряємо, чи є інші платні дороги в тій же країні
    const remainingTollRoads = await this.prisma.tollRoad.count({
      where: { country_id: tollRoad.country_id },
    });

    // Якщо платних доріг більше немає, оновлюємо країну
    if (remainingTollRoads === 0) {
      await this.prisma.country.update({
        where: { id: tollRoad.country_id },
        data: { has_toll_roads: false },
      });
    }

    return { message: 'Платну дорогу успішно видалено.' };
  }
}
