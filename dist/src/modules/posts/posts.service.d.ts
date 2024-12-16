import { CreatePostDto, PostListQuerytDto, UpdatePostDto } from './dto/post.dto';
import { PrismaService } from '../../../prisma/prisma.service';
import { Country, Image, Post, PostTranslation } from '@prisma/client';
export declare class PostService {
    private prisma;
    constructor(prisma: PrismaService);
    create(createPostDto: CreatePostDto): Promise<Post & {
        translations: PostTranslation[];
        images: Image[];
        country: Country | null;
    }>;
    findAll(query: PostListQuerytDto): Promise<({
        images: {
            id: number;
            country_id: number | null;
            url: string;
            post_id: number | null;
        }[];
        country: {
            id: number;
            translations: import("@prisma/client/runtime/library").JsonValue | null;
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
            region: string | null;
            region_id: string | null;
            subregion: string | null;
            subregion_id: string | null;
            nationality: string | null;
            latitude: number | null;
            longitude: number | null;
            emoji: string | null;
            emojiU: string | null;
            timezones: import("@prisma/client/runtime/library").JsonValue | null;
            flag: string | null;
            geoData: string | null;
            has_toll_roads: boolean;
        };
        translations: {
            id: number;
            post_id: number;
            language_id: number;
            title: string;
            description: string;
        }[];
    } & {
        id: number;
        country_id: number | null;
        section_id: number | null;
    })[]>;
    findOne(id: number): Promise<{
        images: {
            id: number;
            country_id: number | null;
            url: string;
            post_id: number | null;
        }[];
        country: {
            id: number;
            translations: import("@prisma/client/runtime/library").JsonValue | null;
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
            region: string | null;
            region_id: string | null;
            subregion: string | null;
            subregion_id: string | null;
            nationality: string | null;
            latitude: number | null;
            longitude: number | null;
            emoji: string | null;
            emojiU: string | null;
            timezones: import("@prisma/client/runtime/library").JsonValue | null;
            flag: string | null;
            geoData: string | null;
            has_toll_roads: boolean;
        };
        translations: {
            id: number;
            post_id: number;
            language_id: number;
            title: string;
            description: string;
        }[];
    } & {
        id: number;
        country_id: number | null;
        section_id: number | null;
    }>;
    update(id: number, updatePostDto: UpdatePostDto): Promise<{
        images: {
            id: number;
            country_id: number | null;
            url: string;
            post_id: number | null;
        }[];
        country: {
            id: number;
            translations: import("@prisma/client/runtime/library").JsonValue | null;
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
            region: string | null;
            region_id: string | null;
            subregion: string | null;
            subregion_id: string | null;
            nationality: string | null;
            latitude: number | null;
            longitude: number | null;
            emoji: string | null;
            emojiU: string | null;
            timezones: import("@prisma/client/runtime/library").JsonValue | null;
            flag: string | null;
            geoData: string | null;
            has_toll_roads: boolean;
        };
        translations: {
            id: number;
            post_id: number;
            language_id: number;
            title: string;
            description: string;
        }[];
    } & {
        id: number;
        country_id: number | null;
        section_id: number | null;
    }>;
    remove(id: number): Promise<{
        images: {
            id: number;
            country_id: number | null;
            url: string;
            post_id: number | null;
        }[];
        translations: {
            id: number;
            post_id: number;
            language_id: number;
            title: string;
            description: string;
        }[];
    } & {
        id: number;
        country_id: number | null;
        section_id: number | null;
    }>;
}
