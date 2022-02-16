*** Settings ***
Resource    ../../../Resources/ResourcesGlobals.robot

*** Keywords ***
Realizar POST de um Usuário
    &{header}              Create Dictionary    content-type=application/json    
                               ...              charset=utf-8    
                               ...              v=1.0
    ${RequestAPI}          POST On Session      FakeRESTApi    ${USER}    # NOME DA REQUISIÇÃO E O ENDPOINT
                               ...              data={"id": 40,"userName": "Alexandre","password": "654321"}
                               ...              headers=${header}
    IF    ${RequestAPI.status_code} == ${200}
        Set Suite Variable    ${RequestAPI}    # !IMPORTANT: Escopo Suite        
    ELSE
        Log    Ocorreu uma falha na Sessão da API
    END

Conferir Resposta API com Status Code ${statuscode} do Usuário inserido
    Should Be Equal As Strings    ${statuscode}    ${RequestAPI.status_code}
    ${RespostaAPI}    Catenate    ${statuscode}    =    ${RequestAPI.status_code}
    Log    ${RespostaAPI}

Conferir Resposta API com Reason ${reason} do Usuário inserido
    Should Be Equal As Strings    ${reason}    ${RequestAPI.reason}
    ${RespostaAPI}    Catenate    ${reason}    =    ${RequestAPI.reason}
    Log    ${RespostaAPI}

Exibir Resposta API com Header do Usuário inserido
    Log    ${RequestAPI.headers}

Exibir Resposta API com Json do Usuário inserido
    Log    ${RequestAPI.json()}

Conferir Resposta API com Json pelo id do Usuário inserido
    Dictionary Should Contain Key     ${RequestAPI.json()}    id
    Dictionary Should Contain Item    ${RequestAPI.json()}    id    40
    ${id}                 Get Dictionary Values      ${RequestAPI.json()}
    ${RespostaAPI}        Remove String    [40, '654321', 'Alexandre']
                                    ...    [
                                    ...    , '654321', 'Alexandre']
    ${RespostaAPI}    Catenate    ${IdUsuario}    ${RespostaAPI}    
     Log    ${RespostaAPI}

