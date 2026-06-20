#!/bin/bash

# ========================================
# Soto Installation Script for Arenhost
# ========================================
# Run this script after uploading project
# Command: bash install.sh

set -e

echo "╔════════════════════════════════════════════════════════════════╗"
echo "║          🚀 Soto Laravel Installation Script                  ║"
echo "║               Subdomain: soto.serviceacjombang.com             ║"
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Step 1: Copy environment file
echo -e "${BLUE}[Step 1/8]${NC} Setting up environment file..."
if [ -f ".env.production" ]; then
    cp .env.production .env
    echo -e "${GREEN}✓${NC} .env file created"
else
    echo -e "${RED}✗${NC} .env.production not found!"
    exit 1
fi
echo ""

# Step 2: Create required directories
echo -e "${BLUE}[Step 2/8]${NC} Creating required directories..."
mkdir -p storage/app/private
mkdir -p storage/framework/cache
mkdir -p storage/framework/sessions
mkdir -p storage/logs
mkdir -p bootstrap/cache
echo -e "${GREEN}✓${NC} Directories created"
echo ""

# Step 3: Set permissions
echo -e "${BLUE}[Step 3/8]${NC} Setting folder permissions..."
chmod -R 775 storage
chmod -R 755 storage/app
chmod -R 775 bootstrap/cache
chmod -R 755 public
chmod -R 775 database
echo -e "${GREEN}✓${NC} Permissions set"
echo ""

# Step 4: Install Composer dependencies
echo -e "${BLUE}[Step 4/8]${NC} Installing PHP dependencies (composer)..."
echo "This may take 2-3 minutes..."
if command -v composer &> /dev/null; then
    composer install --no-dev --optimize-autoloader
    echo -e "${GREEN}✓${NC} Composer dependencies installed"
else
    echo -e "${YELLOW}⚠${NC} Composer not found. Trying /usr/local/bin/composer..."
    /usr/local/bin/composer install --no-dev --optimize-autoloader || {
        echo -e "${RED}✗${NC} Composer installation failed!"
        exit 1
    }
fi
echo ""

# Step 5: Install NPM dependencies and build assets
echo -e "${BLUE}[Step 5/8]${NC} Installing Node dependencies (npm)..."
if command -v npm &> /dev/null; then
    npm install
    echo -e "${GREEN}✓${NC} NPM dependencies installed"
    
    echo -e "${BLUE}[Step 5/8 continued]${NC} Building production assets..."
    npm run build
    echo -e "${GREEN}✓${NC} Assets built"
else
    echo -e "${YELLOW}⚠${NC} NPM not installed. Skipping asset build..."
    echo "   Note: You may need to build assets manually later"
fi
echo ""

# Step 6: Generate application key
echo -e "${BLUE}[Step 6/8]${NC} Generating application key..."
php artisan key:generate
echo -e "${GREEN}✓${NC} Application key generated"
echo ""

# Step 7: Run migrations
echo -e "${BLUE}[Step 7/8]${NC} Running database migrations..."
php artisan migrate --force
echo -e "${GREEN}✓${NC} Migrations completed"
echo ""

# Step 8: Seed database
echo -e "${BLUE}[Step 8/8]${NC} Seeding database with initial data..."
php artisan db:seed
echo -e "${GREEN}✓${NC} Database seeded"
echo ""

# Final: Cache optimization
echo -e "${BLUE}[Optimization]${NC} Caching configuration & routes..."
php artisan config:cache
php artisan route:cache
php artisan view:cache
php artisan cache:clear
echo -e "${GREEN}✓${NC} Caching completed"
echo ""

# Summary
echo "╔════════════════════════════════════════════════════════════════╗"
echo -e "${GREEN}║                    ✅ Installation Complete!${NC}                  ║"
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""
echo -e "${BLUE}📌 Next Steps:${NC}"
echo "   1. Access: https://soto.serviceacjombang.com"
echo "   2. Admin:  https://soto.serviceacjombang.com/admin"
echo "   3. Email:  admin@example.com"
echo "   4. Password: Check .env SEED_ADMIN_PASSWORD"
echo ""
echo -e "${YELLOW}⚠️  Important:${NC}"
echo "   • Keep .env file secure (don't commit to git)"
echo "   • Backup your database regularly"
echo "   • Setup cron jobs (see ARENHOST_SETUP_GUIDE.md)"
echo ""
