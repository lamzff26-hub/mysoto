# 📋 QUICK REFERENCE - COPY-PASTE COMMANDS IN ORDER

## STEP 1: Open Terminal and Connect to SSH

```bash
ssh lamzdevm@lamzdev.my.id
```

**Enter your hosting password when prompted**

---

## STEP 2: Navigate to Project Folder

After SSH connected, paste this command:

```bash
cd public_html/soto.lamzdev.my.id
```

Verify you're in the right location:
```bash
pwd
```

Expected output: `/home/lamzdevm/public_html/soto.lamzdev.my.id`

---

## STEP 3: Pull Latest Code

```bash
git pull origin main
```

Wait for it to complete. You should see:
```
Updating ...
Fast-forward
 ... files changed
```

---

## STEP 4: Run Installation (THIS IS THE MAIN DEPLOYMENT STEP)

```bash
bash install.sh
```

⏳ **WAIT 10-15 MINUTES - DO NOT INTERRUPT!**

You'll see progress output like:
```
[Step 1/8] Setting up environment file... ✓
[Step 2/8] Creating required directories... ✓
...
```

When complete, you'll see:
```
✅ Installation Complete!
```

---

## STEP 5: Verify Deployment

Once installer finishes, open these URLs in your browser:

### Frontend:
```
https://soto.lamzdev.my.id
```

### Admin Panel:
```
https://soto.lamzdev.my.id/admin
```

### Login Credentials:
- Email: admin@gmail.com
- Password: password

---

## 🔧 EXTRA: All in One Line (After SSH Connected)

If you want to do everything in one command:

```bash
cd public_html/soto.lamzdev.my.id && git pull origin main && bash install.sh
```

---

## 🆘 Check Logs if Error

If something goes wrong, check the error log:

```bash
cd public_html/soto.lamzdev.my.id
tail -f storage/logs/laravel.log
```

Press `CTRL+C` to exit log viewer.

---

## ✅ Success = These URLs Work

| URL | Expected |
|-----|----------|
| https://soto.lamzdev.my.id | Homepage loads |
| https://soto.lamzdev.my.id/admin | Admin login page |
| Login with admin@gmail.com | Dashboard shows |

---

**Total Time: ~25 minutes**

Good luck! 🚀
