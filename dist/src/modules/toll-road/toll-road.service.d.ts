import { PrismaService } from '../../../prisma/prisma.service';
import { CreateTollRoadDto, UpdateTollRoadDto } from './dto/tollRoad.dto';
export declare class TollRoadService {
    private prisma;
    constructor(prisma: PrismaService);
    createTollRoad(data: CreateTollRoadDto): Promise<{
        id: number;
        name: string;
        description: string;
        country_id: number;
        toll_type: string;
        coordinates: string | null;
        cost: import("@prisma/client/runtime/library").Decimal;
    }>;
    getAllTollRoads(): Promise<{
        id: number;
        name: string;
        description: string;
        country_id: number;
        toll_type: string;
        coordinates: string | null;
        cost: import("@prisma/client/runtime/library").Decimal;
    }[]>;
    getTollRoadById(id: number): Promise<{
        id: number;
        name: string;
        description: string;
        country_id: number;
        toll_type: string;
        coordinates: string | null;
        cost: import("@prisma/client/runtime/library").Decimal;
    }>;
    updateTollRoad(id: number, data: UpdateTollRoadDto): Promise<{
        id: number;
        name: string;
        description: string;
        country_id: number;
        toll_type: string;
        coordinates: string | null;
        cost: import("@prisma/client/runtime/library").Decimal;
    }>;
    deleteTollRoad(id: number): Promise<{
        message: string;
    }>;
}
