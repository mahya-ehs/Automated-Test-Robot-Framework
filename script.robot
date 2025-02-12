*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${Login-Url}    https://netbank.nordea.fi/login/
${Browser}    Chrome
${Username}    12345
${ResponseCode}    123456789
${Error_msg}    Tarkista syöttämäsi tiedot ja yritä uudelleen.

*** Test Cases ***
Invalid Login
    Open Browser To Login Page
    Accept Cookies
    Go To Login Page
    Choose Method
    Enter Credentials
    Submit Credentials
    Check For Error Message
    [Teardown]    Close Browser

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${Login-Url}    ${Browser}
    Wait Until Page Contains Element    xpath=//a[contains(text(),'Hyväksy kaikki')]    timeout=10

Accept Cookies
    Click Link    xpath=//a[contains(text(),'Hyväksy kaikki')]

Go To Login Page
    Wait Until Element Is Visible    xpath=//nwcc-button2[@data-test='login']//button    timeout=10
    Click Button    xpath=//nwcc-button2[@data-test='login']//button

Choose Method
    Wait Until Element Is Visible    xpath=//label[@for='ccalc']    timeout=10
    Click Element    xpath=//label[@for='ccalc']

Enter Credentials
    Wait Until Element Is Visible    id=ccalc-user-id    timeout=10
    Input Text    id=ccalc-user-id    ${Username}
    Input Text    id=ccalc-otp-code    ${ResponseCode}

Submit Credentials
    Click Button    id=auth-button

Check For Error Message
    Wait Until Page Contains    ${Error_msg}    timeout=10
    ${error_found}    Run Keyword And Return Status    Page Should Contain    ${Error_msg}
    Run Keyword If    not ${error_found}    Fail    Error message not found.
