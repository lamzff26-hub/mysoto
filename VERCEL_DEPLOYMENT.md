# Panduan Deploy Laravel Soto ke Vercel

## Langkah-Langkah Deployment

### 1. Siapkan Vercel CLI (Jika belum terinstal)
```bash
npm install -g vercel
```

### 2. Connect Project dengan Vercel
```bash
vercel
```
Atau jika sudah terhubung GitHub/GitLab:
- Push ke repository GitHub/GitLab
- Go to https://vercel.com/new
- Import project dari repository

### 3. Set Environment Variables di Vercel

Pada dashboard Vercel, pergi ke **Settings > Environment Variables** dan tambahkan:

```
APP_NAME=Soto
APP_ENV=production
APP_DEBUG=false
APP_KEY=base64:EboK8fA3Ezg3N+QIRDA1GlvuOpfBq+Zr7iif3YAlh88=
APP_URL=https://your-domain.vercel.app

# Database (sesuaikan dengan database production Anda)
DB_CONNECTION=mysql
DB_HOST=your-database-host
DB_PORT=3306
DB_DATABASE=your_database_name
DB_USERNAME=your_db_user
DB_PASSWORD=your_db_password

# Session & Cache
SESSION_DRIVER=database
CACHE_STORE=database
QUEUE_CONNECTION=database

# Mail Configuration
MAIL_MAILER=smtp
MAIL_HOST=smtp.mailtrap.io (atau email provider Anda)
MAIL_PORT=2525
MAIL_USERNAME=your_mail_username
MAIL_PASSWORD=your_mail_password
MAIL_FROM_ADDRESS=noreply@your-domain.com

# Filesystem
FILESYSTEM_DISK=public

# Seed Passwords (untuk production, ubah password yang kuat)
SEED_ADMIN_PASSWORD=password_yang_kuat
SEED_KASIR_PASSWORD=password_yang_kuat
```

### 4. Files yang Sudah Disiapkan

✅ **vercel.json** - Konfigurasi Vercel
✅ **api/index.php** - Entry point untuk serverless
✅ **.vercelignore** - File yang diabaikan saat deploy
✅ **package.json** - Update scripts dengan vercel-build

### 5. Deploy

**Opsi A: Menggunakan Vercel CLI**
```bash
vercel --prod
```

**Opsi B: Menggunakan GitHub Integration**
- Push perubahan ke GitHub
- Vercel akan otomatis build dan deploy

### 6. Post-Deployment

Setelah deploy berhasil:

1. **Setup Database**
   ```
   Database harus sudah ada di server production
   Migrations akan run otomatis via vercel-build
   ```

2. **Run Migrations (Jika diperlukan)**
   Vercel akan menjalankan `php artisan optimize` saat build
   Untuk migrations manual, gunakan:
   ```bash
   vercel env pull
   php artisan migrate --env=production
   ```

3. **Storage Symlink**
   Jika menggunakan storage disk public, pastikan filesystem disk sudah diatur dengan benar

## Important Notes

- **Database**: Pastikan database Anda accessible dari Vercel (whitelisting IP jika perlu)
- **Cache & Sessions**: Menggunakan database driver (compatible dengan Vercel)
- **Queue**: Menggunakan database driver (untuk background jobs)
- **Storage**: Gunakan S3 atau disk publik yang sudah dikonfigurasi
- **Environment Vars**: Jangan commit `.env` file, gunakan Vercel's Environment Variables
- **Memory**: Default 3008MB, bisa disesuaikan di vercel.json

## Troubleshooting

**Error: "No such file or directory"**
- Pastikan semua file migration dan model sudah di-commit

**Database Connection Error**
- Verify DB_HOST, DB_PORT, credentials di Environment Variables
- Pastikan database server dapat diakses dari Vercel

**CORS Issues**
- Tambahkan APP_URL yang benar di environment variables

## File Structure Post-Deployment

```
project/
├── api/
│   └── index.php (serverless entry point)
├── vercel.json (deployment config)
├── .vercelignore (files to exclude)
├── public/ (static files)
├── app/ (application code)
├── database/ (migrations & seeders)
└── ... (laravel files)
```

Deployment siap! 🚀
