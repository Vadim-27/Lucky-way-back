import { Module } from '@nestjs/common';
import { VignetteController } from './vingette.controller';
import { VignetteService } from './vingette.service';
import { PrismaService } from '../../../prisma/prisma.service';

@Module({
  controllers: [VignetteController],
  providers: [VignetteService, PrismaService],
})
export class VingetteModule {}
