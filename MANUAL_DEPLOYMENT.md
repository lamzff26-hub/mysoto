# 🚀 DEPLOYMENT GUIDE - STEP BY STEP

## STEP 1: BUKA TERMINAL (PowerShell atau Command Prompt)

Di Windows, buka:
- **PowerShell** (Tekan `Win + X` → pilih `Terminal` atau `PowerShell`)
- Atau **Command Prompt**

## STEP 2: CONNECT KE SSH

Jalankan command:
```bash
ssh lamzdevm@lamzdev.my.id
```

**Jika diminta password, masukkan password hosting Anda.**

Jika berhasil, akan muncul prompt seperti ini:
```
user@server [~]#
```

## STEP 3: JALANKAN DEPLOYMENT COMMANDS

Setelah connected, copy-paste command di bawah INI SATU PERSATU:

### Command 1: Masuk ke folder project
```bash
cd public_html/soto.lamzdev.my.id
```

**Verify dengan menjalankan:**
```bash
pwd
```

Output harus:
```
/home/lamzdevm/public_html/soto.lamzdev.my.id
```

### Command 2: Pull latest code dari GitHub
```bash
git pull origin main
```

Tunggu sampai selesai. Output akan menunjukkan file yang diupdate:
```
Updating 0da08fa..5195e26
Fast-forward
 ... files changed
```

### Command 3: Jalankan auto installer
```bash
bash install.sh
```

**⏳ INI AKAN MEMAKAN WAKTU 10-15 MENIT - JANGAN INTERRUPT!**

Output akan menunjukkan progress:
```
╔════════════════════════════════════════════════════════════════╗
║          🚀 Soto Laravel Installation Script                  ║
║               Subdomain: soto.lamzdev.my.id                   ║
╚════════════════════════════════════════════════════════════════╝

[Step 1/8] Setting up environment file... ✓
[Step 2/8] Creating required directories... ✓
...
```

**Tunggu sampai selesai dan muncul:**
```
╔════════════════════════════════════════════════════════════════╗
║                    ✅ Installation Complete!                  ║
╚════════════════════════════════════════════════════════════════╝
```

---

## STEP 4: VERIFY DEPLOYMENT

Setelah installer selesai, buka browser dan test aplikasi:

### Frontend:
```
https://soto.lamzdev.my.id
```

### Admin Panel:
```
https://soto.lamzdev.my.id/admin
```

**Login credentials (dari .env):**
- Email: admin@gmail.com
- Password: password

---

## JIKA ADA ERROR

Jalankan command untuk cek error log:
```bash
cd public_html/soto.lamzdev.my.id
tail -f storage/logs/laravel.log
```

Tekan `CTRL+C` untuk keluar dari log viewer.

---

## QUICK REFERENCE - ONE LINER (Setelah SSH connected)

Jika ingin semua command dalam 1 baris:

```bash
cd public_html/soto.lamzdev.my.id && git pull origin main && bash install.sh
```

---

## TROUBLESHOOTING

### Error: "git command not found"
- Server tidak punya git installed
- Hubungi hosting support untuk install git

### Error: "composer not found"
- Server tidak punya composer
- Hubungi hosting support atau install manual

### Database error
- Check .env database credentials
- Pastikan DB user punya permission
- Run: `php artisan migrate --force`

### File permission error
- Run: `chmod -R 775 storage bootstrap/cache`
- Run: `chmod -R 755 public`
