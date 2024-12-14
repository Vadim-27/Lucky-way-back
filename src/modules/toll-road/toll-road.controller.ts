import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  Patch,
  Post,
} from '@nestjs/common';
import { ApiOperation, ApiTags, ApiResponse } from '@nestjs/swagger';
import { TollRoadService } from './toll-road.service';
import { CreateTollRoadDto, UpdateTollRoadDto } from './dto/tollRoad.dto';

@ApiTags('Toll Roads')
@Controller('toll-roads')
export class TollRoadController {
  constructor(private readonly tollRoadService: TollRoadService) {}

  @Post()
  @ApiOperation({ summary: 'Створити нову платну дорогу' })
  @ApiResponse({ status: 201, description: 'Платна дорога успішно створена.' })
  @ApiResponse({ status: 400, description: 'Некоректні дані для створення.' })
  async create(@Body() data: CreateTollRoadDto) {
    return this.tollRoadService.createTollRoad(data);
  }

  @Get()
  @ApiOperation({ summary: 'Отримати список усіх платних доріг' })
  @ApiResponse({ status: 200, description: 'Успішно отримано список.' })
  async findAll() {
    return this.tollRoadService.getAllTollRoads();
  }

  @Get(':id')
  @ApiOperation({ summary: 'Отримати платну дорогу за ID' })
  @ApiResponse({ status: 200, description: 'Успішно отримано платну дорогу.' })
  @ApiResponse({ status: 404, description: 'Платну дорогу не знайдено.' })
  async findOne(@Param('id') id: number) {
    return this.tollRoadService.getTollRoadById(id);
  }

  @Patch(':id')
  @ApiOperation({ summary: 'Оновити платну дорогу за ID' })
  @ApiResponse({ status: 200, description: 'Платна дорога успішно оновлена.' })
  @ApiResponse({ status: 400, description: 'Некоректні дані для оновлення.' })
  @ApiResponse({ status: 404, description: 'Платну дорогу не знайдено.' })
  async update(@Param('id') id: number, @Body() data: UpdateTollRoadDto) {
    return this.tollRoadService.updateTollRoad(id, data);
  }

  @Delete(':id')
  @ApiOperation({ summary: 'Видалити платну дорогу за ID' })
  @ApiResponse({ status: 200, description: 'Платну дорогу успішно видалено.' })
  @ApiResponse({ status: 404, description: 'Платну дорогу не знайдено.' })
  async remove(@Param('id') id: number) {
    return this.tollRoadService.deleteTollRoad(id);
  }
}
