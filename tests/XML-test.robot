*** Settings ***
Documentation    This suite is designed to explore XML library offered by RF.
Resource    ../resources/xml/breakfast_menu.robot

*** Test Cases ***
Verify "breakfast_menu" Tag Count
    [Tags]   XML
    breakfast_menu.Should be one menu in the file

Verify Root
    [Tags]  XML
     breakfast_menu.Verify Menu Name

Verify "Food" Tag Count
    [Tags]  XML
     breakfast_menu.Verify Food Count

Verify First Food
    [Tags]  XML
    breakfast_menu.Verify First Food Name
    breakfast_menu.Verify First Food Price
    breakfast_menu.Verify First Food Calories

Add a Food
    [Tags]  XML
    Breakfast_Menu.Add New Food

Verify New Food Was Added
    [Tags]  XML
    Breakfast_Menu.Verify New Food Exists


