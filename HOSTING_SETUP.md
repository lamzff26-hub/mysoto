# Panduan Setup Soto di Hosting Tradisional

## Prasyarat
- PHP 8.1+ (direkomendasikan PHP 8.3)
- MySQL/MariaDB 5.7+
- Composer
- Node.js & npm (untuk build Vite assets)
- SSH Access ke hosting

## Langkah-Langkah Instalasi

### 1. Upload Project ke Hosting

**Via Git (Direkomendasikan):**
```bash
cd /home/username/public_html  # atau direktori project Anda
git clone https://github.com/lamzff26-hub/mysoto.git .
```

**Via FTP/SFTP:**
- Upload semua file ke folder project di hosting

### 2. Konfigurasi Direktori
```bash
# Set permissions
chmod -R 775 storage
chmod -R 775 bootstrap/cache
chmod -R 755 public

# Pastikan direktori ada
mkdir -p storage/app/private
mkdir -p storage/framework/cache
mkdir -p storage/framework/sessions
mkdir -p storage/logs
```

### 3. Setup Environment

**Copy file konfigurasi:**
```bash
cp .env.example .env
```

**Edit `.env` dengan konfigurasi hosting Anda:**
```env
APP_NAME=Soto
APP_ENV=production
APP_DEBUG=false
APP_KEY=base64:EboK8fA3Ezg3N+QIRDA1GlvuOpfBq+Zr7iif3YAlh88=  # Ganti dengan key unik
APP_URL=https://yourdomain.com  # URL domain Anda

# Database
DB_CONNECTION=mysql
DB_HOST=localhost       # atau IP server database
DB_PORT=3306
DB_DATABASE=soto_db     # Nama database Anda
DB_USERNAME=soto_user   # Username database
DB_PASSWORD=password123 # Password database (gunakan password yang kuat!)

# Session
SESSION_DRIVER=database
SESSION_LIFETIME=120

# Cache
CACHE_STORE=database

# Queue
QUEUE_CONNECTION=database

# Mail (sesuaikan dengan email provider Anda)
MAIL_MAILER=smtp
MAIL_HOST=smtp.mailtrap.io
MAIL_PORT=2525
MAIL_USERNAME=your_username
MAIL_PASSWORD=your_password
MAIL_FROM_ADDRESS=noreply@yourdomain.com

# Seed Passwords (WAJIB diubah untuk production!)
SEED_ADMIN_PASSWORD=GantiDenganPasswordKuat123!
SEED_KASIR_PASSWORD=GantiDenganPasswordKuat456!
```

### 4. Install Dependencies

**Via SSH:**
```bash
# Install PHP dependencies
composer install --no-dev --optimize-autoloader

# Install Node dependencies
npm install

# Build Vite assets
npm run build
```

### 5. Generate Application Key
```bash
php artisan key:generate
```

### 6. Setup Database

**Buat database (via cpanel / hosting panel):**
- Buat database baru: `soto_db`
- Buat user database: `soto_user`
- Berikan permission penuh ke user untuk database

**Run migrations:**
```bash
php artisan migrate
```

**Seed data awal:**
```bash
php artisan db:seed
```

### 7. Cache Configuration
```bash
php artisan config:cache
php artisan route:cache
php artisan view:cache
```

### 8. Setup Web Server

**Untuk Apache (.htaccess sudah ada di public/):**
- Pastikan `mod_rewrite` enabled
- DocumentRoot mengarah ke folder `public`

**Contoh VirtualHost Apache:**
```apache
<VirtualHost *:80>
    ServerName yourdomain.com
    ServerAlias www.yourdomain.com
    DocumentRoot /home/username/public_html/public
    
    <Directory /home/username/public_html/public>
        AllowOverride All
        Require all granted
    </Directory>
    
    <Directory /home/username/public_html>
        AllowOverride None
        Deny from all
    </Directory>
</VirtualHost>
```

**Untuk Nginx:**
```nginx
server {
    listen 80;
    server_name yourdomain.com www.yourdomain.com;
    root /home/username/public_html/public;
    index index.php index.html;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        fastcgi_pass 127.0.0.1:9000;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name;
        include fastcgi_params;
    }

    location ~ /\.ht {
        deny all;
    }
}
```

### 9. Setup SSL Certificate
```bash
# Menggunakan Let's Encrypt (via Certbot)
certbot certonly --webroot -w /home/username/public_html/public -d yourdomain.com -d www.yourdomain.com
```

### 10. Setup Cron Job (untuk queue dan scheduler)

**Edit crontab:**
```bash
crontab -e
```

**Tambahkan:**
```bash
* * * * * cd /home/username/public_html && php artisan schedule:run >> /dev/null 2>&1
* * * * * cd /home/username/public_html && php artisan queue:work --stop-when-empty >> storage/logs/queue.log 2>&1
```

## Verifikasi Instalasi

Buka browser dan akses:
- **Frontend**: `https://yourdomain.com`
- **Admin Panel**: `https://yourdomain.com/admin`

**Login credentials (sesuaikan dengan seed password):**
- Email: `admin@example.com`
- Password: (sesuai SEED_ADMIN_PASSWORD di .env)

## Update Project

Untuk update project dari repository:
```bash
git pull origin main
composer install --no-dev --optimize-autoloader
npm install
npm run build
php artisan migrate
php artisan cache:clear
php artisan config:cache
php artisan route:cache
```

## Troubleshooting

**Error "Autoloader not found":**
```bash
composer dump-autoload --optimize
```

**Error "Storage/logs not writable":**
```bash
chmod -R 775 storage bootstrap/cache
```

**Error "Database connection failed":**
- Verify database credentials di .env
- Pastikan database sudah dibuat
- Check koneksi ke database host

**Error "Key not set":**
```bash
php artisan key:generate
```

**Blank page / 500 error:**
- Check `storage/logs/laravel.log` untuk error details
- Enable `APP_DEBUG=true` sementara untuk debug (jangan di production)

## Security Checklist

- [ ] `APP_DEBUG=false` di production
- [ ] `APP_ENV=production` di production
- [ ] APP_KEY sudah di-generate
- [ ] Database password yang kuat
- [ ] SEED_ADMIN_PASSWORD yang kuat
- [ ] SSL certificate installed
- [ ] Backup database secara berkala
- [ ] Update Laravel dan dependencies secara berkala

## Dukungan & Bantuan

Untuk issue atau pertanyaan, silakan buka issue di GitHub repository.

Happy deploying! 🚀
