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
exports.VignetteController = void 0;
const common_1 = require("@nestjs/common");
const swagger_1 = require("@nestjs/swagger");
const vignette_dto_1 = require("./dto/vignette.dto");
const vingette_service_1 = require("./vingette.service");
let VignetteController = class VignetteController {
    constructor(vignetteService) {
        this.vignetteService = vignetteService;
    }
    async create(data) {
        return this.vignetteService.createVignette(data);
    }
    async findAll() {
        return this.vignetteService.getAllVignettes();
    }
    async findOne(id) {
        return this.vignetteService.getVignetteById(id);
    }
    async update(id, data) {
        return this.vignetteService.updateVignette(id, data);
    }
    async remove(id) {
        return this.vignetteService.deleteVignette(id);
    }
};
exports.VignetteController = VignetteController;
__decorate([
    (0, common_1.Post)(),
    (0, swagger_1.ApiOperation)({ summary: 'Створити нову віньєтку' }),
    (0, swagger_1.ApiResponse)({ status: 201, description: 'Віньєтка успішно створена.' }),
    (0, swagger_1.ApiResponse)({ status: 400, description: 'Некоректні дані для створення.' }),
    __param(0, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [vignette_dto_1.CreateVignetteDto]),
    __metadata("design:returntype", Promise)
], VignetteController.prototype, "create", null);
__decorate([
    (0, common_1.Get)(),
    (0, swagger_1.ApiOperation)({ summary: 'Отримати список усіх віньєток' }),
    (0, swagger_1.ApiResponse)({ status: 200, description: 'Успішно отримано список.' }),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", []),
    __metadata("design:returntype", Promise)
], VignetteController.prototype, "findAll", null);
__decorate([
    (0, common_1.Get)(':id'),
    (0, swagger_1.ApiOperation)({ summary: 'Отримати віньєтку за ID' }),
    (0, swagger_1.ApiResponse)({ status: 200, description: 'Успішно отримано віньєтку.' }),
    (0, swagger_1.ApiResponse)({ status: 404, description: 'Віньєтку не знайдено.' }),
    __param(0, (0, common_1.Param)('id')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", Promise)
], VignetteController.prototype, "findOne", null);
__decorate([
    (0, common_1.Patch)(':id'),
    (0, swagger_1.ApiOperation)({ summary: 'Оновити віньєтку за ID' }),
    (0, swagger_1.ApiResponse)({ status: 200, description: 'Віньєтка успішно оновлена.' }),
    (0, swagger_1.ApiResponse)({ status: 400, description: 'Некоректні дані для оновлення.' }),
    (0, swagger_1.ApiResponse)({ status: 404, description: 'Віньєтку не знайдено.' }),
    __param(0, (0, common_1.Param)('id')),
    __param(1, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number, vignette_dto_1.UpdateVignetteDto]),
    __metadata("design:returntype", Promise)
], VignetteController.prototype, "update", null);
__decorate([
    (0, common_1.Delete)(':id'),
    (0, swagger_1.ApiOperation)({ summary: 'Видалити віньєтку за ID' }),
    (0, swagger_1.ApiResponse)({ status: 200, description: 'Віньєтку успішно видалено.' }),
    (0, swagger_1.ApiResponse)({ status: 404, description: 'Віньєтку не знайдено.' }),
    __param(0, (0, common_1.Param)('id')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", Promise)
], VignetteController.prototype, "remove", null);
exports.VignetteController = VignetteController = __decorate([
    (0, swagger_1.ApiTags)('Vignette Options'),
    (0, common_1.Controller)('vignettes'),
    __metadata("design:paramtypes", [vingette_service_1.VignetteService])
], VignetteController);
//# sourceMappingURL=vingette.controller.js.map