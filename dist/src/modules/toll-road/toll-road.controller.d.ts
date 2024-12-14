import { TollRoadService } from './toll-road.service';
import { CreateTollRoadDto, UpdateTollRoadDto } from './dto/tollRoad.dto';
export declare class TollRoadController {
    private readonly tollRoadService;
    constructor(tollRoadService: TollRoadService);
    create(data: CreateTollRoadDto): Promise<{
        id: number;
        name: string;
        description: string;
        country_id: number;
        toll_type: string;
        coordinates: string | null;
        cost: import("@prisma/client/runtime/library").Decimal;
    }>;
    findAll(): Promise<{
        id: number;
        name: string;
        description: string;
        country_id: number;
        toll_type: string;
        coordinates: string | null;
        cost: import("@prisma/client/runtime/library").Decimal;
    }[]>;
    findOne(id: number): Promise<{
        id: number;
        name: string;
        description: string;
        country_id: number;
        toll_type: string;
        coordinates: string | null;
        cost: import("@prisma/client/runtime/library").Decimal;
    }>;
    update(id: number, data: UpdateTollRoadDto): Promise<{
        id: number;
        name: string;
        description: string;
        country_id: number;
        toll_type: string;
        coordinates: string | null;
        cost: import("@prisma/client/runtime/library").Decimal;
    }>;
    remove(id: number): Promise<{
        message: string;
    }>;
}
