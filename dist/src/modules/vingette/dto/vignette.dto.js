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
exports.UpdateVignetteDto = exports.CreateVignetteDto = void 0;
const swagger_1 = require("@nestjs/swagger");
const class_validator_1 = require("class-validator");
class CreateVignetteDto {
}
exports.CreateVignetteDto = CreateVignetteDto;
__decorate([
    (0, swagger_1.ApiProperty)({ description: 'Тип операції для віньєтки' }),
    (0, class_validator_1.IsString)(),
    (0, class_validator_1.IsNotEmpty)(),
    __metadata("design:type", String)
], CreateVignetteDto.prototype, "operation_type", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({ description: 'Перiод дії віньєтки' }),
    (0, class_validator_1.IsString)(),
    (0, class_validator_1.IsNotEmpty)(),
    __metadata("design:type", String)
], CreateVignetteDto.prototype, "period", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({ description: 'Опис віньєтки' }),
    (0, class_validator_1.IsString)(),
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", String)
], CreateVignetteDto.prototype, "description", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'Посилання на додаткову інформацію або ресурс для віньєтки',
    }),
    (0, class_validator_1.IsString)(),
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", String)
], CreateVignetteDto.prototype, "link", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({ description: 'ID країни' }),
    (0, class_validator_1.IsNumber)(),
    __metadata("design:type", Number)
], CreateVignetteDto.prototype, "country_id", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({ description: 'ID типу транспортного засобу' }),
    (0, class_validator_1.IsNumber)(),
    __metadata("design:type", Number)
], CreateVignetteDto.prototype, "vehicle_type_id", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({ description: 'ID платної дороги' }),
    (0, class_validator_1.IsNumber)(),
    __metadata("design:type", Number)
], CreateVignetteDto.prototype, "toll_road_id", void 0);
class UpdateVignetteDto {
}
exports.UpdateVignetteDto = UpdateVignetteDto;
__decorate([
    (0, swagger_1.ApiProperty)({ description: 'Тип операції для віньєтки' }),
    (0, class_validator_1.IsString)(),
    (0, class_validator_1.IsNotEmpty)(),
    __metadata("design:type", String)
], UpdateVignetteDto.prototype, "operation_type", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({ description: 'Перiод дії віньєтки' }),
    (0, class_validator_1.IsString)(),
    (0, class_validator_1.IsNotEmpty)(),
    __metadata("design:type", String)
], UpdateVignetteDto.prototype, "period", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({ description: 'Опис віньєтки' }),
    (0, class_validator_1.IsString)(),
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", String)
], UpdateVignetteDto.prototype, "description", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'Посилання на додаткову інформацію або ресурс для віньєтки',
    }),
    (0, class_validator_1.IsString)(),
    (0, class_validator_1.IsOptional)(),
    __metadata("design:type", String)
], UpdateVignetteDto.prototype, "link", void 0);
//# sourceMappingURL=vignette.dto.js.map