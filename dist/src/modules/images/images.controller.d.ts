import { Image as PrismaImage } from '@prisma/client';
import { CreateImageDto } from './dto/create-image.dto';
import { ImageService } from './images.service';
export declare class ImageController {
    private readonly imageService;
    constructor(imageService: ImageService);
    create(data: CreateImageDto): Promise<PrismaImage>;
    findAll(): Promise<PrismaImage[]>;
    findOne(id: number): Promise<PrismaImage | null>;
    update(id: number, url: any): Promise<PrismaImage>;
    remove(id: number): Promise<PrismaImage>;
}
