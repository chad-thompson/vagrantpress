<?php
/**
 * The base configurations of the WordPress.
 *
 * This file has the following configurations: MySQL settings, Table Prefix,
 * Secret Keys, WordPress Language, and ABSPATH. You can find more information
 * by visiting {@link http://codex.wordpress.org/Editing_wp-config.php Editing
 * wp-config.php} Codex page. You can get the MySQL settings from your web host.
 *
 * This file is used by the wp-config.php creation script during the
 * installation. You don't have to use the web site, you can just copy this file
 * to "wp-config.php" and fill in the values.
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'wordpress');

/** MySQL database username */
define('DB_USER', 'wordpress');

/** MySQL database password */
define('DB_PASSWORD', 'wordpress');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '%hs2TG=ae^ViT?bu,&C-_uN[Ajiro$q42|9>;:+P<A$Tz1i!3,IhO7AkzEHnqTbt');
define('SECURE_AUTH_KEY',  'Q/5(5Sjirx,|7u4,K+fEaLw0H[Clnt8}37<t,aO|}X,)r+y8zi<3ef{-L&0-pf[d');
define('LOGGED_IN_KEY',    'N::ilw]9$#)6+U3?gsA9+saWgEE08bet5md|h0y|3: leBlueZsRnD=+W~KcLun^');
define('NONCE_KEY',        '[%VR*-g|L30$vZP~^8^BZ}RGAqnZP|5THT6o%-+OtH/hk{T[p7M-^<+4;$VJD<al');
define('AUTH_SALT',        '9}SRTB0.4L=($,*E.&++o5O)rvr)Q|w&_+1ME-*+{K;3-R|vHjxvO|zO)efN!@JJ');
define('SECURE_AUTH_SALT', 't3CH@NplpyF{j2}V,tC|GPG:828ATBM0iE2-Gw]5v~MA|sB5iJq6e}ep_}Pz&BxZ');
define('LOGGED_IN_SALT',   'zO+=>cV kt@5H ie{?m_}voT87bJQECe <WXSVdiN7}Jvm~r}:.?gPf-ZCkn+hcA');
define('NONCE_SALT',       '/f!7FELbTB_o+kTl#V{c^ODQ+0)dvgy,wjV#)#ZPonaZihX2kE]GPxa] hu08+wQ');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each a unique
 * prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * WordPress Localized Language, defaults to English.
 *
 * Change this to localize WordPress. A corresponding MO file for the chosen
 * language must be installed to wp-content/languages. For example, install
 * de_DE.mo to wp-content/languages and set WPLANG to 'de_DE' to enable German
 * language support.
 */
define('WPLANG', '');

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 */
define('WP_DEBUG', true);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
