import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

(async () => {
  try {
    await prisma.user.createMany({
      data: [
        {
          name: `admin`,
          email: `admin@admin.com`,
        },
        {
          name: `mario`,
          email: `mario@dev.com`,
        },
      ],
    });
  } catch (e) {}
})();
