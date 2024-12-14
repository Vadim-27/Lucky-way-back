import {
  Body,
  Controller,
  Get,
  Param,
  Patch,
  Post,
  Delete,
} from '@nestjs/common';
import { ApiOperation, ApiTags, ApiResponse } from '@nestjs/swagger';
import { CreateVignetteDto, UpdateVignetteDto } from './dto/vignette.dto';
import { VignetteService } from './vingette.service';

@ApiTags('Vignette Options')
@Controller('vignettes')
export class VignetteController {
  constructor(private readonly vignetteService: VignetteService) {}

  @Post()
  @ApiOperation({ summary: 'Створити нову віньєтку' })
  @ApiResponse({ status: 201, description: 'Віньєтка успішно створена.' })
  @ApiResponse({ status: 400, description: 'Некоректні дані для створення.' })
  async create(@Body() data: CreateVignetteDto) {
    return this.vignetteService.createVignette(data);
  }

  @Get()
  @ApiOperation({ summary: 'Отримати список усіх віньєток' })
  @ApiResponse({ status: 200, description: 'Успішно отримано список.' })
  async findAll() {
    return this.vignetteService.getAllVignettes();
  }

  @Get(':id')
  @ApiOperation({ summary: 'Отримати віньєтку за ID' })
  @ApiResponse({ status: 200, description: 'Успішно отримано віньєтку.' })
  @ApiResponse({ status: 404, description: 'Віньєтку не знайдено.' })
  async findOne(@Param('id') id: number) {
    return this.vignetteService.getVignetteById(id);
  }

  @Patch(':id')
  @ApiOperation({ summary: 'Оновити віньєтку за ID' })
  @ApiResponse({ status: 200, description: 'Віньєтка успішно оновлена.' })
  @ApiResponse({ status: 400, description: 'Некоректні дані для оновлення.' })
  @ApiResponse({ status: 404, description: 'Віньєтку не знайдено.' })
  async update(@Param('id') id: number, @Body() data: UpdateVignetteDto) {
    return this.vignetteService.updateVignette(id, data);
  }

  @Delete(':id')
  @ApiOperation({ summary: 'Видалити віньєтку за ID' })
  @ApiResponse({ status: 200, description: 'Віньєтку успішно видалено.' })
  @ApiResponse({ status: 404, description: 'Віньєтку не знайдено.' })
  async remove(@Param('id') id: number) {
    return this.vignetteService.deleteVignette(id);
  }
}
