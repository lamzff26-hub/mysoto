# 🚀 QUICK INSTALLATION GUIDE - COPY & PASTE COMMANDS

**Subdomain:** soto.serviceacjombang.com  
**Database:** mysoto | Username: servicea_s

---

## 📋 STEP-BY-STEP COMMANDS (Copy & Paste)

### STEP 1: SSH ke Server Arenhost
```bash
ssh username@arenhost.com
```

### STEP 2: Masuk ke Folder Subdomain
```bash
cd public_html/soto.serviceacjombang.com
```

### STEP 3: Clone Project dari GitHub
```bash
git clone https://github.com/lamzff26-hub/mysoto.git .
```

### STEP 4: Setup Environment File
```bash
cp .env.production .env
```

### STEP 5: Buat Folder yang Diperlukan
```bash
mkdir -p storage/app/private storage/framework/cache storage/framework/sessions storage/logs bootstrap/cache
```

### STEP 6: Set Permissions
```bash
chmod -R 775 storage bootstrap/cache
chmod -R 755 public storage/app
```

### STEP 7: Install Composer
```bash
composer install --no-dev --optimize-autoloader
```

### STEP 8: Install NPM & Build Assets
```bash
npm install && npm run build
```

### STEP 9: Generate APP Key
```bash
php artisan key:generate
```

### STEP 10: Database Migrations
```bash
php artisan migrate --force
```

### STEP 11: Seed Database
```bash
php artisan db:seed
```

### STEP 12: Cache Optimization
```bash
php artisan config:cache
php artisan route:cache
php artisan view:cache
```

---

## 🚀 ONE-LINER INSTALLATION (Run Semua Sekaligus)

Jika semua prasyarat sudah terpenuhi:

```bash
cd public_html/soto.serviceacjombang.com && \
cp .env.production .env && \
mkdir -p storage/app/private storage/framework/cache storage/framework/sessions storage/logs bootstrap/cache && \
chmod -R 775 storage bootstrap/cache && \
chmod -R 755 public storage/app && \
composer install --no-dev --optimize-autoloader && \
npm install && npm run build && \
php artisan key:generate && \
php artisan migrate --force && \
php artisan db:seed && \
php artisan config:cache && \
php artisan route:cache && \
php artisan view:cache && \
echo "✅ Installation Complete!"
```

---

## 🔧 AUTO INSTALLER SCRIPT (Recommended)

Jalankan script otomatis (sudah ada di project):

```bash
cd public_html/soto.serviceacjombang.com
bash install.sh
```

---

## 🌐 VERIFIKASI AKSES

Setelah instalasi selesai, buka di browser:

```
Frontend:   https://soto.serviceacjombang.com
Admin:      https://soto.serviceacjombang.com/admin
Email:      admin@example.com
Password:   Alam200311 (atau sesuai .env)
```

---

## ⚠️ JIKA ADA ERROR

### Cek Error Logs
```bash
tail -50 storage/logs/laravel.log
```

### Reset Database
```bash
php artisan migrate:reset
php artisan migrate --force
php artisan db:seed
```

### Clear All Cache
```bash
php artisan cache:clear
php artisan view:clear
php artisan config:clear
php artisan route:clear
```

### Fix Permissions
```bash
chmod -R 777 storage bootstrap/cache
```

---

## ✅ CHECKLIST SEBELUM GO-LIVE

- [ ] APP_DEBUG=false di .env
- [ ] APP_ENV=production di .env
- [ ] Database terkoneksi dengan baik
- [ ] Assets sudah di-build (npm run build)
- [ ] Admin panel bisa diakses
- [ ] Permissions sudah diset dengan benar
- [ ] SSL/HTTPS aktif
- [ ] Cron jobs sudah disetup (optional)

---

## 📞 SUPPORT & TROUBLESHOOTING

File panduan lengkap: **ARENHOST_SETUP_GUIDE.md**

Pertanyaan umum sudah dijawab di panduan tersebut.

**Happy Deploying! 🎉**
