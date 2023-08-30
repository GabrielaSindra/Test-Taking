*** Settings ***
Resource            ../resources/HomeKeywords.resource
Resource            ../resources/LoginKeywords.resource

Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador


*** Test Cases ***
Cenário 01: Adicionar um produto no carrinho
    [Documentation]    Esse teste irá realizar adicionar um produto no carrinho
    [Tags]             home
    Dado que eu esteja na logado na home
    Quando eu clicar em adicionar um produto no carrinho
    Então o simbolo do carrinho ficará com o número 1
