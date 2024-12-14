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
exports.CountriesController = void 0;
const common_1 = require("@nestjs/common");
const swagger_1 = require("@nestjs/swagger");
const countries_service_1 = require("./countries.service");
const countries_dto_1 = require("./dto/countries.dto");
let CountriesController = class CountriesController {
    constructor(countriesService) {
        this.countriesService = countriesService;
    }
    async getAllCountries() {
        return this.countriesService.getAllCountries();
    }
    async getCountryById(id) {
        return this.countriesService.getCountryById(id);
    }
    async syncCountries() {
        await this.countriesService.saveCountries();
        return { message: 'Країни успішно синхронізовані!' };
    }
    async updateCountry(id, updateData) {
        const updatedCountry = await this.countriesService.updateCountry(id, updateData);
        return {
            message: 'Країну успішно оновлено!',
            updatedCountry,
        };
    }
};
exports.CountriesController = CountriesController;
__decorate([
    (0, common_1.Get)(),
    (0, swagger_1.ApiOperation)({ summary: 'Отримати всі країни' }),
    (0, swagger_1.ApiResponse)({ status: 200, description: 'Список країн' }),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", []),
    __metadata("design:returntype", Promise)
], CountriesController.prototype, "getAllCountries", null);
__decorate([
    (0, common_1.Get)(':id'),
    (0, swagger_1.ApiOperation)({ summary: 'Отримати країну за ID' }),
    (0, swagger_1.ApiParam)({
        name: 'id',
        type: Number,
        required: true,
        description: 'ID країни',
    }),
    (0, swagger_1.ApiResponse)({ status: 200, description: 'Деталі країни' }),
    (0, swagger_1.ApiResponse)({ status: 404, description: 'Країна не знайдена' }),
    __param(0, (0, common_1.Param)('id')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", Promise)
], CountriesController.prototype, "getCountryById", null);
__decorate([
    (0, common_1.Post)('sync'),
    (0, swagger_1.ApiExcludeEndpoint)(),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", []),
    __metadata("design:returntype", Promise)
], CountriesController.prototype, "syncCountries", null);
__decorate([
    (0, common_1.Patch)(':id'),
    (0, swagger_1.ApiOperation)({ summary: 'Оновити країну за ID' }),
    (0, swagger_1.ApiResponse)({ status: 200, description: 'Країну успішно оновлено.' }),
    (0, swagger_1.ApiResponse)({ status: 400, description: 'Некоректні дані для оновлення.' }),
    (0, swagger_1.ApiResponse)({ status: 404, description: 'Країна не знайдена.' }),
    __param(0, (0, common_1.Param)('id')),
    __param(1, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number, countries_dto_1.UpdateCountryDto]),
    __metadata("design:returntype", Promise)
], CountriesController.prototype, "updateCountry", null);
exports.CountriesController = CountriesController = __decorate([
    (0, swagger_1.ApiTags)('countries'),
    (0, common_1.Controller)('countries'),
    __metadata("design:paramtypes", [countries_service_1.CountriesService])
], CountriesController);
//# sourceMappingURL=countries.controller.js.map