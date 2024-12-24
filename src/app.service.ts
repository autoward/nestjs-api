//Service is responsible for handling business logic
import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  getInit(): string {
    return 'Hello World!';
  }
}
