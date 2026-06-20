# 🚀 PANDUAN INSTALL KE ARENHOST (SUPER MUDAH)

**Subdomain:** soto.serviceacjombang.com  
**Database:** mysoto  
**Username DB:** servicea_s  
**Password DB:** Alam200311  

---

## 📋 PERSIAPAN: Apa yang Anda butuhkan?

- ✅ Akun Arenhost dengan cPanel
- ✅ Subdomain sudah dibuat: `soto.serviceacjombang.com`
- ✅ Database sudah dibuat: `mysoto`
- ✅ User database sudah dibuat: `servicea_s` dengan password `Alam200311`
- ✅ Software Filezilla (atau FTP client lain) - Download gratis di https://filezilla-project.org/
- ✅ Project sudah siap di GitHub: https://github.com/lamzff26-hub/mysoto

---

## 🎯 LANGKAH INSTALASI (5 STEP MUDAH)

### ═══════════════════════════════════════════════════════════════
### STEP 1: DOWNLOAD PROJECT DARI GITHUB (5 menit)
### ═══════════════════════════════════════════════════════════════

**A. Buka GitHub:**
1. Pergi ke: https://github.com/lamzff26-hub/mysoto
2. Klik tombol hijau **"Code"**
3. Pilih **"Download ZIP"**
4. File akan download (nama: `mysoto-main.zip`)

**B. Extract file:**
1. Cari file `mysoto-main.zip` di komputer
2. Klik kanan → **"Extract All"**
3. Pilih folder untuk extract

Sekarang Anda punya folder `mysoto-main/` dengan semua file project.

---

### ═══════════════════════════════════════════════════════════════
### STEP 2: SETUP FILEZILLA (3 menit)
### ═══════════════════════════════════════════════════════════════

**A. Ambil FTP Info dari cPanel Arenhost:**
1. Login ke cPanel: https://cpanel.arenhost.com
2. Username: (username hosting Anda)
3. Password: (password hosting Anda)

4. Setelah login, cari menu **"FTP Accounts"** atau **"FTP Connections"**

5. Catat informasi:
   ```
   Host/Server: ftp.arenhost.com
   Username: (biasanya format: username atau username@yourdomain.com)
   Password: (FTP password Anda)
   Port: 21 (standar)
   ```

**B. Setup Filezilla:**
1. Buka Filezilla
2. Klik menu **"File"** → **"Site Manager"**
3. Klik tombol **"New Site"**
4. Isi data:
   ```
   Name: Arenhost Soto (bisa nama apapun)
   Host: ftp.arenhost.com
   Protocol: FTP - File Transfer Protocol
   Port: 21
   Logon Type: Normal
   User: [username FTP dari cPanel]
   Password: [password FTP dari cPanel]
   ```
5. Klik **"Connect"**

**Jika berhasil:**
- Sebelah kanan Filezilla akan tampil folder hosting Anda
- Biasanya ada folder `public_html`

---

### ═══════════════════════════════════════════════════════════════
### STEP 3: UPLOAD PROJECT KE HOSTING (15 menit)
### ═══════════════════════════════════════════════════════════════

**A. Navigate ke folder subdomain di Filezilla:**
1. Di sebelah kanan Filezilla, buka folder: `public_html`
2. Cari folder: `soto.serviceacjombang.com`
3. Masuk ke dalam folder tersebut

**B. Upload file project:**
1. **Sebelah kiri Filezilla:** buka folder `mysoto-main` (hasil extract)
2. **Sebelah kanan Filezilla:** sudah di folder `soto.serviceacjombang.com`

3. **Pilih SEMUA file di folder sebelah kiri:**
   - Klik di file area sebelah kiri
   - Tekan **`Ctrl + A`** (select all)
   - Semua file akan highlight (warna biru)

4. **Drag file ke sebelah kanan (atau klik kanan → Upload):**
   - Drag dari sebelah kiri
   - Drop ke sebelah kanan Filezilla
   
5. **Tunggu proses upload:**
   - Ada tab "Transfers" di bawah yang menunjukkan progress
   - Tergantung kecepatan internet: 5-15 menit

**Upload selesai ketika:**
- Tidak ada file yang di-transfer lagi
- Semua folder sudah muncul di sebelah kanan

