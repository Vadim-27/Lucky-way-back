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
exports.CreateSectionTranslationDtoForSection = exports.CreateSectionTranslationDto = exports.UpdateSectionTranslationDto = exports.BaseSectionTranslationDto = void 0;
const swagger_1 = require("@nestjs/swagger");
const class_validator_1 = require("class-validator");
class BaseSectionTranslationDto {
}
exports.BaseSectionTranslationDto = BaseSectionTranslationDto;
__decorate([
    (0, swagger_1.ApiProperty)(),
    (0, class_validator_1.IsInt)(),
    __metadata("design:type", Number)
], BaseSectionTranslationDto.prototype, "id", void 0);
__decorate([
    (0, swagger_1.ApiProperty)(),
    (0, class_validator_1.IsInt)(),
    __metadata("design:type", Number)
], BaseSectionTranslationDto.prototype, "sectionId", void 0);
__decorate([
    (0, swagger_1.ApiProperty)(),
    (0, class_validator_1.IsInt)(),
    __metadata("design:type", Number)
], BaseSectionTranslationDto.prototype, "languageId", void 0);
__decorate([
    (0, swagger_1.ApiProperty)(),
    (0, class_validator_1.IsString)(),
    __metadata("design:type", String)
], BaseSectionTranslationDto.prototype, "title", void 0);
__decorate([
    (0, swagger_1.ApiProperty)(),
    (0, class_validator_1.IsString)(),
    __metadata("design:type", String)
], BaseSectionTranslationDto.prototype, "description", void 0);
class UpdateSectionTranslationDto {
}
exports.UpdateSectionTranslationDto = UpdateSectionTranslationDto;
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'The language ID for the translation.',
        example: 1,
    }),
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Number)
], UpdateSectionTranslationDto.prototype, "languageId", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'The title of the section in the specific language.',
        example: 'My Section Title',
    }),
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", String)
], UpdateSectionTranslationDto.prototype, "title", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'A description for the section in the specific language.',
        example: 'Description of the section in the selected language.',
        required: false,
    }),
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", String)
], UpdateSectionTranslationDto.prototype, "description", void 0);
class CreateSectionTranslationDto extends (0, swagger_1.PickType)(BaseSectionTranslationDto, ['languageId', 'title', 'description', 'sectionId']) {
}
exports.CreateSectionTranslationDto = CreateSectionTranslationDto;
class CreateSectionTranslationDtoForSection extends (0, swagger_1.PickType)(BaseSectionTranslationDto, ['languageId', 'title', 'description']) {
}
exports.CreateSectionTranslationDtoForSection = CreateSectionTranslationDtoForSection;
//# sourceMappingURL=section-translation.dto.js.map