Conferir Resposta API com Json pelo userName do Usuário inserido
    Dictionary Should Contain Key     ${RequestAPI.json()}    userName
    Dictionary Should Contain Item    ${RequestAPI.json()}    userName    Alexandre
    ${userName}           Get Dictionary Values      ${RequestAPI.json()}
    ${RespostaAPI}        Remove String    [40, '654321', 'Alexandre']
                                    ...    [40, '654321', '
                                    ...    ']
    ${RespostaAPI}    Catenate    ${userNameUsuario}    ${RespostaAPI}
    Log    ${RespostaAPI}

Conferir Resposta API com Json pelo password do Usuário inserido
    Dictionary Should Contain Key     ${RequestAPI.json()}    password
    Dictionary Should Contain Item    ${RequestAPI.json()}    password    654321
    ${userName}           Get Dictionary Values      ${RequestAPI.json()}
    ${RespostaAPI}        Remove String    [40, '654321', 'Alexandre']
                                    ...    [40, '
                                    ...    ', 'Alexandre']
    ${RespostaAPI}    Catenate    ${passwordUsuario}    ${RespostaAPI}
    Log    ${RespostaAPI}

Conferir Resposta API com atributo Transfer-Encoding chunked do Header do Usuário inserido
    ${chunked}            Get Dictionary Values      ${RequestAPI.headers}
    ${RespostaAPI}        Remove String    ['application/json; charset=utf-8; v=1.0', 'Sat, 08 Jan 2022 04:46:11 GMT', 'Kestrel', 'chunked', '1.0']
                                    ...    ['application/json; charset=utf-8; v=1.0', 'Sat, 08 Jan 2022 04:46:11 GMT', 'Kestrel', '
                                    ...    ', '1.0']
    ${RespostaAPI}        Catenate    ${TransferEncoding}    ${RespostaAPI}
    Log    ${RespostaAPI}    
    
Conferir Resposta API com atributo Content-Type application/json do Header do Usuário inserido
    ${applicationjson}    Get Dictionary Values      ${RequestAPI.headers}
    ${RespostaAPI}        Remove String    ['application/json; charset=utf-8; v=1.0', 'Sat, 08 Jan 2022 04:46:11 GMT', 'Kestrel', 'chunked', '1.0']
                                    ...    ; charset=utf-8; v=1.0', 'Sat, 08 Jan 2022 04:46:11 GMT', 'Kestrel', 'chunked', '1.0']
                                    ...    ['
    ${RespostaAPI}        Catenate    ${ContentType}    ${RespostaAPI}
    Log    ${RespostaAPI}
    
Conferir Resposta API com atributo charset utf-8 do Header do Usuário inserido
    ${utf8}               Get Dictionary Values      ${RequestAPI.headers}
    ${RespostaAPI}        Remove String    ['application/json; charset=utf-8; v=1.0', 'Sat, 08 Jan 2022 04:46:11 GMT', 'Kestrel', 'chunked', '1.0']
                                    ...    ['application/json; charset=
    ${RespostaAPI}        Remove String    utf-8    ; v=1.0', 'Sat, 08 Jan 2022 04:46:11 GMT', 'Kestrel', 'chunked', '1.0']
    ${RespostaAPI}        Catenate    ${Charset}      ${RespostaAPI}
    Log    ${RespostaAPI}
    
Conferir Resposta API com atributo v 1.0 do Header do Usuário inserido
    ${v1_0}               Get Dictionary Values      ${RequestAPI.headers}
    ${RespostaAPI}        Remove String    ['application/json; charset=utf-8; v=1.0', 'Sat, 08 Jan 2022 04:46:11 GMT', 'Kestrel', 'chunked', '1.0']
                                    ...    ['application/json; charset=utf-8; 
    ${RespostaAPI}        Remove String    1.0    ', 'Sat, 08 Jan 2022 04:46:11 GMT', 'Kestrel', 'chunked', '1.0']
    ${RespostaAPI}        Catenate    ${V}      ${RespostaAPI}
    Log    ${RespostaAPI}
    
Conferir Resposta API com atributo Server Kestrel do Header do Usuário inserido
    ${kestrel}            Get Dictionary Values      ${RequestAPI.headers}
    ${RespostaAPI}        Remove String    ['application/json; charset=utf-8; v=1.0', 'Sat, 08 Jan 2022 04:46:11 GMT', 'Kestrel', 'chunked', '1.0']
                                    ...    ['application/json; charset=utf-8; v=1.0', 'Sat, 08 Jan 2022 04:46:11 GMT', '
    ${RespostaAPI}        Remove String    Kestrel    ', 'chunked', '1.0']
    ${RespostaAPI}        Catenate    ${Server}      ${RespostaAPI}
    Log    ${RespostaAPI}
    
Conferir Resposta API com atributo api-supported-versions 1.0 do Header do Usuário inserido
    ${apiVersions}               Get Dictionary Values      ${RequestAPI.headers}
    ${RespostaAPI}               Remove String    ['application/json; charset=utf-8; v=1.0', 'Tue, 01 Feb 2022 23:24:01 GMT', 'Kestrel', 'chunked', '1.0']
                                        ...       ['application/json; charset=utf-8; v=1.0', 'Tue, 01 Feb 2022 23:24:01 GMT', 'Kestrel', 'chunked', '
                                        ...       ']                                    
    ${RespostaAPI}        Catenate    ${ApiSupportedVersions}       ${RespostaAPI}
    Log    ${RespostaAPI}
    
Conferir Resposta API com atributo Date do Header do Usuário inserido
    ${data}               Get Dictionary Values      ${RequestAPI.headers}
    ${RespostaAPI}        Get Substring    ${data}    1    2
    ${RespostaAPI}        Catenate    ${Date}     ${RespostaAPI}
    Log    ${RespostaAPI}
