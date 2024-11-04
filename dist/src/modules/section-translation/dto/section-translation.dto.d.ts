import { SectionTranslation } from '@prisma/client';
export declare class BaseSectionTranslationDto implements Omit<SectionTranslation, 'id'> {
    id: number;
    sectionId: number;
    languageId: number;
    title: string;
    description: string;
}
declare const UpdateSectionTranslationDto_base: import("@nestjs/common").Type<Pick<BaseSectionTranslationDto, "languageId" | "title" | "description" | "id">>;
export declare class UpdateSectionTranslationDto extends UpdateSectionTranslationDto_base {
}
declare const CreateSectionTranslationDto_base: import("@nestjs/common").Type<Pick<BaseSectionTranslationDto, "languageId" | "title" | "description" | "sectionId">>;
export declare class CreateSectionTranslationDto extends CreateSectionTranslationDto_base {
}
declare const CreateSectionTranslationDtoForSection_base: import("@nestjs/common").Type<Pick<BaseSectionTranslationDto, "languageId" | "title" | "description">>;
export declare class CreateSectionTranslationDtoForSection extends CreateSectionTranslationDtoForSection_base {
}
export {};
