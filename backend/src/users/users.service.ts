import { Injectable, ConflictException  } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateUserDto } from './dto/create-user.dto';
import { User } from './entities/user.entity';
import * as bcrypt from 'bcrypt';

@Injectable()
export class UsersService {
  
  constructor(
    @InjectRepository(User) private readonly userRepository: Repository<User>,
  ) {}

  async create(createUserDto: CreateUserDto) {
    
    const saltOrRounds = 10;
    const user: User = new User();
    user.name = createUserDto.name;
    user.email = createUserDto.email;
    user.phoneNumber = createUserDto.phoneNumber;
    user.password = await bcrypt.hash(createUserDto.password, saltOrRounds);
    
    const existingUserByEmail = await this.userRepository.findOne({ where: { email: user.email} });
    if (existingUserByEmail) {
      throw new ConflictException('El correo electrónico ya está en uso.');
    }

    await this.userRepository.save(user);

    return { message: 'El usuario se ha creado exitosamente.' };
  }
}
