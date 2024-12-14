import { Country } from '@prisma/client';
import { CountriesService } from './countries.service';
import { UpdateCountryDto } from './dto/countries.dto';
export declare class CountriesController {
    private readonly countriesService;
    constructor(countriesService: CountriesService);
    getAllCountries(): Promise<Country[]>;
    getCountryById(id: number): Promise<Country | null>;
    syncCountries(): Promise<{
        message: string;
    }>;
    updateCountry(id: number, updateData: UpdateCountryDto): Promise<{
        message: string;
        updatedCountry: {
            region: string | null;
            id: number;
            name: string;
            iso3: string;
            iso2: string;
            numeric_code: string;
            phone_code: string;
            capital: string | null;
            currency: string | null;
            currency_name: string | null;
            currency_symbol: string | null;
            tld: string | null;
            native: string | null;
            region_id: string | null;
            subregion: string | null;
            subregion_id: string | null;
            nationality: string | null;
            latitude: number | null;
            longitude: number | null;
            emoji: string | null;
            emojiU: string | null;
            timezones: import("@prisma/client/runtime/library").JsonValue | null;
            translations: import("@prisma/client/runtime/library").JsonValue | null;
            flag: string | null;
            geoData: string | null;
            has_toll_roads: boolean;
        };
    }>;
}
