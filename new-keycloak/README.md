# Keycloak Add-on for Home Assistant

This add-on hosts a Keycloak server for identity management in **production mode** over **HTTP**.

## Features

- Fully configurable via Home Assistant's user interface.
- Production-ready Keycloak setup using HTTP (no HTTPS).
- Supports custom database settings and hostname configuration.

## Installation

1. Clone the add-on repository to your Home Assistant setup.
2. Add this folder (`new-keycloak`) as a custom repository in your Home Assistant Add-on Store.
3. Install the Keycloak add-on.
4. Configure the add-on through Home Assistant's UI.
5. Start the add-on and access Keycloak at the configured hostname.

## Configuration Options

This add-on supports the following options:
- `db_host`: The hostname of the database server (default: `localhost`).
- `db_database`: The name of the database (default: `keycloak`).
- `db_username`: The username for the database (default: `keycloak`).
- `db_password`: The password for the database (default: `keycloak`).
- `hostname`: The hostname of your Keycloak server (default: `yourdomain.com`).
- `admin_username`: The admin user of your Keycloak server (default: `admin`).
- `admin_password`: The admin user password of your Keycloak server (default: `admin`).
- `port`: The port of your Keycloak server (default: `8080`).
<!-- ## Ports

The following port is exposed:
- `8080`: HTTP -->

# Credits:
[icon.png](https://www.flaticon.com/authors/pixelmeetup)
[logo.png](https://www.flaticon.com/authors/freepik)