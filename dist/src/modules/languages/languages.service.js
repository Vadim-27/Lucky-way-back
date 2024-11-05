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
exports.LanguagesService = void 0;
const common_1 = require("@nestjs/common");
const prisma_service_1 = require("../../../prisma/prisma.service");
const library_1 = require("@prisma/client/runtime/library");
let LanguagesService = class LanguagesService {
    constructor(prisma) {
        this.prisma = prisma;
    }
    async create(createLanguageDto) {
        try {
            return await this.prisma.language.create({
                data: createLanguageDto,
            });
        }
        catch (error) {
            if (error instanceof library_1.PrismaClientKnownRequestError) {
                if (error.code === 'P2002') {
                    const targetField = error.meta?.target || 'уникальное поле';
                    throw new common_1.ConflictException(`Унікальність порушено: поле "${targetField}" повинно бути унікальним.`);
                }
            }
            throw new common_1.HttpException('Не вдалося створити запис через невідому помилку', common_1.HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    async findAll() {
        return this.prisma.language.findMany();
    }
    async findOne(id) {
        return this.prisma.language.findUnique({
            where: { id },
        });
    }
    async update(id, updateLanguageDto) {
        return this.prisma.language.update({
            where: { id },
            data: updateLanguageDto,
        });
    }
    async remove(id) {
        return this.prisma.language.delete({
            where: { id },
        });
    }
};
exports.LanguagesService = LanguagesService;
exports.LanguagesService = LanguagesService = __decorate([
    (0, common_1.Injectable)(),
    __metadata("design:paramtypes", [prisma_service_1.PrismaService])
], LanguagesService);
//# sourceMappingURL=languages.service.js.map