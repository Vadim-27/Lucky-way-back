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
exports.TollRoadService = void 0;
const common_1 = require("@nestjs/common");
const prisma_service_1 = require("../../../prisma/prisma.service");
let TollRoadService = class TollRoadService {
    constructor(prisma) {
        this.prisma = prisma;
    }
    async createTollRoad(data) {
        const tollRoad = await this.prisma.tollRoad.create({ data });
        if (tollRoad) {
            await this.prisma.country.update({
                where: { id: data.country_id },
                data: { has_toll_roads: true },
            });
        }
        return tollRoad;
    }
    async getAllTollRoads() {
        return this.prisma.tollRoad.findMany();
    }
    async getTollRoadById(id) {
        return this.prisma.tollRoad.findUnique({ where: { id } });
    }
    async updateTollRoad(id, data) {
        return this.prisma.tollRoad.update({ where: { id }, data });
    }
    async deleteTollRoad(id) {
        const tollRoad = await this.prisma.tollRoad.findUnique({
            where: { id },
            select: { country_id: true },
        });
        if (!tollRoad) {
            throw new Error('Платну дорогу не знайдено.');
        }
        await this.prisma.tollRoad.delete({ where: { id } });
        const remainingTollRoads = await this.prisma.tollRoad.count({
            where: { country_id: tollRoad.country_id },
        });
        if (remainingTollRoads === 0) {
            await this.prisma.country.update({
                where: { id: tollRoad.country_id },
                data: { has_toll_roads: false },
            });
        }
        return { message: 'Платну дорогу успішно видалено.' };
    }
};
exports.TollRoadService = TollRoadService;
exports.TollRoadService = TollRoadService = __decorate([
    (0, common_1.Injectable)(),
    __metadata("design:paramtypes", [prisma_service_1.PrismaService])
], TollRoadService);
//# sourceMappingURL=toll-road.service.js.map