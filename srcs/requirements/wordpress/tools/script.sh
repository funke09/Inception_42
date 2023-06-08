# #!/bin/sh
# cat << EOF > /var/www/wp-config.php
# <?php
# define( 'DB_NAME', '$MYSQL_DATABASE' );
# define( 'DB_USER', '$MYSQL_USER' );
# define( 'DB_PASSWORD', '$MYSQL_PASSWORD' );
# define( 'DB_HOST', 'mariadb' );
# define( 'DB_CHARSET', 'utf8' );
# define( 'DB_COLLATE', '' );
# define('FS_METHOD','direct');
# \$table_prefix = 'wp_';
# define( 'WP_DEBUG', false );
# define( 'WP_REDIS_HOST', 'redis' );
# define( 'WP_REDIS_PORT', 6379 );
# define( 'WP_CACHE', true );
# if ( ! defined( 'ABSPATH' ) ) {
# define( 'ABSPATH', __DIR__ . '/' );}
# require_once ABSPATH . 'wp-settings.php';
# EOF

# Download WordPress Core
wp core download --allow-root

# Create the database
wp db create --allow-root

# Configure WordPress
wp config set --allow-root WP_CACHE_KEY_SALT 'zcherrad.42.fr'
wp config set --allow-root WP_CACHE 'true' 
wp config set --allow-root WP_REDIS_HOST 'redis' 
wp config set --allow-root WP_REDIS_PORT '6379'

# Install necessary plugins
wp plugin install --allow-root redis-cache --activate 
wp redis enable --allow-root

# Install WordPress
wp core install \
    --url=$WP_URL \
    --title=$WP_TITLE \
    --admin_user=$WP_ADMIN_USER \
    --admin_password=$WP_ADMIN_PASS \
    --admin_email=$WP_ADMIN_EMAIL \
    --allow-root

# Create a user
wp user create $WP_USER $WP_USER_EMAIL  \
    --user_pass=$WP_PASS \
    --role=$WP_ROLE \
    --allow-root

# Set appropriate file permissions
chmod -R 777 /var/www/html/*

# Restart PHP-FPM (replace with appropriate command for your system)
service php-fpm restart
# Open browser to WordPress URL
xdg-open $WP_URL


