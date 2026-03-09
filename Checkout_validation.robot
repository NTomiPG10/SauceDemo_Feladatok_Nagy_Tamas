4. Checkout validáció:
Üres mezők ellenőrzése - név
Üres mezők ellenőrzése - cím
Üres mezők ellenőrzése - minden mező üres
Érvénytelen adatok kezelése - túl hosszú név        ${long_name}=    Evaluate    "A" * 100
Érvénytelen adatok kezelése - speciális karakterek
Érvénytelen adatok kezelése - csak számok a névben
Checkout megszakítása - Cancel gombbal    (Ellenőrzni, hogy a Cancel gomb megnyomásakor visszatér-e a kosár oldalra)
Érvényes adatokkal sikeres checkout folytatás

*** Settings ***
Library           Selenium2Library
Resource    LoginKeywords.robot

*** Test Cases ***
Empty fields validation - first name
    Login with standard user
    Sleep    1s
    Click Element    //*[@id="shopping_cart_container"]/a
    Sleep    1s
    Click Element    id=checkout
    Input Text    id=first-name    ${EMPTY}
    Input Text    id=last-name    Tamás
    Input Text    id=postal-code   06713
    Sleep    1s
    Click Button  id=continue
    Page Should Contain    Error: First Name is required
    Sleep    1s
    Close Browser

Empty fields validation - last name
    Login with standard user
    Sleep    1s
    Click Element    //*[@id="shopping_cart_container"]/a
    Sleep    1s
    Click Element    id=checkout
    Input Text    id=first-name    Nagy
    Input Text    id=last-name    ${EMPTY}
    Input Text    id=postal-code   06713
    Sleep    1s
    Click Button  id=continue
    Page Should Contain    Error: Last Name is required
    Sleep    1s
    Close Browser

Empty fields validation - all fields empty
    Login with standard user
    Sleep    1s
    Click Element    //*[@id="shopping_cart_container"]/a
    Sleep    1s
    Click Element    id=checkout
    Input Text    id=first-name    ${EMPTY}
    Input Text    id=last-name    ${EMPTY}
    Input Text    id=postal-code   ${EMPTY}
    Sleep    1s
    Click Button  id=continue
    Page Should Contain    Error: First Name is required
    Sleep    1s
    Close Browser

Invalid data handling - too long first name
    Login with standard user
    Sleep    1s
    Click Element    //*[@id="shopping_cart_container"]/a
    Sleep    1s
    Click Element    id=checkout
    ${long_name}=    Evaluate    "A" * 100
    Input Text    id=first-name    ${long_name}
    Input Text    id=last-name     Tamás
    Input Text    id=postal-code   06713
    Sleep    1s
    Click Button  id=continue
    Sleep    1s
    Close Browser

Invalid data handling - special characters in name
    Login with standard user
    Sleep    1s
    Click Element    //*[@id="shopping_cart_container"]/a
    Sleep    1s
    Click Element    id=checkout
    Input Text    id=first-name    Nagy@#$%
    Input Text    id=last-name     Tamás!@#
    Input Text    id=postal-code   06713
    Sleep    1s
    Click Button  id=continue
    Sleep    1s
    Close Browser

Invalid data handling - numbers in name
    Login with standard user
    Sleep    1s
    Click Element    //*[@id="shopping_cart_container"]/a
    Sleep    1s
    Click Element    id=checkout
    Input Text    id=first-name    Nagy123
    Input Text    id=last-name     Tamás456
    Input Text    id=postal-code   06713
    Sleep    1s
    Click Button  id=continue
    Sleep    1s
    Close Browser
        
Checkout cancellation with Cancel button
    Login with standard user
    Sleep    1s
    Click Element    //*[@id="shopping_cart_container"]/a
    Sleep    1s
    Click Element    id=checkout
    Sleep    1s
    Click Button  id=cancel
    Page Should Contain Element    id=checkout
    Sleep    1s
    Close Browser

Valid data with successful checkout continuation
    Login with standard user
    Sleep    1s
    Click Element    //*[@id="shopping_cart_container"]/a
    Sleep    1s
    Click Element    id=checkout
    Input Text    id=first-name    Nagy
    Input Text    id=last-name     Tamás
    Input Text    id=postal-code   06713
    Sleep    1s
    Click Button  id=continue
    Page Should Contain Element    id=finish
    Sleep    1s
    Close Browser