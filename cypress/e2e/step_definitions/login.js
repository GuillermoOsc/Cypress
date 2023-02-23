import {
  Given,
  When,
  Then,
} from "@badeball/cypress-cucumber-preprocessor";
import {loginPage} from '@pages/LoginPage'

Given("El navegador web está en la página de inicio de sesión de saucelabs", () => {
  cy.visit("/");
});

When("El usuario ingresa su username {string}, contraseña {string}, y presiona en el botón de login", (username,password) => {
  loginPage.submitLogin(username,password)
  
});

When("El usuario proporciona credenciales incorrectas y hace clic en el botón de inicio de sesión", (table) => {
  table.hashes().forEach((row) => {
    cy.log(row.username);
    cy.log(row.password);
    loginPage.submitLogin(row.username, row.password)

  });
});
Then("la url contendrá el subdirectorio del inventario", () => {
  cy.url().should("contains", "/inventory.html");
});
Then("Se muestra el mensaje {string} de error", (errorMessage) => {
  loginPage.elements.errorMessage().should("have.text", errorMessage);
});
