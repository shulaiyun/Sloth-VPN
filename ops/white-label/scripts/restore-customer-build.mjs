#!/usr/bin/env node
import fs from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const repoRoot = path.resolve(__dirname, "../../..");
const backupStatePath = path.join(repoRoot, "artifacts", "white-label", "_workspace-backup", "files.json");

if (!fs.existsSync(backupStatePath)) {
  console.error(`Backup state not found: ${backupStatePath}`);
  process.exit(1);
}

const state = JSON.parse(fs.readFileSync(backupStatePath, "utf8"));
const workspace = state.workspace || repoRoot;
const files = state.files || {};

for (const [relativePath, content] of Object.entries(files)) {
  const targetPath = path.join(workspace, relativePath);
  fs.mkdirSync(path.dirname(targetPath), { recursive: true });
  fs.writeFileSync(targetPath, content, "utf8");
}

console.log("Customer build branding restored from backup.");
console.log(`Workspace: ${workspace}`);
