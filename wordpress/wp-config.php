

<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'wordpressuser' );

/** MySQL database password */
define( 'DB_PASSWORD', 'password' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

define('FS_METHOD', 'direct');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '~ IB31#()|x]2e~-:X:+4dkGofU;+?Vd,Et|UKICIG)bpHUn]VKMxNB(~NN-m,&v');
define('SECURE_AUTH_KEY',  'JW`HK]2}JZpczExF|OjQ.{OW8y}m^|lRk<-e2dSkh3<kg|k?Z&bnNd@J8@e.y}Na');
define('LOGGED_IN_KEY',    ':$J.H`MvfH-HEU~xYHk<J;]DnyH5>9i{}0R(xysg3_*#$+k,3t3@r8>W/rf8rzTM');
define('NONCE_KEY',        'D^s[b_o7}]F(F2/-XN?  opbbmE>ai3!n?nfwa_9+P~x#>C(w(>nt/U=s&+L=x$u');
define('AUTH_SALT',        '4{B]8/ njtldPPs}a<mYT[$+?fIb8@W/J`J~?Y&,Is9h)vyos[:mv!r7(n/8!8?9');
define('SECURE_AUTH_SALT', 'Ng^CuaWA[m,tT7U )tPQkmJ,5X$v65WmUmbG=Z@8&|d-Jn-||`6Xg,YeX2*~jea ');
define('LOGGED_IN_SALT',   '$=n?:d7YK7eQ!!ct4U&+@j;kgIQtxI/!c-2JN6_ggHkPcW-ZqI^E#<F[X;i4!C4V');
define('NONCE_SALT',       'UubDqL@( !~f?!EnZ6.whpblP.)](%:d,&<T{-8qCQ_:Eb{_m|wCiJeL#Fn1&V@(');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';