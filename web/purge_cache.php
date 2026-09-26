<?php
// Reemplaza esto con un token largo y aleatorio
$token_esperado = "2e355107d48003c04716153401d5c99427647b1";

if (!isset($_GET['token']) || $_GET['token'] !== $token_esperado) {
    http_response_code(403);
    die('Acceso denegado');
}

// Purga LiteSpeed (El motor de caché usado en el 90% de los cPanel)
header("X-LiteSpeed-Purge: *");

// Si usas OPcache en PHP, también lo limpiamos por si acaso
if (function_exists('opcache_reset')) {
    opcache_reset();
}

echo "Caché de cPanel purgado exitosamente.";
?>