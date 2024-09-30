import { IsOptional, IsString, IsEmail, IsEnum } from 'class-validator';

export enum UserRole {
  USER = 'USER',
  ADMIN = 'ADMIN',
  GUEST = 'GUEST',
}

export class UserBaseDto {
  @IsOptional()
  id?: number; // Primary key, може бути необов'язковим під час створення

  @IsString()
  first_name: string; // Ім'я користувача

  @IsString()
  last_name: string; // Прізвище користувача

  @IsOptional()
  @IsString()
  middle_name?: string; // Друге прізвище, необов'язкове

  @IsEmail()
  email: string; // Унікальна електронна пошта

  @IsString()
  car_number: string; // Номер автомобіля користувача

  @IsOptional()
  @IsString()
  photo?: string; // Фото користувача, необов'язкове

  @IsOptional()
  @IsString()
  birthday?: string; // Дата народження, необов'язкове поле

  @IsOptional()
  @IsString()
  gender?: string; // Стать користувача, необов'язкове

  @IsEnum(UserRole)
  role: UserRole; // Роль користувача
}
