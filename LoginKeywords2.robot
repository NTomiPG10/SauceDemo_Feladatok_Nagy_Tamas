*** Settings ***
Library           Selenium2Library

*** Keywords ***
Login
    Open Browser    https://parking-garage-app.netlify.app/    firefox
    Click Button    /html/body/div/main/div/div[1]/div/a[1]
    Input Text    //*[@id="email"]    nagy.tamas@diak.szbi-pg.hu
    Input Password    //*[@id="password"]d     npala
    Click Button  //*[@id="login-button"]
