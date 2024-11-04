import { Section, SectionTranslation } from '@prisma/client';
import { CreateSectionTranslationDtoForSection, UpdateSectionTranslationDto } from '../../section-translation/dto/section-translation.dto';
export declare class BaseSectionDto implements Omit<Section, 'id'> {
    name: string;
    id: number;
    description: string;
    translations: SectionTranslation[];
}
declare const CreateSectionDto_base: import("@nestjs/common").Type<Pick<BaseSectionDto, "name" | "description">>;
export declare class CreateSectionDto extends CreateSectionDto_base {
    translations: CreateSectionTranslationDtoForSection[];
}
export declare class UpdateSectionDto {
    name?: string;
    description?: string;
    translations?: UpdateSectionTranslationDto[];
}
export declare class ResponseSectionDto {
    id: number;
    name: string;
    description?: string;
    translations?: SectionTranslation[];
}
export {};
