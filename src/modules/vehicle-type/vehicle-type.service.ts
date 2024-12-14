import { Injectable } from '@nestjs/common';
import { PrismaService } from '../../../prisma/prisma.service';
import { CreateVehicleTypeDto, UpdateVehicleTypeDto } from './dto/vehicle.dto';
@Injectable()
export class VehicleTypeService {
  constructor(private prisma: PrismaService) {}

  async createVehicleType(data: CreateVehicleTypeDto) {
    return this.prisma.vehicleType.create({ data });
  }

  async getAllVehicleTypes() {
    return this.prisma.vehicleType.findMany();
  }

  async getVehicleTypeById(id: number) {
    return this.prisma.vehicleType.findUnique({ where: { id } });
  }

  async updateVehicleType(id: number, data: UpdateVehicleTypeDto) {
    return this.prisma.vehicleType.update({ where: { id }, data });
  }
}
