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
exports.VerificationService = void 0;
const common_1 = require("@nestjs/common");
const jwt_1 = require("@nestjs/jwt");
let VerificationService = class VerificationService {
    constructor(jwtService) {
        this.jwtService = jwtService;
    }
    async decodeToken(token) {
        try {
            return this.jwtService.decode(token);
        }
        catch (err) {
            throw new common_1.BadRequestException('Bad request');
        }
    }
    async signToken(payload, time) {
        try {
            const authToken = this.jwtService.sign(payload, { expiresIn: time });
            return authToken;
        }
        catch (err) {
            throw new common_1.BadRequestException(`${err.message}`);
        }
    }
    async verifyToken(payload) {
        try {
            return await this.jwtService.verifyAsync(payload);
        }
        catch (error) {
            throw new common_1.HttpException(error.name, common_1.HttpStatus.REQUEST_TIMEOUT);
        }
    }
};
exports.VerificationService = VerificationService;
exports.VerificationService = VerificationService = __decorate([
    (0, common_1.Injectable)(),
    __metadata("design:paramtypes", [jwt_1.JwtService])
], VerificationService);
//# sourceMappingURL=verification.service.js.map