import { Body, Controller, Post } from '@nestjs/common';
import { UsersService } from './users.service';
import { ApiOperation } from '@nestjs/swagger';
import { UserBaseDto } from './dto/user-base.dto';

@Controller('users')
export class UsersController {
  constructor(private readonly usersService: UsersService) {}

  @ApiOperation({ summary: 'Create user' })
  @Post('create')
  async createUser(@Body() body: UserBaseDto): Promise<any> {
    const user = await this.usersService.createUser(body);
    return user;
  }
}
