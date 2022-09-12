*** Settings ***
Resource                base.robot
Test Setup              Nova sessão
Test Teardown           Encerra sessão


*** Test Cases ***
Busca com Sucesso
        [Tags]                          busca_ok
        Go To                           ${url}
        Busca With                      dress
        Should See Search Results       dress

Busca inválida
        [Tags]                            busca_nok
        Go To                             ${url}
        Busca With                        abacaxi
        Should Contain Search Alert       No results were found for your search
        

*** Keywords ***
Busca With
    [Arguments]             ${product}                                 
    Input Text              css:input[id=search_query_top]       ${product}
    Click Element           css:button[name=submit_search]

Should Contain Search Alert
    [Arguments]             ${expect_message}
    ${message}=             Get WebElement      xpath: //*[@id="center_column"]/p
    Should Contain          ${message.text}     ${expect_message}  

Should See Search Results
    [Arguments]     ${product}
    Page Should Contain    results have been found.
    