# ✅ DEPLOYMENT CHECKLIST - MySoto ke soto.lamzdev.my.id

## 📋 PRE-DEPLOYMENT CHECK

- [ ] Code sudah di-commit dan di-push ke GitHub
- [ ] SSH credentials siap (username: `lamzdevm`, host: `lamzdev.my.id`)
- [ ] Password hosting siap untuk masuk SSH
- [ ] Internet connection stabil
- [ ] Terminal/PowerShell terbuka

---

## 🚀 DEPLOYMENT STEPS

### Phase 1: SSH Connection (5 menit)

- [ ] Buka Terminal/PowerShell di Windows
- [ ] Jalankan: `ssh lamzdevm@lamzdev.my.id`
- [ ] Masukkan password hosting Anda
- [ ] Verifikasi connected (prompt berubah menjadi `user@server [~]#`)

### Phase 2: Navigate & Pull Code (3 menit)

Setelah SSH connected, jalankan commands berikut:

- [ ] Command 1: `cd public_html/soto.lamzdev.my.id`
- [ ] Command 2: `pwd` (verify lokasi)
- [ ] Command 3: `git pull origin main` (pull latest code)
- [ ] Tunggu sampai selesai

### Phase 3: Run Installation (10-15 menit)

- [ ] Command: `bash install.sh`
- [ ] Tunggu sampai selesai (JANGAN INTERRUPT!)
- [ ] Lihat output untuk verifikasi setiap step:
  - [ ] Step 1: Setting up environment file ✓
  - [ ] Step 2: Creating required directories ✓
  - [ ] Step 3: Setting folder permissions ✓
  - [ ] Step 4: Installing PHP dependencies ✓
  - [ ] Step 5: Installing Node dependencies ✓
  - [ ] Step 6: Generating application key ✓
  - [ ] Step 7: Running database migrations ✓
  - [ ] Step 8: Seeding database ✓

### Phase 4: Verify Deployment (3 menit)

Setelah installer selesai, test aplikasi:

- [ ] Buka browser: `https://soto.lamzdev.my.id` (Frontend)
- [ ] Verifikasi halaman loading dengan baik
- [ ] Buka: `https://soto.lamzdev.my.id/admin` (Admin Panel)
- [ ] Login dengan:
  - Email: `admin@gmail.com`
  - Password: `password`
- [ ] Verifikasi admin panel dapat diakses

### Phase 5: Final Checks (2 menit)

- [ ] Frontend dapat diakses
- [ ] Admin panel dapat diakses  
- [ ] Login berhasil
- [ ] Database terisi dengan data seed
- [ ] No error di halaman

---

## 📊 DEPLOYMENT TIMELINE

| Phase | Est. Time | Status |
|-------|-----------|--------|
| SSH Connection | 5 min | ⏳ |
| Navigate & Pull | 3 min | ⏳ |
| Installation | 10-15 min | ⏳ |
| Verification | 3 min | ⏳ |
| **TOTAL** | **~25 min** | 🔄 |

---

## 🆘 TROUBLESHOOTING

### SSH Connection Error: "Connection refused"
```
❌ Problem: Tidak bisa connect ke SSH
✅ Solution:
   1. Cek username & host: lamzdevm@lamzdev.my.id
   2. Cek internet connection
   3. Hubungi hosting support jika masih error
```

### Git Command Not Found
```
❌ Problem: git: command not found
✅ Solution:
   1. Hubungi hosting support untuk install git
   2. Atau minta mereka clone project manual
```

### Composer Error
```
❌ Problem: composer: command not found
✅ Solution:
   1. Hosting support perlu install composer
   2. Atau install manual via SSH
```

### Database Connection Error
```
❌ Problem: "No connection could be made because the target machine actively refused it"
✅ Solution:
   1. Verifikasi .env database credentials
   2. Check if database sudah created
   3. Jalankan: php artisan migrate --force
```

### File Permission Error
```
❌ Problem: "Permission denied"
✅ Solution:
   cd public_html/soto.lamzdev.my.id
   chmod -R 775 storage bootstrap/cache
   chmod -R 755 public
```

---

## 📝 QUICK REFERENCE - ONE LINER

Jika ingin semua dalam satu command (setelah SSH connected):

```bash
cd public_html/soto.lamzdev.my.id && git pull origin main && bash install.sh
```

---

## 🎯 SUCCESS INDICATORS

✅ **Deployment Successful Jika:**

1. Installer script selesai tanpa error
2. Frontend dapat diakses di https://soto.lamzdev.my.id
3. Admin panel dapat diakses di https://soto.lamzdev.my.id/admin
4. Login berhasil dengan admin@gmail.com / password
5. Dashboard menampilkan data
6. Tidak ada error notification

---

## 📞 NEXT STEPS

Setelah deployment berhasil:

1. **Database Backup**: `php artisan backup:run`
2. **Monitor Logs**: `tail -f storage/logs/laravel.log`
3. **Performance**: `php artisan config:cache`
4. **Clear Cache**: `php artisan cache:clear`
5. **Test Payment Gateway** (jika ada)

---

## 📌 IMPORTANT NOTES

- **DO NOT INTERRUPT** installer script
- **DO NOT DELETE** any files during deployment
- **DATABASE**: Akan auto-created jika belum ada
- **ADMIN PASSWORD**: Bisa dirubah setelah login di admin panel
- **EMAIL**: Ganti di .env file sebelum deploy jika perlu
- **HTTPS**: Pastikan SSL certificate sudah aktif di cPanel

---

Generated: 2026-06-21
Status: Ready for Deployment ✅
