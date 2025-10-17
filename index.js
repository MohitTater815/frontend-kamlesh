// frontend/server.js
import express from "express";
import path from "path";
import { fileURLToPath } from "url";

const app = express();

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// Serve HTML file
app.use(express.static(__dirname));

app.listen(3000, () => {
  console.log("🌐 Frontend running on http://localhost:3000");
});
