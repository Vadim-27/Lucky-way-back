// section-translation.controller.ts
import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { SectionTranslationService } from './section-translation.service';
import {
  CreateSectionTranslationDto,
  UpdateSectionTranslationDto,
} from './dto/section-translation.dto';

@Controller('section-translations')
export class SectionTranslationController {
  constructor(
    private readonly sectionTranslationService: SectionTranslationService,
  ) {}

  // Endpoint для створення перекладу
  @Post()
  async create(
    @Body() createSectionTranslationDto: CreateSectionTranslationDto,
  ) {
    return this.sectionTranslationService.create(createSectionTranslationDto);
  }

  // Endpoint для отримання всіх перекладів
  @Get()
  async findAll() {
    return this.sectionTranslationService.findAll();
  }

  // Endpoint для отримання перекладу за ID
  @Get(':id')
  async findOne(@Param('id') id: string) {
    return this.sectionTranslationService.findOne(+id);
  }

  // Endpoint для оновлення перекладу за ID
  @Patch(':id')
  async update(
    @Param('id') id: string,
    @Body() updateSectionTranslationDto: UpdateSectionTranslationDto,
  ) {
    return this.sectionTranslationService.update(
      +id,
      updateSectionTranslationDto,
    );
  }

  // Endpoint для видалення перекладу за ID
  @Delete(':id')
  async remove(@Param('id') id: string) {
    return this.sectionTranslationService.remove(+id);
  }
}
