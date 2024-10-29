"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.PostTranslationModule = void 0;
const common_1 = require("@nestjs/common");
const translation_service_1 = require("./translation.service");
const translation_controller_1 = require("./translation.controller");
const prisma_service_1 = require("../../../prisma/prisma.service");
let PostTranslationModule = class PostTranslationModule {
};
exports.PostTranslationModule = PostTranslationModule;
exports.PostTranslationModule = PostTranslationModule = __decorate([
    (0, common_1.Module)({
        controllers: [translation_controller_1.PostTranslationController],
        providers: [translation_service_1.PostTranslationService, prisma_service_1.PrismaService],
    })
], PostTranslationModule);
//# sourceMappingURL=translation.module.js.map