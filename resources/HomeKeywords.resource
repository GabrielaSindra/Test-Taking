*** Settings ***
Library     String
Library     XML
Library     SeleniumLibrary


*** Variables ***
${url}              https://www.saucedemo.com/
${browser}          Chrome
${login}            //input[contains(@placeholder,'Username')]
${password}         //input[contains(@placeholder,'Password')]
${buttonLogin}      //input[contains(@type,'submit')]
${buttonAddCart}    //button[contains(@data-test,'add-to-cart-sauce-labs-backpack')]
${quantityCart}     //span[@class='shopping_cart_badge'][contains(.,'1')]


*** Keywords ***
Dado que eu esteja na logado na home
    Go To    ${url}
    Maximize Browser Window
    Input Text    locator=${login}    text=standard_user
    Input Text    locator=${password}    text=secret_sauce
    Click Button    locator=${buttonLogin}

Quando eu clicar em adicionar um produto no carrinho
    Click Button    locator=${buttonAddCart}

Então o simbolo do carrinho ficará com o número 1
    Element Should Contain    locator=${quantityCart}    expected=1
