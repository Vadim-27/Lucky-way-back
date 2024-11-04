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
exports.SectionTranslationService = void 0;
const common_1 = require("@nestjs/common");
const prisma_service_1 = require("../../../prisma/prisma.service");
let SectionTranslationService = class SectionTranslationService {
    constructor(prisma) {
        this.prisma = prisma;
    }
    async create(data) {
        return this.prisma.sectionTranslation.create({ data });
    }
    async findAll() {
        return this.prisma.sectionTranslation.findMany();
    }
    async findOne(id) {
        const sectionTranslation = await this.prisma.sectionTranslation.findUnique({
            where: { id },
        });
        if (!sectionTranslation) {
            throw new common_1.NotFoundException(`SectionTranslation with ID ${id} not found`);
        }
        return sectionTranslation;
    }
    async update(id, data) {
        return this.prisma.sectionTranslation.update({
            where: { id },
            data,
        });
    }
    async remove(id) {
        await this.findOne(id);
        await this.prisma.sectionTranslation.delete({ where: { id } });
        return `SectionTranslation with ID ${id} deleted`;
    }
};
exports.SectionTranslationService = SectionTranslationService;
exports.SectionTranslationService = SectionTranslationService = __decorate([
    (0, common_1.Injectable)(),
    __metadata("design:paramtypes", [prisma_service_1.PrismaService])
], SectionTranslationService);
//# sourceMappingURL=section-translation.service.js.map