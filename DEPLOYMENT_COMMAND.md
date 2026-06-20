# 🚀 DEPLOYMENT COMMAND - Siap Copy-Paste

## SSH LOGIN
```bash
ssh lamzdevm@soto.lamzdev.my.id
```

## DEPLOYMENT COMMANDS (Jalankan di Server)

Setelah login SSH, copy-paste command di bawah ini:

```bash
cd public_html/soto.lamzdev.my.id
```

Verify lokasi:
```bash
pwd
```

Pull latest code dari GitHub:
```bash
git pull origin main
```

Run installer:
```bash
bash install.sh
```

---

## ONE-LINER COMMAND (Jika sudah SSH login)

```bash
cd public_html/soto.lamzdev.my.id && git pull origin main && bash install.sh
```

---

## Setelah Selesai Deploy

Cek status aplikasi:

```bash
# Check app status
php artisan tinker
>>> exit()
```

Test aplikasi di browser:
- Frontend: https://soto.lamzdev.my.id
- Admin: https://soto.lamzdev.my.id/admin
- Login: admin@gmail.com / password

---

## Jika Ada Error

Cek error logs:
```bash
tail -f storage/logs/laravel.log
```
