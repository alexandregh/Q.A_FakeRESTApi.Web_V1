*** Settings ***
Resource    ../../../Resources/ResourcesGlobals.robot

*** Keywords ***
Exibir Resposta API com Json de todos os Usuários antes de realizar DELETE
    Log    ${RequestAPI.json()}

Realizar DELETE de um Usuário
    ${idUsuario}           Get Dictionary Items    ${RequestAPI.json()}
    &{header}              Create Dictionary    content-type=application/json    
                               ...              charset=utf-8    
                               ...              v=1.0
    ${RequestAPI}          DELETE On Session    FakeRESTApi    ${USER}/${idUsuario[1]}    # NOME DA REQUISIÇÃO + ENDPOINT + ID
                               ...    data={"id": 40,"userName": "Alexandre Rodrigues da Silva","password": "123456"}
                               ...    headers=${header}
    IF    ${RequestAPI.status_code} == ${200}
        Set Suite Variable    ${RequestAPI}    # !IMPORTANT: Escopo Suite        
    ELSE
        Log    Ocorreu uma falha na Sessão da API
    END

Exibir Resposta API com Json de todos os Usuários após realizar DELETE
    Log    ${RequestAPI.text}

Conferir Resposta API com Status Code ${statuscode} do Usuário excluido
    Should Be Equal As Strings    ${statuscode}    ${RequestAPI.status_code}
    ${RespostaAPI}    Catenate    ${statuscode}    =    ${RequestAPI.status_code}
    Log    ${RespostaAPI}
    
Conferir Resposta API com Reason ${reason} do Usuário excluido
    Should Be Equal As Strings    ${reason}    ${RequestAPI.reason}
    ${RespostaAPI}    Catenate    ${reason}    =    ${RequestAPI.reason}
    Log    ${RespostaAPI}

Conferir Resposta API com atributo Transfer-Encoding chunked do Header do Usuário após exclusão
    ${chunked}            Get Dictionary Values      ${RequestAPI.headers}
    ${RespostaAPI}        Remove String    ['application/json; charset=utf-8; v=1.0', 'Sat, 08 Jan 2022 04:46:11 GMT', 'Kestrel', 'chunked', '1.0']
                                    ...    ['application/json; charset=utf-8; v=1.0', 'Sat, 08 Jan 2022 04:46:11 GMT', 'Kestrel', '
                                    ...    ', '1.0']
    ${RespostaAPI}        Catenate    ${TransferEncoding}     ${RespostaAPI}
    Log    ${RespostaAPI}    
    
Conferir Resposta API com atributo Content-Type application/json do Header do Usuário após exclusão
    ${applicationjson}    Get Dictionary Values      ${RequestAPI.headers}
    ${RespostaAPI}        Remove String    ['application/json; charset=utf-8; v=1.0', 'Sat, 08 Jan 2022 04:46:11 GMT', 'Kestrel', 'chunked', '1.0']
                                    ...    ; charset=utf-8; v=1.0', 'Sat, 08 Jan 2022 04:46:11 GMT', 'Kestrel', 'chunked', '1.0']
                                    ...    ['
    ${RespostaAPI}        Catenate    ${ContentType}     ${RespostaAPI}
    Log    ${RespostaAPI}
    
Conferir Resposta API com atributo charset utf-8 do Header do Usuário após exclusão
    ${utf8}               Get Dictionary Values      ${RequestAPI.headers}
    ${RespostaAPI}        Remove String    ['application/json; charset=utf-8; v=1.0', 'Sat, 08 Jan 2022 04:46:11 GMT', 'Kestrel', 'chunked', '1.0']
                                    ...    ['application/json; charset=
    ${RespostaAPI}        Remove String    utf-8    ; v=1.0', 'Sat, 08 Jan 2022 04:46:11 GMT', 'Kestrel', 'chunked', '1.0']
    ${RespostaAPI}        Catenate    ${Charset}      ${RespostaAPI}
    Log    ${RespostaAPI}
    
Conferir Resposta API com atributo v 1.0 do Header do Usuário após exclusão
    ${v1_0}               Get Dictionary Values      ${RequestAPI.headers}
    ${RespostaAPI}        Remove String    ['application/json; charset=utf-8; v=1.0', 'Sat, 08 Jan 2022 04:46:11 GMT', 'Kestrel', 'chunked', '1.0']
                                    ...    ['application/json; charset=utf-8; 
    ${RespostaAPI}        Remove String    1.0    ', 'Sat, 08 Jan 2022 04:46:11 GMT', 'Kestrel', 'chunked', '1.0']
    ${RespostaAPI}        Catenate    ${V}      ${RespostaAPI}
    Log    ${RespostaAPI}    
    
Conferir Resposta API com atributo Server Kestrel do Header do Usuário após exclusão
    ${kestrel}            Get Dictionary Values      ${RequestAPI.headers}
    ${RespostaAPI}        Remove String    ['application/json; charset=utf-8; v=1.0', 'Sat, 08 Jan 2022 04:46:11 GMT', 'Kestrel', 'chunked', '1.0']
                                    ...    ['application/json; charset=utf-8; v=1.0', 'Sat, 08 Jan 2022 04:46:11 GMT', '
    ${RespostaAPI}        Remove String    Kestrel    ', 'chunked', '1.0']
    ${RespostaAPI}        Catenate    ${Server}      ${RespostaAPI}
    Log    ${RespostaAPI}
    
Conferir Resposta API com atributo api-supported-versions 1.0 do Header do Usuário após exclusão
    ${apiVersions}               Get Dictionary Values      ${RequestAPI.headers}
    ${RespostaAPI}               Remove String    ['application/json; charset=utf-8; v=1.0', 'Tue, 01 Feb 2022 23:24:01 GMT', 'Kestrel', 'chunked', '1.0']
                                        ...       ['application/json; charset=utf-8; v=1.0', 'Tue, 01 Feb 2022 23:24:01 GMT', 'Kestrel', 'chunked', '
                                        ...       ']                                    
    ${RespostaAPI}        Catenate    ${ApiSupportedVersions}       ${RespostaAPI}
    Log    ${RespostaAPI}
    
Conferir Resposta API com atributo Date do Header do Usuário após exclusão
    ${data}               Get Dictionary Values      ${RequestAPI.headers}
    ${RespostaAPI}        Get Substring    ${data}    1    2
    ${RespostaAPI}        Catenate    ${Date}     ${RespostaAPI}
    Log    ${RespostaAPI}
