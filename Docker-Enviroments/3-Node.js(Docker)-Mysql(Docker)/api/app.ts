import express, { Request, Response } from "express";
import dotenv from "dotenv";
import dotenvExpand from "dotenv-expand";
import { PrismaClient } from "@prisma/client";

// ---------------------------------------

// Configure Dot Env File (.env)
dotenvExpand.expand(dotenv.config());

// ---------------------------------------

const app = express();
const port = process.env.PORT || 3000;
const prisma = new PrismaClient();

// ---------------------------------------

app.get("/", (_req: Request, res: Response) => {
  res.send("Hello World!");
});

app.get("/user", async (_req: Request, res: Response) => {
  const users = await prisma.user.findMany();
  res.status(202).json(users);
});

app.listen(port, () => {
  console.log("env", process.env.DATABASE_URL);
  console.log(`Server is on fire at http://localhost:${port}`);
});
