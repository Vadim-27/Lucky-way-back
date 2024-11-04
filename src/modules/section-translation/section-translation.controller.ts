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

import { ApiTags, ApiOperation, ApiResponse } from '@nestjs/swagger';

@ApiTags('section-translations')
@Controller('section-translations')
export class SectionTranslationController {
  constructor(
    private readonly sectionTranslationService: SectionTranslationService,
  ) {}

  // Endpoint для створення перекладу
  @Post()
  @ApiOperation({ summary: 'Create a new section translation' })
  @ApiResponse({
    status: 201,
    description: 'Translation successfully created.',
  })
  @ApiResponse({ status: 400, description: 'Invalid data.' })
  async create(
    @Body() createSectionTranslationDto: CreateSectionTranslationDto,
  ) {
    return this.sectionTranslationService.create(createSectionTranslationDto);
  }

  // Endpoint для отримання всіх перекладів
  @Get()
  @ApiOperation({ summary: 'Retrieve all section translations' })
  @ApiResponse({
    status: 200,
    description: 'List of translations retrieved successfully.',
  })
  async findAll() {
    return this.sectionTranslationService.findAll();
  }

  // Endpoint для отримання перекладу за ID
  @Get(':id')
  @ApiOperation({ summary: 'Retrieve a section translation by ID' })
  @ApiResponse({
    status: 200,
    description: 'Translation retrieved successfully.',
  })
  @ApiResponse({ status: 404, description: 'Translation not found.' })
  async findOne(@Param('id') id: string) {
    return this.sectionTranslationService.findOne(+id);
  }

  // Endpoint для оновлення перекладу за ID
  @Patch(':id')
  @ApiOperation({ summary: 'Update a section translation by ID' })
  @ApiResponse({
    status: 200,
    description: 'Translation updated successfully.',
  })
  @ApiResponse({ status: 404, description: 'Translation not found.' })
  @ApiResponse({ status: 400, description: 'Invalid data.' })
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
  @ApiOperation({ summary: 'Delete a section translation by ID' })
  @ApiResponse({
    status: 200,
    description: 'Translation deleted successfully.',
  })
  @ApiResponse({ status: 404, description: 'Translation not found.' })
  async remove(@Param('id') id: string) {
    return this.sectionTranslationService.remove(+id);
  }
}
