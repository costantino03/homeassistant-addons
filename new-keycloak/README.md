# Keycloak Home Assistant Add-on

This add-on allows you to host Keycloak on Home Assistant OS with configurable HTTP/HTTPS ports and MySQL database.

## Configuration Options
- `http_port`: Port for HTTP (default: 8080).
- `https_port`: Port for HTTPS (default: 8443).
- `mysql_host`: MySQL host.
- `mysql_database`: MySQL database name.
- `mysql_user`: MySQL username.
- `mysql_password`: MySQL password.
- `admin_user`: Keycloak admin username.
- `admin_password`: Keycloak admin password.

## Installation
1. Copy the `new-keycloak` folder into your Home Assistant `addons` directory.
2. Go to Home Assistant > Settings > Add-ons > Add-on Store.
3. Refresh the page, and you should see the "Keycloak" add-on listed.
4. Install and configure the add-on.
5. Start the add-on.

## Accessing Keycloak
Once the add-on is running, you can access Keycloak at:
- `http://<homeassistant-ip>:<http_port>`
- `https://<homeassistant-ip>:<https_port>`

## Stopping the Add-on
To stop the add-on, navigate to the add-on details page and click "Stop."

# Credits:
[icon.png](https://www.flaticon.com/authors/pixelmeetup)
[logo.png](https://www.flaticon.com/authors/freepik)