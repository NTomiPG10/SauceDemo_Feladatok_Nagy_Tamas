3. Termékrészletek:
Termék oldal megnyitása - név alapján
Termék oldal megnyitása - kép alapján
Termék információk ellenőrzése - név  (ugyaz-e?)
Termék információk ellenőrzése - ár (ugyaz-e?)
Termék információk ellenőrzése - leírás        (egyáltalán megjelenik-e?)
Termék információk ellenőrzése - kép    (egyáltalán megjelenik-e?)
Vissza navigáció - Back to products gomb

*** Settings ***
Library           Selenium2Library
Resource    LoginKeywords.robot    


*** Test Cases ***
Product page opens by name
    Login with standard user
    Click Element    //*[@id="item_4_title_link"]/div
    Sleep    1s
    Close Browser

Product page opens by image
    Login with standard user
    Click Element    //*[@id="item_4_img_link"]/img
    Sleep    1s
    Close Browser

Product information verification - name(Getting the name from the product page and comparing it with the name on the products page)
    Login with standard user
    ${product_name}=    Get Text    //*[@id="item_4_title_link"]/div
    Click Element    //*[@id="item_4_title_link"]/div
    Page Should Contain    ${product_name}
    Sleep    1s
    Close Browser

Product information verification - price(Getting the price from the product page and comparing it with the price on the products page)
    Login with standard user
    ${product_price}=    Get Text    //*[@id="inventory_container"]/div/div[1]/div[2]/div[2]/div
    Click Element    //*[@id="item_4_title_link"]/div
    Page Should Contain    ${product_price}
    Sleep    1s
    Close Browser

Product information verification - description(Getting the description from the product page and comparing it with the description on the products page)
    Login with standard user
    ${product_description}=    Get Text    //*[@id="inventory_container"]/div/div[1]/div[2]/div[2]/div
    Click Element    //*[@id="item_4_title_link"]/div
    Page Should Contain    ${product_description}
    Sleep    1s
    Close Browser

Product information verification - image(Getting the image from the product page and comparing it with the image on the products page)
    Login with standard user
    ${product_image}=    Get Element Attribute    //*[@id="item_4_img_link"]/img    src
    Click Element    //*[@id="item_4_title_link"]/div
    ${product_image_on_page}=    Get Element Attribute    //*[@id="inventory_item_container"]/div/div/div[1]/img    src
    Should Be Equal    ${product_image}    ${product_image_on_page}
    Sleep    1s
    Close Browser

Back navigation - Back to products button
    Login with standard user
    Click Element    //*[@id="item_4_title_link"]/div
    Sleep    1s
    Click Button    //*[@id="back-to-products"]
    Sleep    1s
    Close Browser