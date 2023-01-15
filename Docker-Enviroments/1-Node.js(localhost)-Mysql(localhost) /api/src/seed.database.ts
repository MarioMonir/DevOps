import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

(async () => {
  await prisma.user.createMany({
    data: [
      {
        name: `Sonali_${new Date().toISOString()}`,
        email: `Sonali_${new Date().toISOString()}@prisma.io`,
      },
      {
        name: `Mario_${new Date().toISOString()}`,
        email: `Mario${new Date().toISOString()}@prisma.io`,
      },
    ],
  });
})();
