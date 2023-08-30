*** Settings ***
Resource            ../resources/HomeKeywords.resource
Resource            ../resources/LoginKeywords.resource
Resource            ../resources/CarrinhoKeywords.resource

Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador


*** Test Cases ***
Cenário 01: Validar uma compra com sucesso
    [Documentation]    Esse teste irá realizar uma compra com sucesso
    [Tags]             carrinho
    Dado que eu esteja na logado na home
    Quando eu clicar em adicionar um produto no carrinho
    E no carrinho clicar em checkout
    E preencher Primeiro Nome
    E preencher Segundo Nome
    E Preencher o código postal
    E clicar em continue
    E na tela de Checkout Overview clicar em Finish
    Então deverá apresentar a mensagem confirmando a minha compra
