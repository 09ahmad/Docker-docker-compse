import { PrismaClient } from "@prisma/client";
import express from "express";

const prismaClient = new PrismaClient();
const app = express();
app.use(express.json());

app.get("/", async (req, res) => {
  await prismaClient.user.findMany();
  res.json({
    message: "Get endpoint",
  });
});

app.post("/", async (req, res) => {
  await prismaClient.user.create({
    data: {
      username: Math.random().toString(),
      password: Math.random().toString(),
    },
  });
  res.json({
    message: "Post endpoint",
  });
});
app.listen(3000,()=>{
    console.log(`Server is running on 3000`)
});
