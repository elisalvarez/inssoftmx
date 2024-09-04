import { Injectable, ConflictException  } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateUserDto } from './dto/create-user.dto';
import { User } from './entities/user.entity';

@Injectable()
export class UsersService {
  
  constructor(
    @InjectRepository(User) private readonly userRepository: Repository<User>,
  ) {}

  async create(createUserDto: CreateUserDto) {
    const user: User = new User();
    user.name = createUserDto.name;
    user.email = createUserDto.email;
    user.password = createUserDto.password;
    user.phoneNumber = createUserDto.phoneNumber;

    const existingUserByEmail = await this.userRepository.findOne({ where: { email: user.email} });
    if (existingUserByEmail) {
      throw new ConflictException('El correo electrónico ya está en uso.');
    }

    return this.userRepository.save(user);
  }
}
