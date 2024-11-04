import { CreateSectionTranslationDto, UpdateSectionTranslationDto } from './dto/section-translation.dto';
import { PrismaService } from '../../../prisma/prisma.service';
export declare class SectionTranslationService {
    private readonly prisma;
    constructor(prisma: PrismaService);
    create(data: CreateSectionTranslationDto): Promise<{
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
    findOne(id: number): Promise<{
        languageId: number;
        title: string;
        description: string | null;
        id: number;
        sectionId: number;
    }>;
    update(id: number, data: UpdateSectionTranslationDto): Promise<{
        languageId: number;
        title: string;
        description: string | null;
        id: number;
        sectionId: number;
    }>;
    remove(id: number): Promise<string>;
}
