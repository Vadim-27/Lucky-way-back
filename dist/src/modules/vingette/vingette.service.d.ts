import { PrismaService } from '../../../prisma/prisma.service';
import { CreateVignetteDto, UpdateVignetteDto } from './dto/vignette.dto';
export declare class VignetteService {
    private prisma;
    constructor(prisma: PrismaService);
    createVignette(data: CreateVignetteDto): Promise<{
        id: number;
        description: string;
        country_id: number;
        toll_road_id: number;
        operation_type: string;
        period: string;
        link: string | null;
        vehicle_type_id: number;
    }>;
    getAllVignettes(): Promise<{
        id: number;
        description: string;
        country_id: number;
        toll_road_id: number;
        operation_type: string;
        period: string;
        link: string | null;
        vehicle_type_id: number;
    }[]>;
    getVignetteById(id: number): Promise<{
        id: number;
        description: string;
        country_id: number;
        toll_road_id: number;
        operation_type: string;
        period: string;
        link: string | null;
        vehicle_type_id: number;
    }>;
    updateVignette(id: number, data: UpdateVignetteDto): Promise<{
        id: number;
        description: string;
        country_id: number;
        toll_road_id: number;
        operation_type: string;
        period: string;
        link: string | null;
        vehicle_type_id: number;
    }>;
    deleteVignette(id: number): Promise<{
        id: number;
        description: string;
        country_id: number;
        toll_road_id: number;
        operation_type: string;
        period: string;
        link: string | null;
        vehicle_type_id: number;
    }>;
}
