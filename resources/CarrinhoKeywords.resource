*** Settings ***
Library     String
Library     XML
Library     SeleniumLibrary
Library     FakerLibrary    locale=pt_BR


*** Variables ***
${buttonCart}           //a[@class='shopping_cart_link'][contains(.,'1')]
${buttonCheckout}       //button[@class='btn btn_action btn_medium checkout_button'][contains(.,'Checkout')]
${firstName}            //input[@placeholder='First Name']
${lastName}             //input[contains(@placeholder,'Last Name')]
${postalCode}           //input[contains(@placeholder,'Zip/Postal Code')]
${buttonContinue}       //input[contains(@type,'submit')]
${buttonFinish}         //button[@class='btn btn_action btn_medium cart_button'][contains(.,'Finish')]
${checkoutComplete}     //h2[@class='complete-header'][contains(.,'Thank you for your order!')]


*** Keywords ***
E no carrinho clicar em checkout
    Click Element    locator=${buttonCart}
    Click Button    locator=${buttonCheckout}

E preencher Primeiro Nome
    ${fistNameFake}    FakerLibrary.First Name
    Input Text    locator=${firstName}    text=${fistNameFake}

E preencher Segundo Nome
    ${lastNameFake}    FakerLibrary.Last Name
    Input Text    locator=${lastName}    text=${lastNameFake}

E Preencher o código postal
    ${postalCodeFake}    FakerLibrary.Postcode
    Input Text    locator=${postalCode}    text=${postalCodeFake}

E clicar em continue
    Click Button    locator=${buttonContinue}

E na tela de Checkout Overview clicar em Finish
    Click Button    locator=${buttonFinish}

Então deverá apresentar a mensagem confirmando a minha compra
    Element Text Should Be    ${checkoutComplete}    Thank you for your order!
