*** Settings ***
Resource                base.robot
Test Setup              Nova sessão
Test Teardown           Encerra sessão


*** Test Cases ***
Add produto ao carrinho com Sucesso
        Go To                           ${url}
        Seleciona Categoria             T-shirts 
        Adiciona Produto ao carrinho              
        Should See Product Sucessfully added        T-Shirt



*** Keywords ***
Seleciona Categoria
    [Arguments]             ${category}
    Click Element           xpath: //*[@id="block_top_menu"]/ul/li[3]/a

Adiciona Produto ao carrinho
        Click Button	xpath: //*[@id="center_column"]/ul/li/div/div[2]/div[2]/a[1]
        Sleep	10s
        Select Frame	xpath: //div[@id='layer_cart']//iframe
        Click Element   xpath: //*[@id="layer_cart"]/div[1]/div[2]/div[4]/a


Should See Product Sucessfully added
    [Arguments]     ${product}
    Element Should Contain      xpath: //*[@id="layer_cart"]/div[1]/div[1]/h2         Product successfully added to your shopping cart
    Click Element               xpath: //*[@id="layer_cart"]/div[1]/div[2]/div[4]/a
    Element Should Contain      xpath: //*[@id="header"]/div[3]/div/div/div[3]/div/a            ${product} 
        
