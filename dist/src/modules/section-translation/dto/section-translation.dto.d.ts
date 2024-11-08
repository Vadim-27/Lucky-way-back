import { SectionTranslation } from '@prisma/client';
export declare class BaseSectionTranslationDto implements Omit<SectionTranslation, 'id'> {
    id: number;
    sectionId: number;
    languageId: number;
    title: string;
    description: string;
}
export declare class UpdateSectionTranslationDto {
    id: number;
    languageId?: number;
    title?: string;
    description?: string;
}
declare const CreateSectionTranslationDto_base: import("@nestjs/common").Type<Pick<BaseSectionTranslationDto, "description" | "title" | "languageId" | "sectionId">>;
export declare class CreateSectionTranslationDto extends CreateSectionTranslationDto_base {
}
declare const CreateSectionTranslationDtoForSection_base: import("@nestjs/common").Type<Pick<BaseSectionTranslationDto, "description" | "title" | "languageId">>;
export declare class CreateSectionTranslationDtoForSection extends CreateSectionTranslationDtoForSection_base {
}
export {};
