import { ApiProperty, PickType } from '@nestjs/swagger';
import { Section, SectionTranslation } from '@prisma/client';
import {
  BaseSectionTranslationDto,
  CreateSectionTranslationDtoForSection,
  UpdateSectionTranslationDto,
} from '../../section-translation/dto/section-translation.dto';

// DTO для створення Section з перекладами

export class BaseSectionDto implements Omit<Section, 'id'> {
  @ApiProperty()
  name: string;
  @ApiProperty()
  id: number;
  @ApiProperty()
  description: string;
  @ApiProperty({
    type: [BaseSectionTranslationDto],
  })
  translations: SectionTranslation[];
}

export class CreateSectionDto extends PickType(BaseSectionDto, [
  'name',
  'description',
]) {
  @ApiProperty({
    type: [CreateSectionTranslationDtoForSection],
  })
  translations: CreateSectionTranslationDtoForSection[];
}

// DTO для оновлення Section з перекладами
export class UpdateSectionDto extends PickType(BaseSectionDto, [
  'name',
  'description',
]) {
  @ApiProperty({
    type: [UpdateSectionTranslationDto],
  })
  translations: UpdateSectionTranslationDto[];
}

// DTO для відповіді, включаючи переклади
export class ResponseSectionDto {
  @ApiProperty()
  id: number;

  @ApiProperty()
  name: string;

  @ApiProperty({ required: false })
  description?: string;

  @ApiProperty()
  translations?: SectionTranslation[]; // Включаємо переклади в DTO відповіді
}
