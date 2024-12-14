import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';

export class CreateTollRoadDto {
  @ApiProperty({
    example: 1,
    description: 'ID країни, до якої належить платна дорога',
  })
  country_id: number;

  @ApiProperty({
    example: 'Highway',
    description: 'Тип платної дороги (наприклад, автомагістраль)',
  })
  toll_type: string;

  @ApiPropertyOptional({
    example: 'POINT(30.5234 50.4501)',
    description: 'Координати платної дороги у форматі WKT',
  })
  coordinates?: string;

  @ApiProperty({
    example: 'Kyiv-Boryspil Highway',
    description: 'Назва платної дороги',
  })
  name: string;

  @ApiProperty({
    example: "Шосе, що з'єднує Київ з аеропортом Бориспіль",
    description: 'Опис платної дороги',
  })
  description: string;

  @ApiProperty({
    example: 150.0,
    description: 'Вартість використання платної дороги',
  })
  cost: number;
}

export class UpdateTollRoadDto {
  @ApiPropertyOptional({
    example: 'Highway',
    description: 'Оновлений тип платної дороги',
  })
  toll_type?: string;

  @ApiPropertyOptional({
    example: 'POINT(30.5234 50.4501)',
    description: 'Оновлені координати у форматі WKT',
  })
  coordinates?: string;

  @ApiPropertyOptional({
    example: 'Updated Name',
    description: 'Оновлена назва платної дороги',
  })
  name?: string;

  @ApiPropertyOptional({
    example: 'Updated description of the toll road',
    description: 'Оновлений опис платної дороги',
  })
  description?: string;

  @ApiPropertyOptional({
    example: 200.0,
    description: 'Оновлена вартість платної дороги',
  })
  cost?: number;
}
