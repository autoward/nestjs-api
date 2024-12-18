//Module is responsible for creating the application and setting up the dependencies between the components
import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { MapsModule } from './maps/maps.module';

@Module({
  imports: [MapsModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
