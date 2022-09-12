*** Settings ***
Resource                base.robot
Test Setup              Nova sessão
Test Teardown           Encerra sessão


*** Test Cases ***
Login com Sucesso
        [Tags]                          login_ok
        Go To                            ${url}?controller=authentication&back=my-account
        Login With                      scoelhomf@gmail.com   kabuM@2022
        Should See Logged User          Silvia QA    

Senha inválida
        [tags]                          login_error
        Go To                           ${url}?controller=authentication&back=my-account
        Login With                      scoelhomf@gmail.com       1234
        Should Contain Login Alert      Invalid password.

Email Inválido
        [tags]                          invalid_email
        Go To                           ${url}?controller=authentication&back=my-account
        Login With                      Silvia      1234
        Should Contain Login Alert      Invalid email address.



*** Keywords ***
Login With
    [Arguments]             ${uname}                        ${password}   
    Input Text              css:input[id=email]            ${uname}
    Input Text              css:input[id=passwd]              ${password}
    Click Element           xpath: //*[@id="SubmitLogin"]/span

Should Contain Login Alert
    [Arguments]             ${expect_message}
    ${message}=             Get WebElement      xpath: //*[@id="center_column"]/div[1]
    Should Contain          ${message.text}     ${expect_message}  

Should See Logged User
    [Arguments]     ${full_name}
    Element Should Contain      xpath: //*[@id="header"]/div[2]/div/div/nav/div[1]/a        Silvia QA
    Page Should Contain         Welcome to your account. Here you can manage all of your personal information and orders.

    