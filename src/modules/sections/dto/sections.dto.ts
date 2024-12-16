import { ApiProperty, PickType } from '@nestjs/swagger';
import { Section, SectionTranslation } from '@prisma/client';
import {
  BaseSectionTranslationDto,
  CreateSectionTranslationDtoForSection,
  UpdateSectionTranslationDto,
} from '../../section-translation/dto/section-translation.dto';
import { IsOptional } from 'class-validator';

// DTO для створення Section з перекладами

export class BaseSectionDto implements Partial<Omit<Section, 'id'>> {
  @ApiProperty()
  name: string;

  @ApiProperty({
    type: [BaseSectionTranslationDto],
  })
  translations: SectionTranslation[];
}

export class CreateSectionDto extends PickType(BaseSectionDto, ['name']) {
  @ApiProperty({
    type: [CreateSectionTranslationDtoForSection],
    required: false,
  })
  @IsOptional()
  translations: CreateSectionTranslationDtoForSection[] | [];
}

// DTO для оновлення Section з перекладами
export class UpdateSectionDto {
  @ApiProperty({
    description: 'The name of the section',
    required: false,
  })
  @IsOptional()
  name?: string;

  @ApiProperty({
    type: [UpdateSectionTranslationDto],
    description:
      'Translations to update or create. If a translation with the same languageId exists, it will be updated; otherwise, a new translation will be created.',
    required: false,
  })
  @IsOptional()
  translations?: UpdateSectionTranslationDto[];
}

// DTO для відповіді, включаючи переклади
export class ResponseSectionDto {
  @ApiProperty()
  id: number;

  @ApiProperty()
  name: string;

  @ApiProperty()
  translations?: SectionTranslation[]; // Включаємо переклади в DTO відповіді
}
