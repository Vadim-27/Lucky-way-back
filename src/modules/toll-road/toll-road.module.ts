import { Module } from '@nestjs/common';
import { TollRoadService } from './toll-road.service';
import { TollRoadController } from './toll-road.controller';
import { PrismaService } from '../../../prisma/prisma.service';

@Module({
  controllers: [TollRoadController],
  providers: [TollRoadService, PrismaService],
})
export class TollRoadModule {}
