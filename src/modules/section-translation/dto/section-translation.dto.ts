import { ApiProperty, PickType } from '@nestjs/swagger';
import { SectionTranslation } from '@prisma/client';
import { IsInt, IsOptional, IsString } from 'class-validator';

export class BaseSectionTranslationDto
  implements Omit<SectionTranslation, 'id'>
{
  @ApiProperty()
  @IsInt()
  id: number;
  @ApiProperty()
  @IsInt()
  sectionId: number;
  @ApiProperty()
  @IsInt()
  languageId: number;
  @ApiProperty()
  @IsString()
  title: string;
  @ApiProperty()
  @IsString()
  description: string;
}

export class UpdateSectionTranslationDto {
  @ApiProperty({ required: true })
  @IsInt()
  id: number;

  @ApiProperty({ required: false })
  @IsOptional()
  @IsInt()
  languageId?: number;
  @ApiProperty({ required: false })
  @IsString()
  @IsOptional()
  title?: string;
  @ApiProperty({ required: false })
  @IsString()
  @IsOptional()
  description?: string;
}

export class CreateSectionTranslationDto extends PickType(
  BaseSectionTranslationDto,
  ['languageId', 'title', 'description', 'sectionId'],
) {}

export class CreateSectionTranslationDtoForSection extends PickType(
  BaseSectionTranslationDto,
  ['languageId', 'title', 'description'],
) {}
