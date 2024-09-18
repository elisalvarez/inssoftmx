import { registerAs } from "@nestjs/config";
import { config as dotenvConfig } from 'dotenv';
import { DataSource, DataSourceOptions } from "typeorm";
import * as dotenv from 'dotenv';

dotenv.config();

const config = {
    type: 'postgres',
    host: process.env.TYPEORM_HOST,
    port: parseInt(process.env.TYPEORM_PORT),
    username: `${process.env.TYPEORM_USERNAME}`,
    password: `${process.env.TYPEORM_PASSWORD}`,
    database: process.env.TYPEORM_DATABASE,
    entities: ["**/*.entity.ts,src/**/*.entity.ts"],
    migrations: ["src/migrations/*{.ts,.js}"],
    //autoLoadEntities: true,
    synchronize: false,
}

export default registerAs('typeorm', () => config)
export const connectionSource = new DataSource(config as DataSourceOptions);