import { Module } from '@nestjs/common';
import { SectionTranslationService } from './section-translation.service';
import { SectionTranslationController } from './section-translation.controller';
import { PrismaService } from '../../../prisma/prisma.service';

@Module({
  controllers: [SectionTranslationController],
  providers: [SectionTranslationService, PrismaService],
})
export class SectionTranslationModule {}
