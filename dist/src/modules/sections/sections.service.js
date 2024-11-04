"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.SectionsService = void 0;
const common_1 = require("@nestjs/common");
const prisma_service_1 = require("../../../prisma/prisma.service");
const client_1 = require("@prisma/client");
const library_1 = require("@prisma/client/runtime/library");
let SectionsService = class SectionsService {
    constructor(prisma) {
        this.prisma = prisma;
    }
    async create(createSectionDto) {
        try {
            return await this.prisma.section.create({
                data: {
                    name: createSectionDto.name,
                    description: createSectionDto.description,
                    translations: {
                        create: createSectionDto.translations?.map((translation) => ({
                            languageId: translation.languageId,
                            title: translation.title,
                            description: translation.description,
                        })),
                    },
                },
                include: {
                    translations: true,
                },
            });
        }
        catch (error) {
            if (error instanceof library_1.PrismaClientKnownRequestError &&
                error.code === 'P2002') {
                throw new common_1.ConflictException(`Unique constraint failed on fields: sectionId, languageId`);
            }
            throw error;
        }
    }
    async findAll() {
        return this.prisma.section.findMany({
            include: {
                translations: true,
            },
            orderBy: {
                id: 'asc',
            },
        });
    }
    async findOne(id) {
        const section = await this.prisma.section.findUnique({
            where: { id },
            include: {
                translations: true,
            },
        });
        if (!section) {
            throw new common_1.NotFoundException(`Section with ID ${id} not found`);
        }
        return section;
    }
    async update(id, updateSectionDto) {
        const section = await this.findOne(id);
        const { translations, ...sectionData } = updateSectionDto;
        try {
            return await this.prisma.section.update({
                where: { id: section.id },
                data: {
                    ...sectionData,
                    translations: translations?.length
                        ? {
                            upsert: translations.map((translation) => ({
                                where: translation.id
                                    ? { id: translation.id }
                                    : {
                                        sectionId_languageId: {
                                            sectionId: section.id,
                                            languageId: translation.languageId,
                                        },
                                    },
                                update: {
                                    title: translation.title,
                                    description: translation.description,
                                },
                                create: {
                                    languageId: translation.languageId,
                                    title: translation.title,
                                    description: translation.description,
                                },
                            })),
                        }
                        : undefined,
                },
            });
        }
        catch (error) {
            if (error instanceof client_1.Prisma.PrismaClientKnownRequestError) {
                if (error.code === 'P2025') {
                    throw new common_1.NotFoundException(`Section with ID ${id} not found.`);
                }
                if (error.code === 'P2002') {
                    throw new common_1.HttpException('Unique constraint failed on a field. Please ensure unique values.', common_1.HttpStatus.CONFLICT);
                }
            }
            throw new common_1.HttpException('Failed to update section', common_1.HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    async remove(id) {
        const section = await this.findOne(id);
        await this.prisma.sectionTranslation.deleteMany({
            where: { sectionId: section.id },
        });
        await this.prisma.section.delete({
            where: { id: section.id },
        });
        return `Section with ID ${id} deleted`;
    }
};
exports.SectionsService = SectionsService;
exports.SectionsService = SectionsService = __decorate([
    (0, common_1.Injectable)(),
    __metadata("design:paramtypes", [prisma_service_1.PrismaService])
], SectionsService);
//# sourceMappingURL=sections.service.js.map