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
            if (translations !== undefined && translations.length === 0) {
                await this.prisma.sectionTranslation.deleteMany({
                    where: { sectionId: section.id },
                });
            }
            translations?.forEach((translation) => {
                if (!translation.id) {
                    throw new common_1.HttpException('translation.id is required', common_1.HttpStatus.BAD_REQUEST);
                }
            });
            const validTranslations = translations?.filter((translation) => translation.id !== undefined);
            const updateData = {
                name: sectionData.name ? sectionData.name : section.name,
            };
            if (validTranslations && validTranslations.length > 0) {
                updateData.translations = {
                    upsert: validTranslations.map((translation) => {
                        const updateTranslationData = {};
                        if (translation.title !== undefined) {
                            updateTranslationData.title = translation.title;
                        }
                        if (translation.description !== undefined) {
                            updateTranslationData.description = translation.description;
                        }
                        if (translation.languageId !== undefined) {
                            updateTranslationData.languageId = translation.languageId;
                        }
                        return {
                            where: { id: translation.id },
                            update: updateTranslationData,
                            create: {
                                languageId: translation.languageId ?? 1,
                                title: translation.title ?? '',
                                description: translation.description ?? '',
                            },
                        };
                    }),
                };
            }
            return await this.prisma.section.update({
                where: { id: section.id },
                data: updateData,
                include: { translations: true },
            });
        }
        catch (error) {
            console.error(error);
            if (error instanceof client_1.Prisma.PrismaClientKnownRequestError) {
                if (error.code === 'P2025') {
                    throw new common_1.NotFoundException(`Section with ID ${id} not found.`);
                }
                if (error.code === 'P2002') {
                    throw new common_1.HttpException('Unique constraint failed on a field. Please ensure unique values.', common_1.HttpStatus.CONFLICT);
                }
            }
            if (error instanceof common_1.HttpException) {
                throw error;
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