"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.AuthModule = void 0;
const common_1 = require("@nestjs/common");
const auth_controller_1 = require("./auth.controller");
const auth_service_1 = require("./auth.service");
const passport_1 = require("@nestjs/passport");
const jwt_1 = require("@nestjs/jwt");
const bearer_strategy_1 = require("./strategies/bearer.strategy");
const users_module_1 = require("../users/users.module");
const verification_service_1 = require("../verification/verification.service");
const users_service_1 = require("../users/users.service");
const prisma_service_1 = require("../../../prisma/prisma.service");
const local_strategy_1 = require("./strategies/local.strategy");
let AuthModule = class AuthModule {
};
exports.AuthModule = AuthModule;
exports.AuthModule = AuthModule = __decorate([
    (0, common_1.Module)({
        imports: [
            passport_1.PassportModule.register({
                property: 'user',
                session: true,
                defaultStrategy: 'local',
            }),
            users_module_1.UsersModule,
            jwt_1.JwtModule.registerAsync({
                useFactory: async () => ({
                    secret: process.env.JWT_SECRET,
                    signOptions: {
                        expiresIn: '24h',
                    },
                }),
            }),
        ],
        controllers: [auth_controller_1.AuthController],
        providers: [
            auth_service_1.AuthService,
            bearer_strategy_1.BearerStrategy,
            local_strategy_1.LocalStrategy,
            prisma_service_1.PrismaService,
            users_service_1.UsersService,
            verification_service_1.VerificationService,
        ],
        exports: [passport_1.PassportModule, auth_service_1.AuthService],
    })
], AuthModule);
//# sourceMappingURL=auth.module.js.map