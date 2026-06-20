# Deploy Script for MySoto - PowerShell Edition

param(
    [string]$SSHUser = "lamzdevm",
    [string]$SSHHost = "lamzdev.my.id",
    [string]$ProjectPath = "/public_html/soto.lamzdev.my.id"
)

Write-Host "======================================" -ForegroundColor Cyan
Write-Host "🚀 MySoto Deployment Script" -ForegroundColor Green
Write-Host "======================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "SSH User: $SSHUser@$SSHHost" -ForegroundColor Yellow
Write-Host "Project Path: $ProjectPath" -ForegroundColor Yellow
Write-Host ""

# Check if SSH is available
try {
    $sshCheck = ssh -V 2>&1
    Write-Host "✓ SSH available: $sshCheck" -ForegroundColor Green
} catch {
    Write-Host "✗ SSH not available. Please install OpenSSH." -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "Press Enter to continue or Ctrl+C to cancel..."
Read-Host

# Step 1: Test SSH connection
Write-Host ""
Write-Host "[Step 1/3] Testing SSH connection..." -ForegroundColor Cyan
ssh $SSHUser@$SSHHost "echo 'SSH connection successful!'"
if ($LASTEXITCODE -ne 0) {
    Write-Host "✗ SSH connection failed!" -ForegroundColor Red
    exit 1
}
Write-Host "✓ SSH connection successful!" -ForegroundColor Green

# Step 2: Pull latest code
Write-Host ""
Write-Host "[Step 2/3] Pulling latest code from GitHub..." -ForegroundColor Cyan
ssh $SSHUser@$SSHHost "cd $ProjectPath && git pull origin main"
if ($LASTEXITCODE -ne 0) {
    Write-Host "✗ Git pull failed!" -ForegroundColor Red
    exit 1
}
Write-Host "✓ Code pulled successfully!" -ForegroundColor Green

# Step 3: Run installer
Write-Host ""
Write-Host "[Step 3/3] Running installation script (this may take 10-15 minutes)..." -ForegroundColor Cyan
Write-Host "⏳ Please wait..." -ForegroundColor Yellow
ssh $SSHUser@$SSHHost "cd $ProjectPath && bash install.sh"
if ($LASTEXITCODE -ne 0) {
    Write-Host "✗ Installation failed!" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "======================================" -ForegroundColor Green
Write-Host "✅ Deployment Successful!" -ForegroundColor Green
Write-Host "======================================" -ForegroundColor Green
Write-Host ""
Write-Host "🌐 Visit your application:" -ForegroundColor Cyan
Write-Host "   Frontend: https://soto.lamzdev.my.id" -ForegroundColor Green
Write-Host "   Admin: https://soto.lamzdev.my.id/admin" -ForegroundColor Green
Write-Host ""
Write-Host "📝 Login credentials:" -ForegroundColor Cyan
Write-Host "   Email: admin@gmail.com" -ForegroundColor Green
Write-Host "   Password: password" -ForegroundColor Green
Write-Host ""
