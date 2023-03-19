"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const cors_1 = __importDefault(require("cors"));
const dotenv_1 = __importDefault(require("dotenv"));
const dotenv_expand_1 = __importDefault(require("dotenv-expand"));
const client_1 = require("@prisma/client");
dotenv_expand_1.default.expand(dotenv_1.default.config());
const app = (0, express_1.default)();
const port = process.env.API_PORT || 5000;
const prisma = new client_1.PrismaClient();
const corsOption = {
    origin: ["http://localhost:4173"],
};
app.use((0, cors_1.default)(corsOption));
app.get("/", (_req, res) => {
    res.send("Hello World!");
});
app.get("/user", (_req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const users = yield prisma.user.findMany();
    res.status(202).json(users);
}));
app.listen(port, () => {
    console.log("env", process.env.DATABASE_URL);
    console.log(`Server is on fire at http://localhost:${port}`);
});
