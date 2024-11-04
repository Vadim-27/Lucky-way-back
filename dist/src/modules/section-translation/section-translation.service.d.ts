import { CreateSectionTranslationDto, UpdateSectionTranslationDto } from './dto/section-translation.dto';
import { PrismaService } from '../../../prisma/prisma.service';
export declare class SectionTranslationService {
    private readonly prisma;
    constructor(prisma: PrismaService);
    create(data: CreateSectionTranslationDto): Promise<{
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
    findOne(id: number): Promise<{
        id: number;
        description: string | null;
        title: string;
        languageId: number;
        sectionId: number;
    }>;
    update(id: number, data: UpdateSectionTranslationDto): Promise<{
        id: number;
        description: string | null;
        title: string;
        languageId: number;
        sectionId: number;
    }>;
    remove(id: number): Promise<string>;
}
