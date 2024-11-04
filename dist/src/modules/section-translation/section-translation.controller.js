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
var __param = (this && this.__param) || function (paramIndex, decorator) {
    return function (target, key) { decorator(target, key, paramIndex); }
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.SectionTranslationController = void 0;
const common_1 = require("@nestjs/common");
const section_translation_service_1 = require("./section-translation.service");
const section_translation_dto_1 = require("./dto/section-translation.dto");
let SectionTranslationController = class SectionTranslationController {
    constructor(sectionTranslationService) {
        this.sectionTranslationService = sectionTranslationService;
    }
    async create(createSectionTranslationDto) {
        return this.sectionTranslationService.create(createSectionTranslationDto);
    }
    async findAll() {
        return this.sectionTranslationService.findAll();
    }
    async findOne(id) {
        return this.sectionTranslationService.findOne(+id);
    }
    async update(id, updateSectionTranslationDto) {
        return this.sectionTranslationService.update(+id, updateSectionTranslationDto);
    }
    async remove(id) {
        return this.sectionTranslationService.remove(+id);
    }
};
exports.SectionTranslationController = SectionTranslationController;
__decorate([
    (0, common_1.Post)(),
    __param(0, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [section_translation_dto_1.CreateSectionTranslationDto]),
    __metadata("design:returntype", Promise)
], SectionTranslationController.prototype, "create", null);
__decorate([
    (0, common_1.Get)(),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", []),
    __metadata("design:returntype", Promise)
], SectionTranslationController.prototype, "findAll", null);
__decorate([
    (0, common_1.Get)(':id'),
    __param(0, (0, common_1.Param)('id')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String]),
    __metadata("design:returntype", Promise)
], SectionTranslationController.prototype, "findOne", null);
__decorate([
    (0, common_1.Patch)(':id'),
    __param(0, (0, common_1.Param)('id')),
    __param(1, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String, section_translation_dto_1.UpdateSectionTranslationDto]),
    __metadata("design:returntype", Promise)
], SectionTranslationController.prototype, "update", null);
__decorate([
    (0, common_1.Delete)(':id'),
    __param(0, (0, common_1.Param)('id')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String]),
    __metadata("design:returntype", Promise)
], SectionTranslationController.prototype, "remove", null);
exports.SectionTranslationController = SectionTranslationController = __decorate([
    (0, common_1.Controller)('section-translations'),
    __metadata("design:paramtypes", [section_translation_service_1.SectionTranslationService])
], SectionTranslationController);
//# sourceMappingURL=section-translation.controller.js.map