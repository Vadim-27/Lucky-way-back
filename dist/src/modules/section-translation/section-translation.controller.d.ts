import { SectionTranslationService } from './section-translation.service';
import { CreateSectionTranslationDto, UpdateSectionTranslationDto } from './dto/section-translation.dto';
export declare class SectionTranslationController {
    private readonly sectionTranslationService;
    constructor(sectionTranslationService: SectionTranslationService);
    create(createSectionTranslationDto: CreateSectionTranslationDto): Promise<{
        languageId: number;
        title: string;
        description: string | null;
        id: number;
        sectionId: number;
    }>;
    findAll(): Promise<{
        languageId: number;
        title: string;
        description: string | null;
        id: number;
        sectionId: number;
    }[]>;
    findOne(id: string): Promise<{
        languageId: number;
        title: string;
        description: string | null;
        id: number;
        sectionId: number;
    }>;
    update(id: string, updateSectionTranslationDto: UpdateSectionTranslationDto): Promise<{
        languageId: number;
        title: string;
        description: string | null;
        id: number;
        sectionId: number;
    }>;
    remove(id: string): Promise<string>;
}
