import http from "node:http";
import { createReadStream, existsSync, statSync } from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const appDir = path.resolve(__dirname, "..", "app");
const host = process.env.HOST || "127.0.0.1";
const port = Number(process.env.PORT || 4173);

const mimeTypes = {
  ".css": "text/css; charset=utf-8",
  ".html": "text/html; charset=utf-8",
  ".ico": "image/x-icon",
  ".jpg": "image/jpeg",
  ".jpeg": "image/jpeg",
  ".js": "text/javascript; charset=utf-8",
  ".json": "application/json; charset=utf-8",
  ".mp4": "video/mp4",
  ".png": "image/png",
  ".svg": "image/svg+xml",
  ".txt": "text/plain; charset=utf-8",
  ".woff": "font/woff",
  ".woff2": "font/woff2"
};

function sendNotFound(response) {
  response.writeHead(404, { "Content-Type": "text/plain; charset=utf-8" });
  response.end("404 Not Found");
}

function sendMethodNotAllowed(response) {
  response.writeHead(405, { "Content-Type": "text/plain; charset=utf-8" });
  response.end("405 Method Not Allowed");
}

function resolveRequestPath(urlPath) {
  const pathname = decodeURIComponent(new URL(urlPath, "http://localhost").pathname);
  const relativePath = pathname === "/" ? "index.html" : pathname.replace(/^\/+/, "");
  const absolutePath = path.resolve(appDir, relativePath);

  if (!absolutePath.startsWith(appDir)) {
    return null;
  }

  return { absolutePath, pathname };
}

function serveFile(filePath, response, method) {
  const extension = path.extname(filePath).toLowerCase();
  const contentType = mimeTypes[extension] || "application/octet-stream";

  response.writeHead(200, { "Content-Type": contentType });

  if (method === "HEAD") {
    response.end();
    return;
  }

  createReadStream(filePath).pipe(response);
}

const server = http.createServer((request, response) => {
  if (!request.url) {
    sendNotFound(response);
    return;
  }

  if (request.method !== "GET" && request.method !== "HEAD") {
    sendMethodNotAllowed(response);
    return;
  }

  const resolved = resolveRequestPath(request.url);

  if (!resolved) {
    sendNotFound(response);
    return;
  }

  const { absolutePath, pathname } = resolved;

  if (existsSync(absolutePath) && statSync(absolutePath).isFile()) {
    serveFile(absolutePath, response, request.method);
    return;
  }

  if (pathname.startsWith("/assets/") || path.extname(pathname)) {
    sendNotFound(response);
    return;
  }

  serveFile(path.join(appDir, "index.html"), response, request.method);
});

server.listen(port, host, () => {
  console.log(`Heyram Infrastructure local server running at http://${host}:${port}`);
});
