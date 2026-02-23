1. Kosár funkcionalitás
    Több termék hozzáadása
    Termék eltávolítása a kosárból
    Kosár tartalmának ellenőrzése
---------------------------------------
1. Shopping cart functionality
    Add multiple products
    Remove products from the shopping cart
    Check the contents of the shopping cart

*** Settings ***
Library   Selenium2Library

*** Keywords ***
Login To Saucedemo mainpage
    Open Browser    https://www.saucedemo.com/    firefox
    Input Text    id=user-name    standard_user
    Input Password    id=password     secret_sauce
    Click Button  id=login-button

Verify cart item count
    [Arguments]    ${expected_count}
    ${items_count}=    Get Element Count    class=cart_item
    Should Be Equal As Integers    ${items_count}    ${expected_count}

Add items to cart
    Click Element    //*[@id="add-to-cart-sauce-labs-backpack"]
    Sleep    1s
    Click Element    //*[@id="add-to-cart-sauce-labs-bike-light"]
    Sleep    1s
    Click Element    //*[@id="add-to-cart-sauce-labs-bolt-t-shirt"]
    Sleep    1s

*** Test Cases ***
Több termék hozzáadása
    Login To Saucedemo mainpage
    Sleep    1s
    Add items to cart
    Sleep    1s
    Element Text Should Be    id=shopping_cart_container    3
    Sleep    1s
    Click Element    //*[@id="shopping_cart_container"]/a
    Verify cart item count    3
    Page Should Contain    Sauce Labs Backpack
    Page Should Contain    Sauce Labs Bike Light
    Page Should Contain    Sauce Labs Bolt T-Shirt
    Sleep    1s
    Close Browser

Termék eltávolítása a kosárból
    Login To Saucedemo mainpage
    Sleep    1s
    Add items to cart
    Sleep    1s
    Click Element    //*[@id="shopping_cart_container"]/a
    Sleep    1s
    Click Element    //*[@id="remove-sauce-labs-bike-light"]
    Sleep    1s
    Verify cart item count    2
    Page Should Not Contain    Sauce Labs Bike Light
    Page Should Contain    Sauce Labs Backpack
    Page Should Contain    Sauce Labs Bolt T-Shirt
    Sleep    1s
    Close Browser