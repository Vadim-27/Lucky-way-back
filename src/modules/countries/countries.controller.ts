import { Body, Controller, Get, Param, Patch, Post } from '@nestjs/common';
import { Country } from '@prisma/client';
import {
  ApiTags,
  ApiOperation,
  ApiResponse,
  ApiParam,
  ApiExcludeEndpoint,
} from '@nestjs/swagger';
import { CountriesService } from './countries.service';
import { UpdateCountryDto } from './dto/countries.dto';

@ApiTags('countries') // Тег для групування ендпоінтів
@Controller('countries')
export class CountriesController {
  constructor(private readonly countriesService: CountriesService) {}

  // Отримати всі країни з бази даних
  @Get()
  @ApiOperation({ summary: 'Отримати всі країни' }) // Опис операції
  @ApiResponse({ status: 200, description: 'Список країн' }) // Відповідь
  async getAllCountries(): Promise<Country[]> {
    return this.countriesService.getAllCountries();
  }

  // Отримати країну за ID
  @Get(':id')
  @ApiOperation({ summary: 'Отримати країну за ID' })
  @ApiParam({
    name: 'id',
    type: Number,
    required: true,
    description: 'ID країни',
  })
  @ApiResponse({ status: 200, description: 'Деталі країни' })
  @ApiResponse({ status: 404, description: 'Країна не знайдена' }) // Відповідь на випадок помилки
  async getCountryById(@Param('id') id: number): Promise<Country | null> {
    return this.countriesService.getCountryById(id);
  }

  // Синхронізувати країни з API
  @Post('sync')
  @ApiExcludeEndpoint() // Виключити цей ендпоінт з документації Swagger
  async syncCountries() {
    await this.countriesService.saveCountries();
    return { message: 'Країни успішно синхронізовані!' };
  }

  @Patch(':id')
  @ApiOperation({ summary: 'Оновити країну за ID' })
  @ApiResponse({ status: 200, description: 'Країну успішно оновлено.' })
  @ApiResponse({ status: 400, description: 'Некоректні дані для оновлення.' })
  @ApiResponse({ status: 404, description: 'Країна не знайдена.' })
  async updateCountry(
    @Param('id') id: number,
    @Body() updateData: UpdateCountryDto,
  ) {
    const updatedCountry = await this.countriesService.updateCountry(
      id,
      updateData,
    );
    return {
      message: 'Країну успішно оновлено!',
      updatedCountry,
    };
  }
}
