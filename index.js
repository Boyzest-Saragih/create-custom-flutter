#!/usr/bin/env node

import { execSync } from "child_process";
import fs from "fs";
import path from "path";
import chalk from "chalk";

const __dirname = path.resolve();
const projectName = process.argv[2];

if (!projectName) {
  console.log(chalk.red("Masukkan nama project!"));
  console.log(chalk.gray("Contoh: create-flutter-app my_app"));
  process.exit(1);
}

console.log(chalk.cyan(`Membuat project Flutter: ${projectName}`));
execSync(`flutter create ${projectName}`, { stdio: "inherit" });

const basePath = path.join(process.cwd(), projectName);
const libPath = path.join(basePath, "lib");

const templatePath = path.join(__dirname, "templates");


function copyFolder(src, dest) {
  if (!fs.existsSync(dest)) fs.mkdirSync(dest, { recursive: true });

  for (const item of fs.readdirSync(src)) {
    const srcPath = path.join(src, item);
    const destPath = path.join(dest, item);
    const stat = fs.statSync(srcPath);

    if (stat.isDirectory()) {
      copyFolder(srcPath, destPath); 
    } else {
      const content = fs.readFileSync(srcPath, "utf8");
      fs.writeFileSync(destPath, content);
      console.log(chalk.gray(`📄 ${path.relative(templatePath, srcPath)} → ${path.relative(basePath, destPath)}`));
    }
  }
}

copyFolder(templatePath, libPath);

console.log(chalk.green(`✅ Project ${projectName} berhasil dibuat!`));
console.log(chalk.gray(`📁 Semua template telah disalin ke lib/`));

execSync(`cd ${projectName} && flutter pub get`, { stdio: "inherit" });
execSync(`cd ${projectName} && flutter pub add provider shared_preferences intl lucide_icons_flutter`, { stdio: "inherit" });

