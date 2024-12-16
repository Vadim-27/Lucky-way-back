/*
  Warnings:

  - A unique constraint covering the columns `[post_id,language_id]` on the table `PostTranslation` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "PostTranslation_post_id_language_id_key" ON "PostTranslation"("post_id", "language_id");
