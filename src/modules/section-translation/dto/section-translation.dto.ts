import { ApiProperty, PickType } from '@nestjs/swagger';
import { SectionTranslation } from '@prisma/client';
import { IsInt, IsString } from 'class-validator';

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

export class UpdateSectionTranslationDto extends PickType(
  BaseSectionTranslationDto,
  ['languageId', 'title', 'description', 'id'],
) {}

export class CreateSectionTranslationDto extends PickType(
  BaseSectionTranslationDto,
  ['languageId', 'title', 'description', 'sectionId'],
) {}

export class CreateSectionTranslationDtoForSection extends PickType(
  BaseSectionTranslationDto,
  ['languageId', 'title', 'description'],
) {}
