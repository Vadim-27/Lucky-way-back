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
exports.VehicleTypeController = void 0;
const common_1 = require("@nestjs/common");
const swagger_1 = require("@nestjs/swagger");
const vehicle_type_service_1 = require("./vehicle-type.service");
const vehicle_dto_1 = require("./dto/vehicle.dto");
let VehicleTypeController = class VehicleTypeController {
    constructor(vehicleTypeService) {
        this.vehicleTypeService = vehicleTypeService;
    }
    async create(data) {
        return this.vehicleTypeService.createVehicleType(data);
    }
    async findAll() {
        return this.vehicleTypeService.getAllVehicleTypes();
    }
    async findOne(id) {
        return this.vehicleTypeService.getVehicleTypeById(id);
    }
    async update(id, data) {
        return this.vehicleTypeService.updateVehicleType(id, data);
    }
};
exports.VehicleTypeController = VehicleTypeController;
__decorate([
    (0, common_1.Post)(),
    (0, swagger_1.ApiOperation)({ summary: 'Створити новий тип транспортного засобу' }),
    (0, swagger_1.ApiResponse)({
        status: 201,
        description: 'Тип транспортного засобу успішно створений.',
    }),
    (0, swagger_1.ApiResponse)({ status: 400, description: 'Некоректні дані для створення.' }),
    __param(0, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [vehicle_dto_1.CreateVehicleTypeDto]),
    __metadata("design:returntype", Promise)
], VehicleTypeController.prototype, "create", null);
__decorate([
    (0, common_1.Get)(),
    (0, swagger_1.ApiOperation)({ summary: 'Отримати список усіх типів транспортних засобів' }),
    (0, swagger_1.ApiResponse)({ status: 200, description: 'Список успішно отримано.' }),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", []),
    __metadata("design:returntype", Promise)
], VehicleTypeController.prototype, "findAll", null);
__decorate([
    (0, common_1.Get)(':id'),
    (0, swagger_1.ApiOperation)({ summary: 'Отримати тип транспортного засобу за ID' }),
    (0, swagger_1.ApiResponse)({
        status: 200,
        description: 'Тип транспортного засобу успішно отриманий.',
    }),
    (0, swagger_1.ApiResponse)({
        status: 404,
        description: 'Тип транспортного засобу не знайдено.',
    }),
    __param(0, (0, common_1.Param)('id')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", Promise)
], VehicleTypeController.prototype, "findOne", null);
__decorate([
    (0, common_1.Patch)(':id'),
    (0, swagger_1.ApiOperation)({ summary: 'Оновити тип транспортного засобу за ID' }),
    (0, swagger_1.ApiResponse)({
        status: 200,
        description: 'Тип транспортного засобу успішно оновлений.',
    }),
    (0, swagger_1.ApiResponse)({ status: 400, description: 'Некоректні дані для оновлення.' }),
    (0, swagger_1.ApiResponse)({
        status: 404,
        description: 'Тип транспортного засобу не знайдено.',
    }),
    __param(0, (0, common_1.Param)('id')),
    __param(1, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number, vehicle_dto_1.UpdateVehicleTypeDto]),
    __metadata("design:returntype", Promise)
], VehicleTypeController.prototype, "update", null);
exports.VehicleTypeController = VehicleTypeController = __decorate([
    (0, swagger_1.ApiTags)('Vehicle Types'),
    (0, common_1.Controller)('vehicle-types'),
    __metadata("design:paramtypes", [vehicle_type_service_1.VehicleTypeService])
], VehicleTypeController);
//# sourceMappingURL=vehicle-type.controller.js.map