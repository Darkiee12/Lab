import { Inject, Injectable } from '@nestjs/common';
import { DevConfigService } from './common/providers/DevConfigService';

@Injectable()
export class AppService {
  constructor(private devConfigService: DevConfigService,
    @Inject("CONFIG")
    private config: {port: number}
  ){}
  getHello(): string {
    return `I am connected to ${this.devConfigService.getDBHost()} database at port ${this.config.port}!`;
  }
}
