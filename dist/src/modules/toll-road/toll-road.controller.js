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
exports.TollRoadController = void 0;
const common_1 = require("@nestjs/common");
const swagger_1 = require("@nestjs/swagger");
const toll_road_service_1 = require("./toll-road.service");
const tollRoad_dto_1 = require("./dto/tollRoad.dto");
let TollRoadController = class TollRoadController {
    constructor(tollRoadService) {
        this.tollRoadService = tollRoadService;
    }
    async create(data) {
        return this.tollRoadService.createTollRoad(data);
    }
    async findAll() {
        return this.tollRoadService.getAllTollRoads();
    }
    async findOne(id) {
        return this.tollRoadService.getTollRoadById(id);
    }
    async update(id, data) {
        return this.tollRoadService.updateTollRoad(id, data);
    }
    async remove(id) {
        return this.tollRoadService.deleteTollRoad(id);
    }
};
exports.TollRoadController = TollRoadController;
__decorate([
    (0, common_1.Post)(),
    (0, swagger_1.ApiOperation)({ summary: 'Створити нову платну дорогу' }),
    (0, swagger_1.ApiResponse)({ status: 201, description: 'Платна дорога успішно створена.' }),
    (0, swagger_1.ApiResponse)({ status: 400, description: 'Некоректні дані для створення.' }),
    __param(0, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [tollRoad_dto_1.CreateTollRoadDto]),
    __metadata("design:returntype", Promise)
], TollRoadController.prototype, "create", null);
__decorate([
    (0, common_1.Get)(),
    (0, swagger_1.ApiOperation)({ summary: 'Отримати список усіх платних доріг' }),
    (0, swagger_1.ApiResponse)({ status: 200, description: 'Успішно отримано список.' }),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", []),
    __metadata("design:returntype", Promise)
], TollRoadController.prototype, "findAll", null);
__decorate([
    (0, common_1.Get)(':id'),
    (0, swagger_1.ApiOperation)({ summary: 'Отримати платну дорогу за ID' }),
    (0, swagger_1.ApiResponse)({ status: 200, description: 'Успішно отримано платну дорогу.' }),
    (0, swagger_1.ApiResponse)({ status: 404, description: 'Платну дорогу не знайдено.' }),
    __param(0, (0, common_1.Param)('id')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", Promise)
], TollRoadController.prototype, "findOne", null);
__decorate([
    (0, common_1.Patch)(':id'),
    (0, swagger_1.ApiOperation)({ summary: 'Оновити платну дорогу за ID' }),
    (0, swagger_1.ApiResponse)({ status: 200, description: 'Платна дорога успішно оновлена.' }),
    (0, swagger_1.ApiResponse)({ status: 400, description: 'Некоректні дані для оновлення.' }),
    (0, swagger_1.ApiResponse)({ status: 404, description: 'Платну дорогу не знайдено.' }),
    __param(0, (0, common_1.Param)('id')),
    __param(1, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number, tollRoad_dto_1.UpdateTollRoadDto]),
    __metadata("design:returntype", Promise)
], TollRoadController.prototype, "update", null);
__decorate([
    (0, common_1.Delete)(':id'),
    (0, swagger_1.ApiOperation)({ summary: 'Видалити платну дорогу за ID' }),
    (0, swagger_1.ApiResponse)({ status: 200, description: 'Платну дорогу успішно видалено.' }),
    (0, swagger_1.ApiResponse)({ status: 404, description: 'Платну дорогу не знайдено.' }),
    __param(0, (0, common_1.Param)('id')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", Promise)
], TollRoadController.prototype, "remove", null);
exports.TollRoadController = TollRoadController = __decorate([
    (0, swagger_1.ApiTags)('Toll Roads'),
    (0, common_1.Controller)('toll-roads'),
    __metadata("design:paramtypes", [toll_road_service_1.TollRoadService])
], TollRoadController);
//# sourceMappingURL=toll-road.controller.js.map