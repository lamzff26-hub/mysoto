# 📚 Panduan Instalasi Soto di Arenhost (cPanel)

**Subdomain:** soto.serviceacjombang.com
**Database:** mysoto
**DB Username:** servicea_s

---

## 🚀 TAHAP 1: UPLOAD PROJECT KE ARENHOST

### Opsi A: Upload via Git (Direkomendasikan - 3 menit)

**1. Login ke cPanel Arenhost:**
- Buka: cpanel.arenhost.com
- Masukkan username & password hosting Anda

**2. Buka Terminal (Advanced → Terminal) atau SSH:**
```bash
ssh username@arenhost.com
```

**3. Masuk ke folder subdomain:**
```bash
cd public_html/soto.serviceacjombang.com
```

**4. Clone repository:**
```bash
git clone https://github.com/lamzff26-hub/mysoto.git .
```
(Jika git belum diinstall, hubungi support Arenhost untuk enable Git)

**5. Hapus folder .git jika tidak diperlukan:**
```bash
rm -rf .git
```

---

### Opsi B: Upload via FTP (5-10 menit)

**1. Buka FTP Client (Filezilla, WinSCP, atau Cyberduck):**
- Host: ftp.arenhost.com
- Username: username_ftp_anda
- Password: password_ftp_anda
- Port: 21 (atau 22 untuk SFTP)

**2. Navigate ke folder:**
```
public_html/soto.serviceacjombang.com
```

