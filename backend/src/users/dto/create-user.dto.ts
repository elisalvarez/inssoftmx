import {
    IsAlphanumeric,
    IsEmail,
    IsNotEmpty,
    IsString,
    Matches,
    MinLength,
    IsOptional,
  } from 'class-validator';
  
 const passwordRegEx = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,20}$/;

export class CreateUserDto {
    @IsString()
    @MinLength(3, { message: 'El nombre debe tener al menos 3 caracteres.'})
    @IsNotEmpty()
    name: string;
  
    @IsNotEmpty()
    @IsEmail({}, { message: 'Introduce una dirección de correo electrónico válida.' })
    email: string;
  
    @IsNotEmpty()
    @Matches(passwordRegEx, {
    message: 'La contraseña debe cumplir con los siguientes requisitos: Tener entre 8 y 20 caracteres, incluir al menos una letra mayúscula, incluir al menos una letra minúscula, incluir al menos un número, incluir al menos un carácter especial.',
    })
    password: string;

    @IsString()
    @Matches(/^\+?[1-9]\d{1,14}$/, {
        message: 'El número de teléfono debe ser un formato válido.',
    })
    phoneNumber: string;
}

