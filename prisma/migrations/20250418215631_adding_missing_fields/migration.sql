/*
  Warnings:

  - You are about to drop the column `resturantId` on the `MenuCategory` table. All the data in the column will be lost.
  - You are about to drop the column `updateAt` on the `MenuCategory` table. All the data in the column will be lost.
  - You are about to drop the column `updateAt` on the `Restaurant` table. All the data in the column will be lost.
  - Added the required column `restaurantId` to the `MenuCategory` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `MenuCategory` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `Restaurant` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "MenuCategory" DROP CONSTRAINT "MenuCategory_resturantId_fkey";

-- AlterTable
ALTER TABLE "MenuCategory" DROP COLUMN "resturantId",
DROP COLUMN "updateAt",
ADD COLUMN     "restaurantId" TEXT NOT NULL,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Restaurant" DROP COLUMN "updateAt",
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;

-- AddForeignKey
ALTER TABLE "MenuCategory" ADD CONSTRAINT "MenuCategory_restaurantId_fkey" FOREIGN KEY ("restaurantId") REFERENCES "Restaurant"("id") ON DELETE CASCADE ON UPDATE CASCADE;
