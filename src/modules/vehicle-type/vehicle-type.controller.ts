import { Body, Controller, Get, Param, Patch, Post } from '@nestjs/common';
import { ApiOperation, ApiResponse, ApiTags } from '@nestjs/swagger';
import { VehicleTypeService } from './vehicle-type.service';
import { CreateVehicleTypeDto, UpdateVehicleTypeDto } from './dto/vehicle.dto';

@ApiTags('Vehicle Types')
@Controller('vehicle-types')
export class VehicleTypeController {
  constructor(private readonly vehicleTypeService: VehicleTypeService) {}

  @Post()
  @ApiOperation({ summary: 'Створити новий тип транспортного засобу' })
  @ApiResponse({
    status: 201,
    description: 'Тип транспортного засобу успішно створений.',
  })
  @ApiResponse({ status: 400, description: 'Некоректні дані для створення.' })
  async create(@Body() data: CreateVehicleTypeDto) {
    return this.vehicleTypeService.createVehicleType(data);
  }

  @Get()
  @ApiOperation({ summary: 'Отримати список усіх типів транспортних засобів' })
  @ApiResponse({ status: 200, description: 'Список успішно отримано.' })
  async findAll() {
    return this.vehicleTypeService.getAllVehicleTypes();
  }

  @Get(':id')
  @ApiOperation({ summary: 'Отримати тип транспортного засобу за ID' })
  @ApiResponse({
    status: 200,
    description: 'Тип транспортного засобу успішно отриманий.',
  })
  @ApiResponse({
    status: 404,
    description: 'Тип транспортного засобу не знайдено.',
  })
  async findOne(@Param('id') id: number) {
    return this.vehicleTypeService.getVehicleTypeById(id);
  }

  @Patch(':id')
  @ApiOperation({ summary: 'Оновити тип транспортного засобу за ID' })
  @ApiResponse({
    status: 200,
    description: 'Тип транспортного засобу успішно оновлений.',
  })
  @ApiResponse({ status: 400, description: 'Некоректні дані для оновлення.' })
  @ApiResponse({
    status: 404,
    description: 'Тип транспортного засобу не знайдено.',
  })
  async update(@Param('id') id: number, @Body() data: UpdateVehicleTypeDto) {
    return this.vehicleTypeService.updateVehicleType(id, data);
  }
}
