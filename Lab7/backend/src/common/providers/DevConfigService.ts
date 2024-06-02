import { Injectable } from "@nestjs/common";

@Injectable()
export class DevConfigService {
  DB_HOST = "localhost";
  getDBHost(){
    return this.DB_HOST;
  }
}