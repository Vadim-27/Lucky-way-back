import { CreateVignetteDto, UpdateVignetteDto } from './dto/vignette.dto';
import { VignetteService } from './vingette.service';
export declare class VignetteController {
    private readonly vignetteService;
    constructor(vignetteService: VignetteService);
    create(data: CreateVignetteDto): Promise<{
        id: number;
        description: string;
        country_id: number;
        toll_road_id: number;
        operation_type: string;
        period: string;
        link: string | null;
        vehicle_type_id: number;
    }>;
    findAll(): Promise<{
        id: number;
        description: string;
        country_id: number;
        toll_road_id: number;
        operation_type: string;
        period: string;
        link: string | null;
        vehicle_type_id: number;
    }[]>;
    findOne(id: number): Promise<{
        id: number;
        description: string;
        country_id: number;
        toll_road_id: number;
        operation_type: string;
        period: string;
        link: string | null;
        vehicle_type_id: number;
    }>;
    update(id: number, data: UpdateVignetteDto): Promise<{
        id: number;
        description: string;
        country_id: number;
        toll_road_id: number;
        operation_type: string;
        period: string;
        link: string | null;
        vehicle_type_id: number;
    }>;
    remove(id: number): Promise<{
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
