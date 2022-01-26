*** Settings ***
Resource    base.robot

Test Setup       Nova sessão
Test Teardown    Encerra sessão

*** Test Cases ***
Login com sucesso usando css selector
    Go to                  ${url}/login
    Input Text             css:input[name=username]                        stark
    Input Text             css:input[name=password]                        jarvis!
    Click Element          class:btn-login
    Page Should Contain    Olá, Tony Stark. Você acessou a área logada!

Login com sucesso usando id
    Go to                  ${url}/login
    Input Text             id:userId                                       stark
    Input Text             id:passId                                       jarvis!
    Click Element          class:btn-login
    Page Should Contain    Olá, Tony Stark. Você acessou a área logada!

Senha inválida
    [tags]           password_error
    Go to            ${url}/login
    Input Text       id:userId          stark
    Input Text       id:passId          abc123
    Click Element    class:btn-login

    ${error_message}=    Get WebElement           id:flash
    Should Contain       ${error_message.text}    Senha é invalida!

Usuário inválido
    [tags]           user_error
    Go to            ${url}/login
    Input Text       id:userId          fabio
    Input Text       id:passId          jarvis!
    Click Element    class:btn-login

    ${error_message}=    Get WebElement           id:flash
    Should Contain       ${error_message.text}    O usuário informado não está cadastrado!