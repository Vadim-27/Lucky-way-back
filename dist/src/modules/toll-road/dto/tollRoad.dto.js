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
exports.UpdateTollRoadDto = exports.CreateTollRoadDto = void 0;
const swagger_1 = require("@nestjs/swagger");
class CreateTollRoadDto {
}
exports.CreateTollRoadDto = CreateTollRoadDto;
__decorate([
    (0, swagger_1.ApiProperty)({
        example: 1,
        description: 'ID країни, до якої належить платна дорога',
    }),
    __metadata("design:type", Number)
], CreateTollRoadDto.prototype, "country_id", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        example: 'Highway',
        description: 'Тип платної дороги (наприклад, автомагістраль)',
    }),
    __metadata("design:type", String)
], CreateTollRoadDto.prototype, "toll_type", void 0);
__decorate([
    (0, swagger_1.ApiPropertyOptional)({
        example: 'POINT(30.5234 50.4501)',
        description: 'Координати платної дороги у форматі WKT',
    }),
    __metadata("design:type", String)
], CreateTollRoadDto.prototype, "coordinates", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        example: 'Kyiv-Boryspil Highway',
        description: 'Назва платної дороги',
    }),
    __metadata("design:type", String)
], CreateTollRoadDto.prototype, "name", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        example: "Шосе, що з'єднує Київ з аеропортом Бориспіль",
        description: 'Опис платної дороги',
    }),
    __metadata("design:type", String)
], CreateTollRoadDto.prototype, "description", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        example: 150.0,
        description: 'Вартість використання платної дороги',
    }),
    __metadata("design:type", Number)
], CreateTollRoadDto.prototype, "cost", void 0);
class UpdateTollRoadDto {
}
exports.UpdateTollRoadDto = UpdateTollRoadDto;
__decorate([
    (0, swagger_1.ApiPropertyOptional)({
        example: 'Highway',
        description: 'Оновлений тип платної дороги',
    }),
    __metadata("design:type", String)
], UpdateTollRoadDto.prototype, "toll_type", void 0);
__decorate([
    (0, swagger_1.ApiPropertyOptional)({
        example: 'POINT(30.5234 50.4501)',
        description: 'Оновлені координати у форматі WKT',
    }),
    __metadata("design:type", String)
], UpdateTollRoadDto.prototype, "coordinates", void 0);
__decorate([
    (0, swagger_1.ApiPropertyOptional)({
        example: 'Updated Name',
        description: 'Оновлена назва платної дороги',
    }),
    __metadata("design:type", String)
], UpdateTollRoadDto.prototype, "name", void 0);
__decorate([
    (0, swagger_1.ApiPropertyOptional)({
        example: 'Updated description of the toll road',
        description: 'Оновлений опис платної дороги',
    }),
    __metadata("design:type", String)
], UpdateTollRoadDto.prototype, "description", void 0);
__decorate([
    (0, swagger_1.ApiPropertyOptional)({
        example: 200.0,
        description: 'Оновлена вартість платної дороги',
    }),
    __metadata("design:type", Number)
], UpdateTollRoadDto.prototype, "cost", void 0);
//# sourceMappingURL=tollRoad.dto.js.map