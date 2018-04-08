*** Settings ***
Library   XML

*** Variables ***
${XML_MENU_PATH} =   Inputs/XML/menu.xml
${EXPECTED BREAKFAST_MENU_COUNT} =  1
${EXPECTED_FOOD_COUNT} =  5
*** Keywords ***
Should be one menu in the file
    ${actual_breakfast_menu_count} =  get element count  ${XML_MENU_PATH}
    should be equal as numbers  ${actual_breakfast_menu_count}  ${EXPECTED BREAKFAST_MENU_COUNT}
Verify Menu Name
    ${root} =  parse xml  ${XML_MENU_PATH}
    should be equal  ${root.tag}    breakfast_menu
Verify Food Count
    ${actual_food_count} =  get element count  ${XML_MENU_PATH}  food
    should be equal as integers  ${EXPECTED_FOOD_COUNT}   ${actual_food_count}
Verify First Food Name
    ${first_food_name} =  get element  ${XML_MENU_PATH}  food[1]/name
    should be equal as strings  ${first_food_name.text}  Belgian Waffles
    log     ${first_food_name.text}
Verify First Food Price
    ${first_food_price} =  get element    ${XML_MENU_PATH}  food[1]/price
    should be equal as strings  ${first_food_price.text}  $5.95
    log      ${first_food_price.text}
Verify First Food Calories
   ${first_food_calories} =  get element text  ${XML_MENU_PATH}  food[1]/calories
   should be equal as strings  ${first_food_calories}  650
   log   ${first_food_calories}
Add New Food
    ${root} =  parse xml  ${XML_MENU_PATH}
    add element  ${root}   <food></food>   index=1
    add element  ${root}   <name>vada pav</name>  xpath=food[2]
    add element  ${root}   <description>mumbai cha vadapav!!</description>  xpath=food[2]
    add element  ${root}   <price>5</price>  xpath=food[2]
    add element  ${root}   <calories>564</calories>  xpath=food[2]
    save xml  ${root}   ${XML_MENU_PATH}

Verify New Food Exists
    log  xyz