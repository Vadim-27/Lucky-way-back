import { Injectable } from '@nestjs/common';
import { PrismaService } from '../../../prisma/prisma.service';
import { UserBaseDto } from './dto/user-base.dto';

@Injectable()
export class UsersService {
  constructor(private readonly prismaService: PrismaService) {}

  async createUser(body: UserBaseDto) {
    const birth = new Date(body.birthday); // Перетворюємо на об'єкт Date

    return await this.prismaService.user.create({
      data: {
        first_name: body.first_name,
        last_name: body.last_name,
        middle_name: body.middle_name, // Може бути необов'язковим
        email: body.email,
        car_number: body.car_number,
        photo: body.photo, // Може бути необов'язковим
        birthday: birth, // Може бути необов'язковим
        gender: body.gender, // Може бути необов'язковим
        role: body.role || 'USER', // Встановлюємо роль користувача, за замовчуванням 'USER'
      },
    });
  }
}
