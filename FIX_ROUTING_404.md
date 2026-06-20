# 🔧 DEPLOYMENT FIX - Routing Issue

## Problem Found
✗ Getting "Index of /" file listing instead of Laravel homepage
✗ /login dan /admin returning 404
✗ DocumentRoot bukan pointing ke `/public` folder

## Solution: Re-configure .htaccess dan Clear Cache

### SSH Command (Jalankan di Terminal):

```bash
ssh lamzdevm@lamzdev.my.id
```

**Setelah connected, copy-paste commands ini satu per satu:**

---

### STEP 1: Navigate ke Project Folder

```bash
cd public_html/soto.lamzdev.my.id
pwd
```

Expected output:
```
/home/lamzdevm/public_html/soto.lamzdev.my.id
```

---

### STEP 2: Clear All Caches

```bash
php artisan cache:clear
php artisan config:clear
php artisan route:clear
php artisan view:clear
```

---

### STEP 3: Rebuild Caches (Production Mode)

```bash
php artisan config:cache
php artisan route:cache
```

---

### STEP 4: Check .htaccess File

Verify .htaccess ada dan contents-nya benar:

```bash
cat public/.htaccess
```

**Output should be:**
```
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

Jika tidak ada atau salah, download dari GitHub:
```bash
wget https://raw.githubusercontent.com/laravel/laravel/main/public/.htaccess -O public/.htaccess
```

---

### STEP 5: Check File Permissions

```bash
chmod 644 public/.htaccess
chmod 755 public
ls -la public/.htaccess
```

---

### STEP 6: Verify public/index.php exists

```bash
ls -la public/index.php
cat public/index.php | head -20
```

Should show Laravel bootstrap code

---

### STEP 7: Test Routing - Clear Browser Cache First!

**After all commands, refresh browser with HARD REFRESH:**

**Windows:**
- Press: `Ctrl + Shift + Delete` (open Clear Browsing Data)
- Or: `Ctrl + Shift + R`
- Or: `Shift + F5`

**Mac:**
- Press: `Cmd + Shift + R`

---

### STEP 8: Test URLs

Try these in browser:

1. **Homepage:** https://soto.lamzdev.my.id
2. **Login:** https://soto.lamzdev.my.id/login
3. **Admin:** https://soto.lamzdev.my.id/admin

Expected: Laravel login form, NOT file listing

---

## If Still Not Working

### Check Web Server Configuration

Ask your hosting provider to verify:

1. **DocumentRoot** should be: `/home/lamzdevm/public_html/soto.lamzdev.my.id/public`
   - NOT: `/home/lamzdevm/public_html/soto.lamzdev.my.id`

2. **mod_rewrite** is enabled (check cPanel > MultiPHP INI Editor)

3. **.htaccess** is writable and not disabled

---

### Check Laravel Logs

```bash
tail -f storage/logs/laravel.log
```

Look for any errors related to routing or configuration.

---

### Alternative: Re-run Install Script

If above doesn't work, re-run install with cache cleanup:

```bash
bash install.sh
```

This will:
- Re-create .env
- Re-setup permissions
- Run migrations
- Re-cache everything

---

## IMPORTANT: Clear Browser Cache!

After fixing, make sure to:
1. Hard refresh browser (`Ctrl+Shift+R` on Windows, `Cmd+Shift+R` on Mac)
2. Clear browser cache completely
3. Or open in Incognito/Private window
