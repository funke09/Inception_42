#!/bin/sh
echo "--------------hereee"
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

echo "--------------hereee"
# Step 2: Download WordPress
# mkdir -p /var/www/
# cd /var/www/
# # wget https://wordpress.org/latest.tar.gz
# # tar -xf latest.tar.gz
# # rm latest.tar.gz

# # Step 3: Set file permissions

# Step 4: Install WordPress
wp core download --allow-root --path=/var/www
# php /var/www/wp-admin/install.php --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_EMAIL

# # Step 5: Clean up
# # rm /var/www/html/wp-config-sample.php

# # # Download WordPress Core

# # # Create the database
# wp db create --allow-root
# # # Install WordPress
sleep 10
cat wp-config-sample.php > wp-config.php
chown -R nobody:nobody /var/www/
chmod -R +rwx /var/www/
echo "extension=tokenizer" >  /etc/php81/php.ini
wp config set --path=/var/www --allow-root DB_NAME $MYSQL_DATABASE
wp config set --path=/var/www --allow-root DB_USER $MYSQL_USER
wp config set --path=/var/www --allow-root DB_PASSWORD $MYSQL_PASSWORD
wp config set --path=/var/www --allow-root DB_HOST $DB_HOST
wp core install --path=/var/www \
--url=$WP_URL \
--title=$WP_TITLE \
--admin_user=$WP_ADMIN_USER \
--admin_password=$WP_ADMIN_PASS \
--admin_email=hh@gmail.com \
--allow-root

# # # Configure WordPress
# wp config set --allow-root WP_CACHE_KEY_SALT 'zcherrad.42.fr'
# wp config set --allow-root WP_CACHE 'true' 
# wp config set --allow-root WP_REDIS_HOST 'redis'
# wp config set --allow-root WP_REDIS_PORT '6379'

# # # Install necessary plugins
# wp plugin install --allow-root redis-cache --activate 
# wp redis enable --allow-root


# # # Create a user
# wp user create $WP_USER $WP_USER_EMAIL  \
#     --user_pass=$WP_PASS \
#     --role=$WP_ROLE \
#     --allow-root

# # # Set appropriate file permissions
# chmod -R 777 /var/www/*

# # # Restart PHP-FPM (replace with appropriate command for your system)
# # service php-fpm restart
# # # Open browser to WordPress URL
# # xdg-open $WP_URL
/usr/sbin/php-fpm81 -F 