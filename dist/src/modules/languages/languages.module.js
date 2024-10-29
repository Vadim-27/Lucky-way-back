"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.LanguagesModule = void 0;
const common_1 = require("@nestjs/common");
const languages_service_1 = require("./languages.service");
const languages_controller_1 = require("./languages.controller");
const prisma_service_1 = require("../../../prisma/prisma.service");
let LanguagesModule = class LanguagesModule {
};
exports.LanguagesModule = LanguagesModule;
exports.LanguagesModule = LanguagesModule = __decorate([
    (0, common_1.Module)({
        controllers: [languages_controller_1.LanguagesController],
        providers: [languages_service_1.LanguagesService, prisma_service_1.PrismaService],
    })
], LanguagesModule);
//# sourceMappingURL=languages.module.js.map