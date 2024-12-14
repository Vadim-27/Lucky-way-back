"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.TollRoadModule = void 0;
const common_1 = require("@nestjs/common");
const toll_road_service_1 = require("./toll-road.service");
const toll_road_controller_1 = require("./toll-road.controller");
const prisma_service_1 = require("../../../prisma/prisma.service");
let TollRoadModule = class TollRoadModule {
};
exports.TollRoadModule = TollRoadModule;
exports.TollRoadModule = TollRoadModule = __decorate([
    (0, common_1.Module)({
        controllers: [toll_road_controller_1.TollRoadController],
        providers: [toll_road_service_1.TollRoadService, prisma_service_1.PrismaService],
    })
], TollRoadModule);
//# sourceMappingURL=toll-road.module.js.map