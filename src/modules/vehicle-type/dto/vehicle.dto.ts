import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';

export class CreateVehicleTypeDto {
  @ApiProperty({
    example: 1,
    description: 'ID платної дороги, до якої належить транспортний тип',
  })
  toll_road_id: number;

  @ApiProperty({ example: 'Truck', description: 'Тип транспортного засобу' })
  type: string;

  @ApiProperty({
    example: 'Large transport vehicle',
    description: 'Опис транспортного типу',
  })
  description: string;

  @ApiProperty({
    example: 50.0,
    description: 'Вартість для цього транспортного типу',
  })
  cost: number;
}

export class UpdateVehicleTypeDto {
  @ApiPropertyOptional({
    example: 'Truck',
    description: 'Тип транспортного засобу',
  })
  type?: string;

  @ApiPropertyOptional({
    example: 'Updated description',
    description: 'Оновлений опис транспортного типу',
  })
  description?: string;

  @ApiPropertyOptional({
    example: 60.0,
    description: 'Оновлена вартість для цього транспортного типу',
  })
  cost?: number;
}
