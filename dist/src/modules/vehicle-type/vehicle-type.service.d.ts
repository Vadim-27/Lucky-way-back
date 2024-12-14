import { PrismaService } from '../../../prisma/prisma.service';
import { CreateVehicleTypeDto, UpdateVehicleTypeDto } from './dto/vehicle.dto';
export declare class VehicleTypeService {
    private prisma;
    constructor(prisma: PrismaService);
    createVehicleType(data: CreateVehicleTypeDto): Promise<{
        id: number;
        description: string;
        type: string;
        cost: import("@prisma/client/runtime/library").Decimal;
        toll_road_id: number;
    }>;
    getAllVehicleTypes(): Promise<{
        id: number;
        description: string;
        type: string;
        cost: import("@prisma/client/runtime/library").Decimal;
        toll_road_id: number;
    }[]>;
    getVehicleTypeById(id: number): Promise<{
        id: number;
        description: string;
        type: string;
        cost: import("@prisma/client/runtime/library").Decimal;
        toll_road_id: number;
    }>;
    updateVehicleType(id: number, data: UpdateVehicleTypeDto): Promise<{
        id: number;
        description: string;
        type: string;
        cost: import("@prisma/client/runtime/library").Decimal;
        toll_road_id: number;
    }>;
}
