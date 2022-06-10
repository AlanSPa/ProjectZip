*** Settings ***
Documentation       File with test steps
Library    SeleniumLibrary
*** Variables ***
${url}            http://www.republicavirtual.com.br/cep/exemplos.php
${browser}        chrome
${InputZip}       xpath=//input[@id="campoCEP"]
${ButtonFind}     xpath=//input[@value="buscar cep"]
${Sucess}         xpath=//font[text()='sucesso - cep completo']
${ZipCode}        55002010
${Street}         Presidente Afonso Pena
${City}           Caruaru
${State}          PE

*** Keywords ***
New Session
    Open Browser   ${url}    ${browser}
    Maximize Browser Window
End Session
    Capture Page Screenshot
    Close Browser
Input Zip Code
    Input Text        ${InputZip}    ${ZipCode}
    Click Element     ${ButtonFind}  
Valid Zip
    Wait Until Element Is Visible    ${Sucess}
Valid Adress
    Page Should Contain    ${Street}
    Page Should Contain    ${City}
    Page Should Contain    ${State}

    
