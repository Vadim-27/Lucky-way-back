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
exports.ResponseSectionDto = exports.UpdateSectionDto = exports.CreateSectionDto = exports.BaseSectionDto = void 0;
const swagger_1 = require("@nestjs/swagger");
const section_translation_dto_1 = require("../../section-translation/dto/section-translation.dto");
const class_validator_1 = require("class-validator");
class BaseSectionDto {
}
exports.BaseSectionDto = BaseSectionDto;
__decorate([
    (0, swagger_1.ApiProperty)(),
    __metadata("design:type", String)
], BaseSectionDto.prototype, "name", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        type: [section_translation_dto_1.BaseSectionTranslationDto],
    }),
    __metadata("design:type", Array)
], BaseSectionDto.prototype, "translations", void 0);
class CreateSectionDto extends (0, swagger_1.PickType)(BaseSectionDto, ['name']) {
}
exports.CreateSectionDto = CreateSectionDto;
__decorate([
    (0, swagger_1.ApiProperty)({
        type: [section_translation_dto_1.CreateSectionTranslationDtoForSection],
        required: false,
    }),
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Array)
], CreateSectionDto.prototype, "translations", void 0);
class UpdateSectionDto {
}
exports.UpdateSectionDto = UpdateSectionDto;
__decorate([
    (0, swagger_1.ApiProperty)(),
    (0, class_validator_1.IsOptional)(),
    (0, swagger_1.ApiProperty)({ required: false }),
    __metadata("design:type", String)
], UpdateSectionDto.prototype, "name", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        type: [section_translation_dto_1.UpdateSectionTranslationDto],
        required: false,
    }),
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", Array)
], UpdateSectionDto.prototype, "translations", void 0);
class ResponseSectionDto {
}
exports.ResponseSectionDto = ResponseSectionDto;
__decorate([
    (0, swagger_1.ApiProperty)(),
    __metadata("design:type", Number)
], ResponseSectionDto.prototype, "id", void 0);
__decorate([
    (0, swagger_1.ApiProperty)(),
    __metadata("design:type", String)
], ResponseSectionDto.prototype, "name", void 0);
__decorate([
    (0, swagger_1.ApiProperty)(),
    __metadata("design:type", Array)
], ResponseSectionDto.prototype, "translations", void 0);
//# sourceMappingURL=sections.dto.js.map