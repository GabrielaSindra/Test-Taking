*** Settings ***
Documentation       Essa suíte testa a tela de Login

Resource            ../resources/LoginKeywords.resource

Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador


*** Test Cases ***
Cenário 01: Validar que o Login é realizado com sucesso
    [Documentation]    Esse teste irá realizar o login com sucesso com o usuário standard_user
    [Tags]             login
    Dado que estou na tela de Login
    Quando eu preencher o email
    E preencher a senha
    E Clicar no botão Login
    Então sou direcionado para a Home

Cenário 02: Validar Login com um usuário bloqueado
    [Documentation]    Esse teste irá aprensentar uma mensagem de erro ao logar com o usuário locked_out_user
    [Tags]             login
    Dado que estou na tela de Login
    Quando eu preencher o email com um usuário bloqueado
    E preencher a senha
    E Clicar no botão Login
    Então deve apresentar a mensagem que o usuário está bloqueado

Cenário 03: Validar Login com um usuário com problema
    [Documentation]    Esse teste irá realizar o Login com um usuário com problema usuário problem_user
    [Tags]             login
    Dado que estou na tela de Login
    Quando eu preencher o email com um usuário com problema
    E preencher a senha
    E Clicar no botão Login
    E clicar em um produto
    Então o produto acessado não deve ser o mesmo que o clicado na home

Cenário 04: Validar Login com um usuário com problema de performance
    [Documentation]    Esse teste irá realizar o login e aguardar até a home seja carregada com o usuário performance_glitch_user
    [Tags]             login
    Dado que estou na tela de Login
    Quando eu preencher o email com um usuário com problema de performance
    E preencher a senha
    E Clicar no botão Login
    Então deve ocorrer um delay ao ser direcionado para a home
