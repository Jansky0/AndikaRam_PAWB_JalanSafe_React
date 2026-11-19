#!/usr/bin/env bash
# ================================================================
# Script Peluncur Otomatis JalanSafe HMVC React (Linux / macOS)
# Tugas Akhir Praktikum PABW - Modul 9 (HMVC React Starter Kit)
# ================================================================

echo "================================================================"
echo "      APLIKASI JALANSAFE HMVC REACT (LARAVEL 11 + REACT 19)"
echo "     Tugas Akhir Praktikum PABW - Modul 9 (HMVC, Role, AJAX)"
echo "================================================================"
echo ""

# Pastikan file .env ada
if [ ! -f .env ]; then
    echo "[*] Membuat berkas .env dari .env.example..."
    cp .env.example .env
fi

# Pastikan database SQLite siap
if [ ! -f database/database.sqlite ]; then
    echo "[*] Membuat dan menginisialisasi database SQLite..."
    touch database/database.sqlite
    php artisan migrate:fresh --seed
fi

# Hubungkan symbolic link storage
echo "[*] Menghubungkan storage symlink..."
php artisan storage:link > /dev/null 2>&1

# Bersihkan cache
echo "[*] Membersihkan cache konfigurasi..."
php artisan config:clear > /dev/null 2>&1
php artisan route:clear > /dev/null 2>&1

echo ""
echo "================================================================"
echo " Aplikasi SIAP DIGUNAKAN! (Build React SPA sudah terkompilasi)"
echo " URL Browser : http://127.0.0.1:8000"
echo ""
echo " INFORMASI AKUN LOGIN (Sudah Terdaftar di Database):"
echo " 1. Dinas Bina Marga (Admin) : admin@example.com  (Sandi: password)"
echo "    - Hak Akses: Kelola Master Ruas Jalan (CRUD Inertia) & Verifikasi"
echo " 2. Warga Pelapor (User)    : user@example.com   (Sandi: password)"
echo "    - Hak Akses: Laporkan Kerusakan Jalan + Foto Bukti (CRUD AJAX)"
echo "================================================================"
echo ""

# Buka browser otomatis jika tersedia
if command -v xdg-open > /dev/null; then
    xdg-open http://127.0.0.1:8000 &
elif command -v open > /dev/null; then
    open http://127.0.0.1:8000 &
fi

echo "Menjalankan server Laravel (tekan CTRL+C untuk berhenti)..."
php artisan serve
