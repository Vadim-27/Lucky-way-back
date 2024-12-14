import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsString, IsNumber, IsOptional } from 'class-validator';

export class CreateVignetteDto {
  @ApiProperty({ description: 'Тип операції для віньєтки' })
  @IsString()
  @IsNotEmpty()
  operation_type: string;

  @ApiProperty({ description: 'Перiод дії віньєтки' })
  @IsString()
  @IsNotEmpty()
  period: string;

  @ApiProperty({ description: 'Опис віньєтки' })
  @IsString()
  @IsOptional()
  description?: string;

  @ApiProperty({
    description: 'Посилання на додаткову інформацію або ресурс для віньєтки',
  })
  @IsString()
  @IsOptional()
  link?: string;

  @ApiProperty({ description: 'ID країни' })
  @IsNumber()
  country_id: number;

  @ApiProperty({ description: 'ID типу транспортного засобу' })
  @IsNumber()
  vehicle_type_id: number;

  @ApiProperty({ description: 'ID платної дороги' })
  @IsNumber()
  toll_road_id: number;
}

export class UpdateVignetteDto {
  @ApiProperty({ description: 'Тип операції для віньєтки' })
  @IsString()
  @IsNotEmpty()
  operation_type: string;

  @ApiProperty({ description: 'Перiод дії віньєтки' })
  @IsString()
  @IsNotEmpty()
  period: string;

  @ApiProperty({ description: 'Опис віньєтки' })
  @IsString()
  @IsOptional()
  description?: string;

  @ApiProperty({
    description: 'Посилання на додаткову інформацію або ресурс для віньєтки',
  })
  @IsString()
  @IsOptional()
  link?: string;
}
