import { Country } from '@prisma/client';
import { CountriesService } from './countries.service';
export declare class CountriesController {
    private readonly countriesService;
    constructor(countriesService: CountriesService);
    getAllCountries(): Promise<Country[]>;
    getCountryById(id: number): Promise<Country | null>;
    syncCountries(): Promise<{
        message: string;
    }>;
}
