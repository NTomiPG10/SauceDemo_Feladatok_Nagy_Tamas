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
Resource    LoginKeywords2.robot

*** Keywords ***
Bejelentkezes ellenorzese
    Login
    Sleep    1s
    Page Should Contain Element    /html/body/div/nav/div[2]/div/button
    Sleep    1s
    Close Browser