**3. Upload semua file dari folder `d:\laragon\www\soto`**
- Sertakan folder: app, bootstrap, config, database, resources, routes, storage, public, dll
- Sertakan file: composer.json, package.json, artisan, .env.example, .env.production, dll
- Exclude: .git, node_modules, vendor, storage/logs/* (akan dibuat nanti)

---

## 📝 TAHAP 2: SETUP FILE ENVIRONMENT

### Setelah upload selesai, hubungkan ke server via SSH/Terminal:

```bash
# Masuk ke folder project
cd public_html/soto.serviceacjombang.com

# Copy file environment
cp .env.production .env
```

**Verifikasi file `.env` sudah ada:**
```bash
cat .env | head -20
```

---

## 📦 TAHAP 3: INSTALL DEPENDENCIES

### A. Install Composer Dependencies

```bash
# Install PHP dependencies
composer install --no-dev --optimize-autoloader
```

**Output yang diharapkan:**
```
Creating autoload files
> @php artisan package:discover --ansi
> @php artisan filament:upgrade
Successfully published assets!
```

---

### B. Install Node Dependencies & Build Assets

```bash
# Install npm packages
npm install

# Build production assets
npm run build
```

**Output yang diharapkan:**
```
added XXX packages
Vite v8.x.x built successfully
```

---

## 🗄️ TAHAP 4: DATABASE SETUP

### A. Generate Application Key

```bash
php artisan key:generate
```

**Output:**
```
Application key [base64:...] set successfully.
```

### B. Run Database Migrations

```bash
php artisan migrate --force
```

**Output akan menunjukkan:**
```
Migration table created successfully
Migrating: 2024_01_01_000000_create_users_table
Migrating: 2024_01_01_000001_create_cache_table
... (semua migrations)
Migrated: (XXXms)
```

### C. Seed Database dengan Data Awal

```bash
php artisan db:seed
```

**Output:**
```
Database seeding completed successfully
```

**Login Credentials setelah seeding:**
- **Admin Email:** admin@example.com
- **Admin Password:** (sesuai SEED_ADMIN_PASSWORD di .env)
- **Kasir Email:** kasir@example.com  
- **Kasir Password:** (sesuai SEED_KASIR_PASSWORD di .env)

---

## 🔐 TAHAP 5: SET PERMISSIONS

### Set folder permissions agar writable:

```bash
# Storage folder (untuk logs, cache, sessions)
chmod -R 775 storage
chmod -R 755 storage/app

# Bootstrap cache folder
chmod -R 775 bootstrap/cache

# Public folder
chmod -R 755 public

# Database folder (jika SQLite)
chmod -R 775 database
```

---

## ⚙️ TAHAP 6: KONFIGURASI WEB SERVER

### Verifikasi .htaccess di folder public/

File `.htaccess` sudah ada di `public/.htaccess`. Jika tidak ada, buat dengan isi:

```apache
<IfModule mod_rewrite.c>
    <IfModule mod_negotiation.c>
        Options -MultiViews -Indexes
    </IfModule>

    RewriteEngine On

    # Handle Authorization Header
    RewriteCond %{HTTP:Authorization} .
    RewriteRule .* - [E=HTTP_AUTHORIZATION:%{HTTP:Authorization}]

    # Redirect Trailing Slashes If Not A Folder...
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteCond %{REQUEST_URI} (.+)/$
    RewriteRule ^ %1 [L,R=301]

    # Send Requests To Front Controller...
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteRule ^ index.php [L]
</IfModule>
```

---

## 🧹 TAHAP 7: CACHE & OPTIMIZATION

```bash
# Clear all caches
php artisan cache:clear
php artisan view:clear
php artisan config:cache
php artisan route:cache

# Optimize autoloader
composer dump-autoload --optimize
```

---

## 🌐 TAHAP 8: TESTING AKSES

### A. Test Frontend
Buka di browser: `https://soto.serviceacjombang.com`
- Seharusnya menampilkan halaman landing Soto

### B. Test Admin Panel
Buka: `https://soto.serviceacjombang.com/admin`
- **Email:** admin@example.com
- **Password:** (dari SEED_ADMIN_PASSWORD di .env)

### C. Check Error Logs (jika ada issue)
```bash
tail -f storage/logs/laravel.log
```

---

## 🔧 TROUBLESHOOTING

### Error: "No such file or directory: composer"
```bash
# Install composer (jika belum ada)
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
```

### Error: "Command 'npm' not found"
- Hubungi support Arenhost untuk enable Node.js
- Atau skip `npm run build` jika asset sudah di-build

### Error: "SQLSTATE[HY000] [1045] Access denied"
```bash
# Verify database credentials di .env
cat .env | grep DB_

# Test database connection
php artisan tinker
>>> DB::connection()->getPdo();
# Should return: PDOConnection object (if success)
```

### Error: "RuntimeException: No application encryption key has been specified"
```bash
php artisan key:generate
```

### Error: "The storage directory is not writable"
```bash
chmod -R 777 storage bootstrap/cache
```

### Blank page / 500 error
1. Check error logs:
   ```bash
   tail -100 storage/logs/laravel.log
   ```

2. Enable debug mode temporarily:
   ```bash
   # Edit .env
   APP_DEBUG=true
   ```

3. Refresh & check error message
4. Disable debug setelah fix:
   ```bash
   APP_DEBUG=false
   ```

---

## 📋 SETUP CRON JOB (untuk scheduler & queue)

### Di cPanel:

**1. Go to:** cPanel → Advanced → Cron Jobs

**2. Tambahkan cron job untuk scheduler:**
```
* * * * * cd /home/username/public_html/soto.serviceacjombang.com && /usr/bin/php -d register_argc_argv=On artisan schedule:run >> /dev/null 2>&1
```

**3. Tambahkan cron job untuk queue (optional):**
```
* * * * * cd /home/username/public_html/soto.serviceacjombang.com && /usr/bin/php artisan queue:work --stop-when-empty >> /dev/null 2>&1
```

---

## 🔒 SECURITY CHECKLIST

Sebelum go live, pastikan:

- [ ] `APP_DEBUG=false` di .env (production)
- [ ] `APP_ENV=production` di .env
- [ ] APP_KEY sudah di-generate (bukan default)
- [ ] Database password STRONG
- [ ] Admin password STRONG
- [ ] SSL Certificate enabled (HTTPS)
- [ ] `.env` file tidak accessible dari browser
- [ ] `composer.json` tidak accessible
- [ ] Storage folder tidak accessible dari browser
- [ ] Backup database secara berkala

---

## 📊 VERIFIKASI INSTALASI

**Setelah semua step selesai, jalankan:**

```bash
php artisan tinker

# Check database
>>> DB::table('users')->count()
# Output: 2 (admin + kasir)

>>> DB::table('categories')->count()
# Output: jumlah categories

exit
```

---

## ✅ INSTALASI SELESAI!

Akses aplikasi Anda:
- **🌐 Frontend:** https://soto.serviceacjombang.com
- **🔐 Admin Panel:** https://soto.serviceacjombang.com/admin
  - Email: admin@example.com
  - Password: (dari .env SEED_ADMIN_PASSWORD)

---

## 📞 SUPPORT

Jika ada error atau pertanyaan:

1. **Check logs:**
   ```bash
   tail -f storage/logs/laravel.log
   ```

2. **Test database:**
   ```bash
   php artisan db:ping
   ```

3. **Contact Arenhost support:**
   - Sertakan error logs & informasi error

---

## 🚀 NEXT STEPS (Optional)

- [ ] Setup email configuration (SMTP)
- [ ] Setup backup automation
- [ ] Monitor server performance
- [ ] Update Laravel & dependencies secara berkala

**Happy deploying! 🎉**
