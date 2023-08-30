*** Settings ***
Library     String
Library     XML
Library     SeleniumLibrary


*** Variables ***
${Url}              https://www.saucedemo.com/
${browser}          Chrome
${login}            //input[contains(@placeholder,'Username')]
${password}         //input[contains(@placeholder,'Password')]
${buttonLogin}      //input[contains(@type,'submit')]
${titleHome}        //div[@class='app_logo'][contains(.,'Swag Labs')]
${msgBlock}         //h3[@data-test='error'][contains(.,'Epic sadface: Sorry, this user has been locked out.')]
${productHome}      //div[@class='inventory_item_name'][contains(.,'Sauce Labs Backpack')]
${product}          //div[@class='inventory_details_name large_size'][contains(.,'Sauce Labs Fleece Jacket')]


*** Keywords ***
Abrir o navegador
    Open Browser    browser=${browser}
    Maximize Browser Window

Fechar o navegador
    Close Browser

Dado que estou na tela de Login
    Go To    ${url}

Quando eu preencher o email
    Input Text    locator=${login}    text=standard_user

E preencher a senha
    Input Text    locator=${password}    text=secret_sauce

E Clicar no botão Login
    Click Button    locator=${buttonLogin}

Então sou direcionado para a Home
    Element Text Should Be    ${titleHome}    Swag Labs

Quando eu preencher o email com um usuário bloqueado
    Input Text    locator=${login}    text=locked_out_user

Então deve apresentar a mensagem que o usuário está bloqueado
    Element Should Be Visible    locator=${msgBlock}

Quando eu preencher o email com um usuário com problema
    Input Text    locator=${login}    text=problem_user

 Quando eu preencher o email com um usuário com problema de performance
    Input Text    locator=${login}    text=performance_glitch_user

Então deve ocorrer um delay ao ser direcionado para a home
    Wait Until Element Is Visible    ${titleHome}

E clicar em um produto
    ${nameProductHome}    Get Text    locator=${productHome}
    Set Global Variable    ${nameProductHome}
    Click Element    locator=${productHome}

Então o produto acessado não deve ser o mesmo que o clicado na home
    ${nameProduct}    Get Text    locator=${product}
    Should Not Be Equal As Strings    ${nameProduct}    ${product}
