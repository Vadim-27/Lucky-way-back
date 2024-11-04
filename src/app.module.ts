import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { ConfigModule } from '@nestjs/config';
import { UsersModule } from './modules/users/users.module';
import { AuthModule } from './modules/auth/auth.module';
import { CountriesModule } from './modules/countries/countries.module';
import { LanguagesModule } from './modules/languages/languages.module';
import { ImagesModule } from './modules/images/images.module';
import { PostsModule } from './modules/posts/posts.module';
import { PostTranslationModule } from './modules/translation/translation.module';
import { SectionsModule } from './modules/sections/sections.module';
import { SectionTranslationModule } from './modules/section-translation/section-translation.module';

@Module({
  imports: [
    ConfigModule.forRoot({
      envFilePath: '.env',
    }),
    AuthModule,
    CountriesModule,
    LanguagesModule,
    ImagesModule,
    PostsModule,
    PostTranslationModule,
    SectionsModule,
    SectionTranslationModule,
    UsersModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
