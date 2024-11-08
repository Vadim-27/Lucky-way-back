import { SectionTranslationService } from './section-translation.service';
import { CreateSectionTranslationDto, UpdateSectionTranslationDto } from './dto/section-translation.dto';
export declare class SectionTranslationController {
    private readonly sectionTranslationService;
    constructor(sectionTranslationService: SectionTranslationService);
    create(createSectionTranslationDto: CreateSectionTranslationDto): Promise<{
        id: number;
        description: string | null;
        title: string;
        languageId: number;
        sectionId: number;
    }>;
    findAll(): Promise<{
        id: number;
        description: string | null;
        title: string;
        languageId: number;
        sectionId: number;
    }[]>;
    findOne(id: string): Promise<{
        id: number;
        description: string | null;
        title: string;
        languageId: number;
        sectionId: number;
    }>;
    update(updateSectionTranslationDto: UpdateSectionTranslationDto): Promise<{
        id: number;
        description: string | null;
        title: string;
        languageId: number;
        sectionId: number;
    }>;
    remove(id: string): Promise<string>;
}
