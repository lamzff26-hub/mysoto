# ⚡ QUICK FIX ONE-LINER

Setelah SSH connected ke `lamzdevm@lamzdev.my.id`, copy-paste command ini:

```bash
cd public_html/soto.lamzdev.my.id && php artisan cache:clear && php artisan config:clear && php artisan route:clear && php artisan view:clear && php artisan config:cache && php artisan route:cache && echo "✅ Caches cleared and rebuilt!"
```

**Atau jalankan setiap command terpisah:**

```bash
cd public_html/soto.lamzdev.my.id
php artisan cache:clear
php artisan config:clear
php artisan route:clear
php artisan view:clear
php artisan config:cache
php artisan route:cache
```

---

## After Running Commands

1. **Hard refresh browser** with `Ctrl+Shift+R`
2. **Visit:** https://soto.lamzdev.my.id/login
3. **Expected:** Login form should appear (NOT 404)

---

## Still Getting 404?

Check DocumentRoot configuration:

```bash
# Check where DocumentRoot is pointing
cat /etc/trueuserdomains | grep soto.lamzdev.my.id

# Or manually fix via cPanel - it should be:
# /home/lamzdevm/public_html/soto.lamzdev.my.id/public
```

---

## Backup Plan

If nothing works, recreate folder structure:

```bash
cd public_html

# Backup old
mv soto.lamzdev.my.id soto.lamzdev.my.id.backup

# Create new folder
mkdir -p soto.lamzdev.my.id/public
cd soto.lamzdev.my.id

# Clone again
git clone https://github.com/lamzff26-hub/mysoto.git temp
mv temp/* .
mv temp/.* .
rmdir temp

# Run installer
bash install.sh
```

---

## If You Get "File listing" at /

The issue is DocumentRoot. Contact cPanel support and ask them to:

**Set DocumentRoot for subdomain `soto.lamzdev.my.id` to:**
```
/home/lamzdevm/public_html/soto.lamzdev.my.id/public
```

**NOT:**
```
/home/lamzdevm/public_html/soto.lamzdev.my.id
```
