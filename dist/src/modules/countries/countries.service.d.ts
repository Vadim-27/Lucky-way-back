import { Country } from '@prisma/client';
import { PrismaService } from '../../../prisma/prisma.service';
import { UpdateCountryDto } from './dto/countries.dto';
export declare class CountriesService {
    private prisma;
    constructor(prisma: PrismaService);
    fetchCountries(): Promise<any>;
    saveCountries(): Promise<void>;
    getAllCountries(): Promise<Country[]>;
    getCountryById(id: number): Promise<Country | null>;
    updateCountry(id: number, updateData: UpdateCountryDto): Promise<Country | null>;
}
