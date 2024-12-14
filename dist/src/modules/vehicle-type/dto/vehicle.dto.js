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
exports.UpdateVehicleTypeDto = exports.CreateVehicleTypeDto = void 0;
const swagger_1 = require("@nestjs/swagger");
class CreateVehicleTypeDto {
}
exports.CreateVehicleTypeDto = CreateVehicleTypeDto;
__decorate([
    (0, swagger_1.ApiProperty)({
        example: 1,
        description: 'ID платної дороги, до якої належить транспортний тип',
    }),
    __metadata("design:type", Number)
], CreateVehicleTypeDto.prototype, "toll_road_id", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({ example: 'Truck', description: 'Тип транспортного засобу' }),
    __metadata("design:type", String)
], CreateVehicleTypeDto.prototype, "type", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        example: 'Large transport vehicle',
        description: 'Опис транспортного типу',
    }),
    __metadata("design:type", String)
], CreateVehicleTypeDto.prototype, "description", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        example: 50.0,
        description: 'Вартість для цього транспортного типу',
    }),
    __metadata("design:type", Number)
], CreateVehicleTypeDto.prototype, "cost", void 0);
class UpdateVehicleTypeDto {
}
exports.UpdateVehicleTypeDto = UpdateVehicleTypeDto;
__decorate([
    (0, swagger_1.ApiPropertyOptional)({
        example: 'Truck',
        description: 'Тип транспортного засобу',
    }),
    __metadata("design:type", String)
], UpdateVehicleTypeDto.prototype, "type", void 0);
__decorate([
    (0, swagger_1.ApiPropertyOptional)({
        example: 'Updated description',
        description: 'Оновлений опис транспортного типу',
    }),
    __metadata("design:type", String)
], UpdateVehicleTypeDto.prototype, "description", void 0);
__decorate([
    (0, swagger_1.ApiPropertyOptional)({
        example: 60.0,
        description: 'Оновлена вартість для цього транспортного типу',
    }),
    __metadata("design:type", Number)
], UpdateVehicleTypeDto.prototype, "cost", void 0);
//# sourceMappingURL=vehicle.dto.js.map