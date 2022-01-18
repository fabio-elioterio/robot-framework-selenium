*** Settings ***
Resource    base.robot

Test Setup       Nova sessão
Test Teardown    Encerra sessão

*** Variables ***
${cehck_thor}             id:thor
${cehck_ironman}          css:input[value='iron-man']
${cehck_black_panther}    css:input[value=black-panther]


*** Test Cases ***
Marcando opção com Id
    Go To                          ${url}/checkboxes
    Select Checkbox                ${cehck_thor} 
    Checkbox Should Be Selected    ${cehck_thor} 

Marcando opção com CSS Selector
    [Tags]                         ironman
    Go To                          ${url}/checkboxes
    Select Checkbox                ${cehck_ironman}
    Checkbox Should Be Selected    ${cehck_ironman}

Marcando opção com CSS Selector - Pantera negra
    [Tags]                         black-panther
    Go To                          ${url}/checkboxes
    Select Checkbox                ${cehck_black_panther}
    Checkbox Should Be Selected    ${cehck_black_panther}

Marcando opção com Xpath
    Go To                          ${url}/checkboxes
    Select Checkbox                xpath://*[@id='checkbox']/input[7]
    Checkbox Should Be Selected    xpath://*[@id='checkbox']/input[7]