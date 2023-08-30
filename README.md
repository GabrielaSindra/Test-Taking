## Pré requisitos

Antes de começar, verifique se você atendeu aos seguintes requisitos:

Você instalou a versão mais recente para automação:
* Python, Node.js e as libraryes do robot.

Este comando irá instalar todas as libraryes que estão na pasta requirements.txt:
* pip install -r requirements.txt

## Metodos para execução

### Existem diversos metodos para execução dos casos
### Alguns metodos de execução por linha de comando e outro pela extensão do robot

### Executando pelo vs code utilizando a extensão robot code:
* nos arquivos de teste é possivel visualizar o botão de execução, onde será possivel executar os cenários com apenas um clique, para utilizar esta funcionalidade será necessário instalar a extensão robot code e a robotframework-tidy que ja esta no requirements, feito isto basta clicar no botão de execução que irá funcionar.

## Executando testes por Tags
* para executar um teste por tag é necessário enviar no terminal o comando utilizando uma das 3 tags: carrinho, login e home. 
Exemplo do comando: robot -d ./MeusResultados -i "nome da tag" tests 

## Executando todos os testes
* para executar todos os testes de uma vez:
robot -d ./MeusResultados tests

## Executar apenas um teste específico da suíte
* comando para executar apenas um teste que está dentro da suíte:
robot -d ./MeusResultados -t “Nome do cenário” tests