---

### ═══════════════════════════════════════════════════════════════
### STEP 4: SETUP FILE .ENV (5 menit)
### ═══════════════════════════════════════════════════════════════

**A. Via cPanel File Manager (Recommended):**

1. Login cPanel: https://cpanel.arenhost.com
2. Cari menu: **"File Manager"** atau **"File Manager"**
3. Klik buka

4. Navigate ke: `/public_html/soto.serviceacjombang.com`

5. Di folder tersebut, cari file: **`.env.production`**

6. **Copy file `.env.production`:**
   - Klik kanan `.env.production`
   - Pilih **"Copy"**
   - Klik kanan di area kosong
   - Pilih **"Paste"**

7. **Rename file yang di-copy:**
   - Klik kanan file copy
   - Pilih **"Rename"**
   - Ubah nama dari `env.production.copy` menjadi **`.env`**
   - Tekan Enter

**Sekarang sudah ada 2 file:**
- `.env.production` (original)
- `.env` (hasil copy, ini yang akan dipakai)

**B. Verify file `.env` sudah benar:**

1. Klik kanan `.env`
2. Pilih **"Edit"** atau **"Code Editor"**
3. Lihat isinya:

   ```env
   APP_NAME=Soto
   APP_ENV=production
   APP_DEBUG=false
   APP_URL=https://soto.serviceacjombang.com
   
   DB_CONNECTION=mysql
   DB_HOST=localhost
   DB_PORT=3306
   DB_DATABASE=mysoto
   DB_USERNAME=servicea_s
   DB_PASSWORD=Alam200311
   ```

4. **Jika semuanya benar, close editor**
5. Jika ada yang salah, edit & perbaiki

---

### ═══════════════════════════════════════════════════════════════
### STEP 5: REQUEST SSH ACCESS KE SUPPORT ARENHOST ⚠️ PENTING!
### ═══════════════════════════════════════════════════════════════

**Files sudah upload & .env sudah siap, tapi masih perlu:**
- ❌ Jalankan Composer (install PHP dependencies)
- ❌ Jalankan NPM (install Node dependencies)
- ❌ Database migrations
- ❌ Seeding data

**Ini HANYA bisa via SSH/Terminal!**

**Solusi: Hubungi support Arenhost**

**A. Buka Arenhost Support:**
1. Login: https://www.arenhost.com (atau panel support Arenhost)
2. Buka **"Ticket Support"** atau **"Live Chat"**

**B. Kirim pesan:**
   ```
   Subject: Mohon Enable SSH Access & Install Composer + Node.js

   Pesan:
   Saya ingin deploy aplikasi Laravel ke:
   - Subdomain: soto.serviceacjombang.com
   - Database: mysoto
   
   Saya butuh:
   1. Enable SSH Access (untuk menjalankan installer script)
   2. Install PHP Composer CLI
   3. Install Node.js & npm
   
   Akun saya: [username hosting Anda]
   
   Terima kasih.
   ```

**C. Tunggu approval:**
- Biasanya: **30 menit - 2 jam**
- Support akan reply saat selesai

**Setelah SSH diapprove, lanjut ke STEP 6 ⬇️**

---

### ═══════════════════════════════════════════════════════════════
### STEP 6: INSTALL VIA SSH (Setelah SSH diapprove)
### ═══════════════════════════════════════════════════════════════

**A. Buka SSH/Terminal:**

**Opsi 1 - Via cPanel Terminal:**
1. Login cPanel Arenhost
2. Cari menu: **"Terminal"** atau **"Advanced → Terminal"**
3. Klik buka

**Opsi 2 - Via SSH Client (Command line):**
1. Buka Command Prompt / Terminal / PowerShell
2. Ketik:
   ```bash
   ssh username@arenhost.com
   ```
   (Ganti `username` dengan username hosting Anda)
3. Tekan Enter
4. Masukkan password hosting

**B. Jalankan perintah instalasi:**

```bash
# Masuk ke folder project
cd public_html/soto.serviceacjombang.com

# Jalankan auto installer (PALING MUDAH)
bash install.sh
```

**Tunggu sampai selesai!** ⏳

