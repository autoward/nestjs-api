//Controller is responsible for handling requests
import { Controller, Get } from '@nestjs/common';
import { AppService } from './app.service';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get('')
  getInit(): string {
    return this.appService.getInit();
  }
  
}
