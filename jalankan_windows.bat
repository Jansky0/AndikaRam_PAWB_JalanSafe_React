@echo off
title JalanSafe HMVC React - Laravel 11 & React 19 Starter Kit
color 0B
echo ================================================================
echo        APLIKASI JALANSAFE HMVC REACT (LARAVEL 11 + REACT 19)
echo       Tugas Akhir Praktikum PABW - Modul 9 (HMVC, Role, AJAX)
echo ================================================================
echo.

if not exist .env (
    echo [*] Mengatur berkas .env...
    copy .env.example .env > nul
)

if not exist database\database.sqlite (
    echo [*] Menyiapkan database SQLite...
    type nul > database\database.sqlite
    php artisan migrate:fresh --seed
)

echo [*] Memastikan storage symlink terhubung...
php artisan storage:link > nul 2>&1

echo [*] Membersihkan cache konfigurasi...
php artisan config:clear > nul 2>&1
php artisan route:clear > nul 2>&1

echo.
echo ================================================================
echo  Aplikasi SIAP DIGUNAKAN! (Build React SPA sudah terkompilasi)
echo  URL Browser : http://127.0.0.1:8000
echo.
echo  INFORMASI AKUN LOGIN (Sudah Terdaftar di Database):
echo  1. Dinas Bina Marga (Admin) : admin@example.com  (Sandi: password)
echo     - Hak Akses: Kelola Master Ruas Jalan (CRUD Inertia) ^& Verifikasi Status
echo  2. Warga Pelapor (User)    : user@example.com   (Sandi: password)
echo     - Hak Akses: Laporkan Kerusakan Jalan + Foto Bukti (CRUD AJAX)
echo ================================================================
echo.
echo Membuka browser otomatis dan menyalakan server lokal...
start http://127.0.0.1:8000
echo Tekan CTRL+C jika ingin menghentikan server.
echo.
php artisan serve
pause
