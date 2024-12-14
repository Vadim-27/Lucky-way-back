import { Injectable } from '@nestjs/common';
import { PrismaService } from '../../../prisma/prisma.service';
import { CreateVignetteDto, UpdateVignetteDto } from './dto/vignette.dto';

@Injectable()
export class VignetteService {
  constructor(private prisma: PrismaService) {}

  // Створити віньєтку
  async createVignette(data: CreateVignetteDto) {
    // Створюємо нову віньєтку в базі даних
    return this.prisma.vingetteOption.create({
      data: {
        operation_type: data.operation_type,
        period: data.period,
        description: data.description,
        link: data.link,
        country_id: data.country_id, // Переконайтеся, що передаєте правильний тип даних
        vehicle_type_id: data.vehicle_type_id, // Переконайтеся, що передаєте правильний тип даних
        toll_road_id: data.toll_road_id, // Переконайтеся, що передаєте правильний тип даних
      },
    });
  }

  // Отримати всі віньєтки
  async getAllVignettes() {
    return this.prisma.vingetteOption.findMany();
  }

  // Отримати віньєтку за ID
  async getVignetteById(id: number) {
    return this.prisma.vingetteOption.findUnique({
      where: { id },
    });
  }

  // Оновити віньєтку за ID
  async updateVignette(id: number, data: UpdateVignetteDto) {
    return this.prisma.vingetteOption.update({
      where: { id },
      data,
    });
  }

  // Видалити віньєтку
  async deleteVignette(id: number) {
    return this.prisma.vingetteOption.delete({
      where: { id },
    });
  }
}
