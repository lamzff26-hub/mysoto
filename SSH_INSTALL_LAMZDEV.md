# 🚀 INSTALL KE SSH CPANEL - soto.lamzdev.my.id

**Subdomain:** soto.lamzdev.my.id  
**Database:** lamzdev_s  
**DB Username:** lamzdev_soto  
**DB Password:** Alam200311  
**Admin Email:** admin@gmail.com  
**Admin Password:** password  

---

## 🎯 LANGKAH INSTALASI VIA SSH (7 STEP)

### ═══════════════════════════════════════════════════════════════
### STEP 1: CONNECT VIA SSH (1 menit)
### ═══════════════════════════════════════════════════════════════

**Buka Terminal/Command Prompt/PowerShell & ketik:**

```bash
ssh username@your-hosting.com
```

**Ganti:**
- `username` = username hosting Anda
- `your-hosting.com` = host cpanel Anda (contoh: lamzdev.my.id)

**Contoh:**
```bash
ssh lamzdev@lamzdev.my.id
```

**Tekan Enter, lalu masukkan password hosting Anda**

**Jika berhasil connect, Anda akan lihat:**
```bash
user@server [~]#
```

✅ **Confirm: Sudah connect ke SSH? Reply: YES atau COPY-PASTE terminal output**

---

### ═══════════════════════════════════════════════════════════════
### STEP 2: BUAT & MASUK FOLDER SUBDOMAIN (1 menit)
### ═══════════════════════════════════════════════════════════════

**Setelah connected, jalankan:**

```bash
cd public_html
ls -la
```

**Verify folder `soto.lamzdev.my.id` ada:**
- Jika ada, masuk ke folder:
  ```bash
  cd soto.lamzdev.my.id
  ```

- Jika tidak ada, buat dulu:
  ```bash
  mkdir -p soto.lamzdev.my.id
  cd soto.lamzdev.my.id
  ```

**Verify Anda di folder yang benar:**

```bash
pwd
```

**Output seharusnya:**
```bash
/home/username/public_html/soto.lamzdev.my.id
```

**Folder ini sekarang KOSONG - project akan clone langsung ke sini!**

---

### ═══════════════════════════════════════════════════════════════
### STEP 3: CLONE PROJECT LANGSUNG KE FOLDER INI (3 menit)
### ═══════════════════════════════════════════════════════════════

**PENTING: Pastikan Anda sudah di folder `/public_html/soto.lamzdev.my.id`**

**Verify lokasi:**
```bash
pwd
```
(Output harus: `/home/username/public_html/soto.lamzdev.my.id`)

**Jalankan clone dengan `.` (dot) - JANGAN LUPA DOT NYA!**

```bash
git clone https://github.com/lamzff26-hub/mysoto.git .
```

**Penjelasan:**
- `https://github.com/lamzff26-hub/mysoto.git` = URL project
- `.` (dot) = Clone langsung ke folder ini, jangan buat subfolder

**Tunggu sampai selesai!** (ada output banyak tentang clone objects)

**Setelah selesai, verify file sudah ada di folder ini:**

```bash
ls -la
```

**Seharusnya Anda lihat file & folder langsung di folder `/soto.lamzdev.my.id`:**
```
app/
bootstrap/
config/
database/
public/
resources/
routes/
storage/
.env.example
.env.production
.env.lamzdev
composer.json
package.json
artisan
install.sh
...
```

✅ **TIDAK ADA subfolder `mysoto/` - semua file langsung di folder `/soto.lamzdev.my.id`**

---

### ═══════════════════════════════════════════════════════════════
### STEP 4: SETUP FILE .ENV (1 menit)
### ═══════════════════════════════════════════════════════════════

**Download file `.env.lamzdev` dari GitHub ke server:**

```bash
wget https://raw.githubusercontent.com/lamzff26-hub/mysoto/main/.env.lamzdev -O .env
```

**Atau copy dari file yang sudah ada:**

```bash
cp .env.example .env
```

**Verify file .env ada:**

```bash
cat .env | head -20
```

**Seharusnya muncul:**
```
APP_NAME=Soto
APP_ENV=production
APP_DEBUG=false
APP_URL=https://soto.lamzdev.my.id
...
```

✅ **File .env sudah siap!**

---

### ═══════════════════════════════════════════════════════════════
### STEP 5: SET FOLDER PERMISSIONS (1 menit)
### ═══════════════════════════════════════════════════════════════

**Jalankan semua command ini:**

```bash
chmod -R 775 storage
chmod -R 755 storage/app
chmod -R 775 bootstrap/cache
chmod -R 755 public
mkdir -p storage/app/private storage/framework/cache storage/framework/sessions storage/logs
```

**Verify:**

```bash
ls -ld storage bootstrap/cache public
```

---

### ═══════════════════════════════════════════════════════════════
### STEP 6: JALANKAN AUTO INSTALLER (10-15 menit)
### ═══════════════════════════════════════════════════════════════

**INI ADALAH LANGKAH PALING PENTING!**

```bash
bash install.sh
```

**Tunggu sampai selesai!** ⏳

**Output akan menampilkan:**
```
╔════════════════════════════════════════════════════════════════╗
║          🚀 Soto Laravel Installation Script                  ║
║               Subdomain: soto.lamzdev.my.id                   ║
╚════════════════════════════════════════════════════════════════╝

[Step 1/8] Setting up environment file... ✓
[Step 2/8] Creating required directories... ✓
[Step 3/8] Setting folder permissions... ✓
[Step 4/8] Installing PHP dependencies (composer)... 
```

**Ini akan berjalan ~10-15 menit. JANGAN INTERRUPT!**

