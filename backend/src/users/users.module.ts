import { Module, ValidationPipe  } from '@nestjs/common';
import { APP_PIPE } from '@nestjs/core';
import { UsersService } from './users.service';
import { UsersController } from './users.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { User } from './entities/user.entity';

@Module({
  imports: [TypeOrmModule.forFeature([User])],
  controllers: [UsersController],
  providers: [
    UsersService,
  ],
})
export class UsersModule {}
