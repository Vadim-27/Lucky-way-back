// post.dto.ts
import {
  IsString,
  IsArray,
  ValidateNested,
  IsOptional,
  IsNumber,
} from 'class-validator';
import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger'; // Імпортуємо ApiProperty
import { CreatePostTranslationDto } from '../../translation/dto/translation.dto';
import { CreateImageDto } from '../../images/dto/create-image.dto';
import { CountryDto } from '../../countries/dto/countries.dto';

// DTO для створення поста
export class CreatePostDto {
  @ApiPropertyOptional({
    description: 'ID країни, до якої відноситься пост',
  })
  @IsOptional()
  @IsNumber()
  country_id?: number;

  @ApiPropertyOptional({
    description: 'ID секції, до якої відноситься пост',
  })
  @IsOptional()
  @IsNumber()
  section_id?: number;

  @ApiProperty({
    type: [CreatePostTranslationDto],
    required: false,
  })
  @IsArray()
  @ValidateNested({ each: true })
  translations: CreatePostTranslationDto[] | [];

  @ApiPropertyOptional({
    description: 'Зображення поста',
    type: [String],
  })
  @IsArray()
  @IsString({ each: true })
  images?: string[];
}

// DTO для оновлення поста
export class UpdatePostDto {
  @ApiPropertyOptional({
    description: 'Країни id',
  })
  @IsOptional()
  country_id?: number;

  @ApiPropertyOptional({
    description: 'Section id',
  })
  @IsOptional()
  section_id?: number;

  @ApiProperty({
    type: [CreatePostTranslationDto],
    required: false,
  })
  @IsOptional()
  @IsArray()
  @ValidateNested({ each: true })
  translations?: CreatePostTranslationDto[];
}


// Тип для відповіді
export class PostResponse {
  @ApiProperty({
    description: 'ID поста',
  })
  id: number;

  @ApiProperty()
  country_id: number;

  @ApiProperty()
  section_id: number;

  @ApiProperty({
    description: 'Переклади поста',
    type: [CreatePostTranslationDto],
  })
  translations: CreatePostTranslationDto[];

  @ApiProperty({
    description: 'Країна',
    type: [CountryDto],
  })
  country: CountryDto[];

  @ApiProperty({
    description: 'Зображення поста',
    type: [CreateImageDto],
  })
  images: [CreateImageDto][];
}

export class PostListQuerytDto {
  @ApiProperty({ required: false })
  @IsOptional()
  section_id?: number;
}