**Ketika selesai, Anda akan lihat:**
```
╔════════════════════════════════════════════════════════════════╗
║                    ✅ Installation Complete!                  ║
╚════════════════════════════════════════════════════════════════╝

🌐 Frontend: https://soto.lamzdev.my.id
🔐 Admin: https://soto.lamzdev.my.id/admin
Email: admin@example.com
Password: Check .env SEED_ADMIN_PASSWORD
```

✅ **BERHASIL!**

---

### ═══════════════════════════════════════════════════════════════
### STEP 7: TEST APLIKASI (1 menit)
### ═══════════════════════════════════════════════════════════════

**Buka di browser:**

**A. Frontend:**
```
https://soto.lamzdev.my.id
```

**B. Admin Panel:**
```
https://soto.lamzdev.my.id/admin
```

**Login dengan:**
- Email: admin@gmail.com
- Password: password

---

## 📋 COPY-PASTE COMMAND LENGKAP (Jika mau langsung)

**Pastikan Anda sudah di folder PARENT (public_html):**

```bash
cd public_html
```

**Jalankan command lengkap ini (sesuaikan `username` Anda):**

```bash
# Masuk/buat folder subdomain
mkdir -p soto.lamzdev.my.id
cd soto.lamzdev.my.id

# Clone project (dengan DOT di akhir - PENTING!)
git clone https://github.com/lamzff26-hub/mysoto.git .

# Setup .env
wget https://raw.githubusercontent.com/lamzff26-hub/mysoto/main/.env.lamzdev -O .env

# Set permissions
chmod -R 775 storage bootstrap/cache
chmod -R 755 public storage/app
mkdir -p storage/app/private storage/framework/cache storage/framework/sessions storage/logs

# Run installer
bash install.sh
```

**Atau dalam 1 baris (copy-paste semua):**

```bash
cd public_html && mkdir -p soto.lamzdev.my.id && cd soto.lamzdev.my.id && git clone https://github.com/lamzff26-hub/mysoto.git . && wget https://raw.githubusercontent.com/lamzff26-hub/mysoto/main/.env.lamzdev -O .env && chmod -R 775 storage bootstrap/cache && chmod -R 755 public storage/app && mkdir -p storage/app/private storage/framework/cache storage/framework/sessions storage/logs && bash install.sh
```

---

## 🆘 JIKA ADA ERROR

### Error: Folder soto.lamzdev.my.id tidak kosong
```bash
# Hapus file & folder yang ada
cd /home/username/public_html/soto.lamzdev.my.id
rm -rf *

# Atau buat folder baru
cd public_html
rm -rf soto.lamzdev.my.id
mkdir -p soto.lamzdev.my.id
cd soto.lamzdev.my.id

# Clone lagi
git clone https://github.com/lamzff26-hub/mysoto.git .
```

### Error: "fatal: destination path '.' already exists and is not an empty directory"
- Folder sudah ada file
- Hapus dulu file yang ada, atau gunakan folder kosong baru

```bash
# Opsi 1: Hapus file yang ada
cd soto.lamzdev.my.id
rm -rf *
git clone https://github.com/lamzff26-hub/mysoto.git .

# Opsi 2: Pindah ke folder baru
cd public_html
rm -rf soto.lamzdev.my.id
mkdir soto.lamzdev.my.id
cd soto.lamzdev.my.id
git clone https://github.com/lamzff26-hub/mysoto.git .
```

### Error: "bash: git: command not found"
```bash
# Git tidak terinstall, gunakan wget instead:
cd /home/username/public_html/soto.lamzdev.my.id
wget https://github.com/lamzff26-hub/mysoto/archive/refs/heads/main.zip
unzip main.zip
mv mysoto-main/* .
rmdir mysoto-main
rm main.zip
```

### Error: "bash: npm: command not found"
- Skip npm, tapi features yang memerlukan asset build tidak akan berfungsi optimal
- Hubungi hosting untuk install Node.js

### Error: "bash: php: command not found"
- Hosting Anda tidak support PHP
- Hubungi support untuk verify PHP terinstall

### Error database connection?
```bash
# Verify credentials di .env:
cat .env | grep DB_

# Seharusnya:
# DB_DATABASE=lamzdev_s
# DB_USERNAME=lamzdev_soto
# DB_PASSWORD=Alam200311

# Jika error, edit .env:
nano .env
```

### Blank page saat akses?
```bash
# Cek error logs:
tail -50 storage/logs/laravel.log

# Atau reset cache:
php artisan cache:clear
php artisan view:clear
php artisan config:cache
```

---

## ✅ CHECKLIST SETELAH SELESAI

- [ ] SSH sudah connect
- [ ] Masuk folder `/soto.lamzdev.my.id`
- [ ] Project sudah clone dari GitHub
- [ ] File `.env` sudah ada & benar
- [ ] Permissions sudah diset
- [ ] `bash install.sh` sudah selesai (tanpa error)
- [ ] Bisa akses `https://soto.lamzdev.my.id`
- [ ] Bisa akses admin panel & login
- [ ] **INSTALASI SELESAI! 🎉**

---

## 🚀 APLIKASI SIAP DIGUNAKAN

**URL Aplikasi:**
```
Frontend: https://soto.lamzdev.my.id
Admin: https://soto.lamzdev.my.id/admin
```

**Login Admin:**
```
Email: admin@gmail.com
Password: password
```

**Login Kasir (untuk testing):**
```
Email: kasir@example.com
Password: Alam200311
```

---

## 📞 SUPPORT

Jika ada pertanyaan atau error, **bilang:**
1. Step berapa yang error?
2. Error message lengkap?
3. Output dari `tail -50 storage/logs/laravel.log`?

Saya siap bantu! 😊

---

**Ready to install? Mari kita mulai dari STEP 1!** 🚀
