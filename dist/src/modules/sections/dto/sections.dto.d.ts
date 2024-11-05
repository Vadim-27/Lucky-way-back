import { Section, SectionTranslation } from '@prisma/client';
import { CreateSectionTranslationDtoForSection, UpdateSectionTranslationDto } from '../../section-translation/dto/section-translation.dto';
export declare class BaseSectionDto implements Partial<Omit<Section, 'id'>> {
    name: string;
    translations: SectionTranslation[];
}
declare const CreateSectionDto_base: import("@nestjs/common").Type<Pick<BaseSectionDto, "name">>;
export declare class CreateSectionDto extends CreateSectionDto_base {
    translations: CreateSectionTranslationDtoForSection[] | [];
}
export declare class UpdateSectionDto {
    name?: string;
    translations?: UpdateSectionTranslationDto[];
}
export declare class ResponseSectionDto {
    id: number;
    name: string;
    translations?: SectionTranslation[];
}
export {};
