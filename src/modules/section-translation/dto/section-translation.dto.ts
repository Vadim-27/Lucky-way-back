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
  @ApiProperty({
    description: 'The language ID for the translation.',
    example: 1,
  })
  @IsOptional()
  languageId?: number;

  @ApiProperty({
    description: 'The title of the section in the specific language.',
    example: 'My Section Title',
  })
  @IsOptional()
  title?: string;

  @ApiProperty({
    description: 'A description for the section in the specific language.',
    example: 'Description of the section in the selected language.',
    required: false,
  })
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
