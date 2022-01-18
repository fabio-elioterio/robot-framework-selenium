*** Settings ***
Library    app.py


*** Test Cases ***
Deve retornar mensagem de boas vindas
    ${result}=         Welcome      Fabio
    Should Be Equal    ${result}    Olá Fabio, bem vindo ao Curso básico de Robot Framework