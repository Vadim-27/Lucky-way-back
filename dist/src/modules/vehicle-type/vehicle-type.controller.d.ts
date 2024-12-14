import { VehicleTypeService } from './vehicle-type.service';
import { CreateVehicleTypeDto, UpdateVehicleTypeDto } from './dto/vehicle.dto';
export declare class VehicleTypeController {
    private readonly vehicleTypeService;
    constructor(vehicleTypeService: VehicleTypeService);
    create(data: CreateVehicleTypeDto): Promise<{
        id: number;
        description: string;
        type: string;
        cost: import("@prisma/client/runtime/library").Decimal;
        toll_road_id: number;
    }>;
    findAll(): Promise<{
        id: number;
        description: string;
        type: string;
        cost: import("@prisma/client/runtime/library").Decimal;
        toll_road_id: number;
    }[]>;
    findOne(id: number): Promise<{
        id: number;
        description: string;
        type: string;
        cost: import("@prisma/client/runtime/library").Decimal;
        toll_road_id: number;
    }>;
    update(id: number, data: UpdateVehicleTypeDto): Promise<{
        id: number;
        description: string;
        type: string;
        cost: import("@prisma/client/runtime/library").Decimal;
        toll_road_id: number;
    }>;
}
