1. Bejelentkezes ellenorzese
- Sikeres bejelentkezes ervenyes felhasznalonevvel es jelszoval
- Sikertelen bejelentkezes hibas jelszo eseten
- Sikertelen bejelentkezes nem letezo felhasznaloval
- Kotelezo mezok ellenorzese ures bejelentkezesi adatoknal
- Hibauzenet helyes megjelenitese sikertelen bejelentkezesnel
- Kijelentkezes utan vedett oldalak eleresenek tiltasa

2. Uj auto rogzitese
- Sikeres uj auto felvitele (happy path)
- Kotelezo mezok ellenorzese mentes elott
- Hibasan megadott rendszam formatum kezelese
- Duplikalt rendszam mentesenek kezelese

3. Modositas es torles
- Auto adatainak sikeres modositasa
- Torles megerosito ablakkal
- Torles megszakitasa (Megse folyamattal)
- Megerosito ablak gombjainak helyes mukodese

*** Settings ***
Library           Selenium2Library

*** Keywords ***
Bejelentkezes ellenorzese
    [Arguments]    ${email}    ${password}    ${expected_result}
    Open Browser    https://parking-garage-app.netlify.app/    firefox
    Click Button    /html/body/div/main/div/div[1]/div/a[1]
    Input Text    //*[@id="email"]    ${email}
    Input Text    //*[@id="password"]d    ${password}
    Click Button    //*[@id="login-button"]
    ${actual_result}=    Get Text    id=loginMessage
    Should Be Equal As Strings    ${actual_result}    ${expected_result}
    Close Browser