Output akan seperti:
```
[Step 1/8] Setting up environment file... ✓
[Step 2/8] Creating required directories... ✓
[Step 3/8] Setting folder permissions... ✓
[Step 4/8] Installing PHP dependencies... ✓
[Step 5/8] Installing Node dependencies... ✓
[Step 6/8] Generating application key... ✓
[Step 7/8] Running database migrations... ✓
[Step 8/8] Seeding database... ✓
[Optimization] Caching configuration... ✓

✅ Installation Complete!
```

**Jika selesai tanpa error = BERHASIL! 🎉**

---

### ═══════════════════════════════════════════════════════════════
### STEP 7: TEST APLIKASI (1 menit)
### ═══════════════════════════════════════════════════════════════

**A. Buka di browser:**

1. **Frontend:** https://soto.serviceacjombang.com
   - Seharusnya tamampil halaman landing Soto

2. **Admin Panel:** https://soto.serviceacjombang.com/admin
   - Email: admin@example.com
   - Password: Alam200311 (dari .env SEED_ADMIN_PASSWORD)

3. **Jika muncul halaman:** ✅ BERHASIL!

---

## 🎯 RINGKASAN TOTAL WAKTU

| No | Step | Waktu |
|----|------|-------|
| 1 | Download GitHub | 5 min |
| 2 | Setup Filezilla | 3 min |
| 3 | Upload via FTP | 15 min |
| 4 | Setup .env | 5 min |
| 5 | Request SSH | Instant |
| - | **Tunggu SSH Approval** | **30min - 2h** |
| 6 | Install via SSH | 10 min |
| 7 | Test aplikasi | 1 min |
| **TOTAL** | | **~40 min** |

---

## 🆘 JIKA ADA ERROR

### Error saat upload FTP?
- **Cek:** Folder `/public_html/soto.serviceacjombang.com` sudah ada?
- **Solusi:** Buat folder dulu via cPanel File Manager

### File .env tidak bisa di-edit?
- **Cek:** Permissions folder (biasanya 755)
- **Solusi:** Hubungi support Arenhost untuk fix permissions

### Error saat jalankan `bash install.sh`?
- **Cek:** SSH sudah benar-benar diapprove?
- **Cek:** Di folder yang benar? (`cd public_html/soto.serviceacjombang.com`)
- **Cek:** File `install.sh` sudah upload?

### Admin panel tidak bisa diakses?
- **Cek:** Database sudah di-seed? (seharusnya ada di log installer)
- **Cek:** File `.env` sudah benar?

### Database connection error?
- **Cek:** Credentials di .env:
  ```bash
  DB_DATABASE=mysoto
  DB_USERNAME=servicea_s
  DB_PASSWORD=Alam200311
  ```
- **Cek:** Database sudah dibuat di cPanel MySQL Databases

---

## 📞 JIKA MASIH STUCK

Jika ada step yang tidak jelas, **bilang nomor STEP berapa** dan saya guide lebih detail!

**Contoh:**
- "Saya stuck di STEP 2, gimana setup Filezilla?"
- "Error di STEP 6, SSH tidak work"
- "Folder soto.serviceacjombang.com tidak ada"

---

## ✅ CHECKLIST SELESAI

- [ ] Project download dari GitHub
- [ ] Filezilla sudah connect ke server
- [ ] Semua file sudah upload via FTP
- [ ] File `.env` sudah dibuat
- [ ] Support Arenhost sudah enable SSH
- [ ] Auto installer sudah jalan (`bash install.sh`)
- [ ] Database sudah ter-setup
- [ ] Admin bisa login
- [ ] **APLIKASI SIAP DIGUNAKAN! 🎉**

---

## 🚀 APLIKASI SUDAH LIVE!

**Akses aplikasi Anda:**
- 🔗 Frontend: https://soto.serviceacjombang.com
- 🔐 Admin: https://soto.serviceacjombang.com/admin

**Admin Credentials:**
- Email: admin@example.com
- Password: Alam200311

**Kasir Credentials (untuk testing):**
- Email: kasir@example.com
- Password: Alam200311

---

**Happy deploying! 🎊**

Jika ada pertanyaan di step manapun, jangan ragu tanya saya! 😊
