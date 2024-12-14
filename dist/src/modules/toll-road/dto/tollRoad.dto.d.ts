export declare class CreateTollRoadDto {
    country_id: number;
    toll_type: string;
    coordinates?: string;
    name: string;
    description: string;
    cost: number;
}
export declare class UpdateTollRoadDto {
    toll_type?: string;
    coordinates?: string;
    name?: string;
    description?: string;
    cost?: number;
}
