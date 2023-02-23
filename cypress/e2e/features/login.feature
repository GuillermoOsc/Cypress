Feature: Login page

    Feature Login page will work depending on the user credentials.

    Background:
        Given El navegador web está en la página de inicio de sesión de saucelabs

    Scenario: Success Login
        When El usuario ingresa su username "standard_user", contraseña "secret_sauce", y presiona en el botón de login
        Then the url will contains the inventory subdirectory

    Scenario: Blocked Login
        When A user enters the username "locked_out_user", the password "secret_sauce", and clicks on the login button
        Then The error message "Epic sadface: Sorry, this user has been locked out." is displayed

    Scenario: Incorrect Username Login
        When El usuario proporciona credenciales incorrectas y hace clic en el botón de inicio de sesión
            | username | password     |
            | testName | secret_sauce |
        Then The error message "Epic sadface: Username and password do not match any user in this service" is displayed

    Scenario: Incorrect Password Login
        When A user provides incorrect credentials, and clicks on the login button
            | username      | password     |
            | standard_user | testPassword |
        Then The error message "Epic sadface: Username and password do not match any user in this service" is displayed