*** Settings ***
Library           Selenium2Library
Library           Collections
Library           String
Resource    LoginKeywords.robot

*** Test Cases ***
Sort products Z to A
    Login with standard user
    Click Element    class:product_sort_container
    Click Element    //*[@id="header_container"]/div[2]/div/span/select/option[2]
    ${product_names}=    Get All Products
    Verify Z To A Sorting    ${product_names}
    Sleep    2s
    Close Browser

Sort products A to Z
    Login with standard user
    Click Element    class:product_sort_container
    Click Element    //*[@id="header_container"]/div[2]/div/span/select/option[1]
    ${product_names}=    Get All Products
    Verify A To Z Sorting    ${product_names}
    Sleep    2s
    Close Browser

Sort products by price low to high
    Login with standard user
    Click Element    class:product_sort_container
    Click Element    //*[@id="header_container"]/div[2]/div/span/select/option[3]
    Verify low to high sorting by price without $
    Sleep    2s
    Close Browser

Sort products by price high to low
    Login with standard user
    Click Element    class:product_sort_container
    Click Element    //*[@id="header_container"]/div[2]/div/span/select/option[4]
    Verify high to low sorting by price without $
    Sleep    2s
    Close Browser

*** Keywords ***
Get All Products
    ${products}=    Create List
    @{product_elements}=    Get WebElements    class=inventory_item_name
    FOR    ${element}    IN    @{product_elements}
        ${product_name}=    Get Text    ${element}
        Append To List    ${products}    ${product_name}
    END
    RETURN    @{products}

Verify Z To A Sorting
    [Arguments]    @{product_names}
    ${length}=    Get Length    ${product_names}
    FOR    ${i}    IN RANGE    ${length}-1
        ${current}=    Get From List    ${product_names}    ${i}
        ${next}=    Evaluate    ${product_names}    ${i+1}
        Should Be True    '${current}' >= '${next}'    Product not in Z to A order: ${current} < ${next}
    END

Verify A To Z Sorting
    [Arguments]    @{product_names}
    ${length}=    Get Length    ${product_names}
    FOR    ${i}    IN RANGE    ${length}-1
        ${current}=    Get From List    ${product_names}    ${i}
        ${next}=    Evaluate    ${product_names}    ${i+1}
        Should Be True    '${current}' <= '${next}'    Product not in A to Z order: ${current} > ${next}
    END
    

Verify low to high sorting by price without $
    ${prices}=    Create List
    @{price_elements}=    Get WebElements    class=inventory_item_price
    FOR    ${element}    IN    @{price_elements}
        ${price_text}=    Get Text    ${element}
        ${price}=    Replace String    ${price_text}    $    ${EMPTY}
        Append To List    ${prices}    ${price}
    END
    ${length}=    Get Length    ${prices}
    FOR    ${i}    IN RANGE    ${length}-1
        ${current}=    Get From List    ${prices}    ${i}
        ${next}=    Get From List    ${prices}    ${i+1}
        Should Be True    float(${current}) <= float(${next})    Price not in low to high order: ${current} > ${next}
    END

Verify high to low sorting by price without $
    ${prices}=    Create List
    @{price_elements}=    Get WebElements    class=inventory_item_price
    FOR    ${element}    IN    @{price_elements}
        ${price_text}=    Get Text    ${element}
        ${price}=    Replace String    ${price_text}    $    ${EMPTY}
        Append To List    ${prices}    ${price}
    END
    ${length}=    Get Length    ${prices}
    FOR    ${i}    IN RANGE    ${length}-1
        ${current}=    Get From List    ${prices}    ${i}
        ${next}=    Get From List    ${prices}    ${i+1}
        Should Be True    float(${current}) >= float(${next})    Price not in high to low order: ${current} < ${next}
    END
    

