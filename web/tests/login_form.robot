*** Settings ***
Resource    base.robot

Test Setup       Nova sessão
Test Teardown    Encerra sessão

*** Test Cases ***
Login com sucesso usando css selector
    Go to                  ${url}/login
    Login With             stark                                           jarvis!
    Page Should Contain    Olá, Tony Stark. Você acessou a área logada!

Login com sucesso usando id
    Go to                  ${url}/login
    Input Text             id:userId                                       stark
    Input Text             id:passId                                       jarvis!
    Click Element          class:btn-login
    Page Should Contain    Olá, Tony Stark. Você acessou a área logada!

Senha inválida
    [tags]                        password_error
    Go to                         ${url}/login
    Login With                    stark                abc123
    Should Contain Login Alert    Senha é invalida!

Usuário inválido
    [tags]        user_error
    Go to         ${url}/login
    Login With    fabio           jarvis!

    Should Contain Login Alert    O usuário informado não está cadastrado!

*** Keywords ***
Login With
    [Arguments]      ${username}                 ${password}

    Input Text       css:input[name=username]    ${username} 
    Input Text       css:input[name=password]    ${password}
    Click Element    class:btn-login

Should Contain Login Alert
    [Arguments]          ${expected_error_message}
    
    ${error_message}=    Get WebElement               id:flash
    Should Contain       ${error_message.text}        ${expected_error_message}