*** Settings ***
Resource    ../../../Resources/ResourcesGlobals.robot

*** Keywords ***
### CONSULTA TODOS OS USUÁRIOS ###
Requisitar todos os Usuários
    ${RequestAPI}          GET On Session    FakeRESTApi    ${URLFULL}${USER}
    IF    ${RequestAPI.status_code} == ${200}
        Set Suite Variable    ${RequestAPI}    # !IMPORTANT: Escopo Suite        
    ELSE
        Log    Ocorreu uma falha na Sessão da API
    END

Conferir Resposta API com Status Code ${statuscode} de todos os Usuários
    Should Be Equal As Strings    ${statuscode}    ${RequestAPI.status_code}
    ${RespostaAPI}    Catenate    ${statuscode}    =    ${RequestAPI.status_code}
    Log    ${RespostaAPI}

Conferir Resposta API com Reason ${reason} de todos os Usuários
    Should Be Equal As Strings    ${reason}    ${RequestAPI.reason}
    ${RespostaAPI}    Catenate    ${reason}    =    ${RequestAPI.reason}
    Log    ${RespostaAPI}

Exibir Resposta API com Header de todos os Usuários
    Log    ${RequestAPI.headers}

Exibir Resposta API com Json de todos os Usuários
    Log    ${RequestAPI.json()}

Conferir Resposta API com atributo Transfer-Encoding chunked do Header
    ${chunked}            Get Dictionary Values      ${RequestAPI.headers}
    ${RespostaAPI}        Remove String    ['application/json; charset=utf-8; v=1.0', 'Sat, 08 Jan 2022 04:46:11 GMT', 'Kestrel', 'chunked', '1.0']
                                    ...    ['application/json; charset=utf-8; v=1.0', 'Sat, 08 Jan 2022 04:46:11 GMT', 'Kestrel', '
    ${RespostaAPI}        Remove String    chunked    ', '1.0']
    ${RespostaAPI}        Catenate    ${TransferEncoding}      ${RespostaAPI}
    Log    ${RespostaAPI}

Conferir Resposta API com atributo Content-Type application/json do Header
    ${applicationjson}    Get Dictionary Values      ${RequestAPI.headers}
    ${RespostaAPI}        Remove String    ['application/json; charset=utf-8; v=1.0', 'Sat, 08 Jan 2022 04:46:11 GMT', 'Kestrel', 'chunked', '1.0']
                                    ...   ; charset=utf-8; v=1.0', 'Sat, 08 Jan 2022 04:46:11 GMT', 'Kestrel', 'chunked', '1.0']
    ${RespostaAPI}        Remove String    ['application/json    ['
    ${RespostaAPI}        Catenate    ${ContentType}      ${RespostaAPI}
    Log    ${RespostaAPI}
    
Conferir Resposta API com atributo charset utf-8 do Header
    ${utf8}               Get Dictionary Values      ${RequestAPI.headers}
    ${RespostaAPI}        Remove String    ['application/json; charset=utf-8; v=1.0', 'Sat, 08 Jan 2022 04:46:11 GMT', 'Kestrel', 'chunked', '1.0']
                                    ...    ['application/json; charset=
    ${RespostaAPI}        Remove String    utf-8    ; v=1.0', 'Sat, 08 Jan 2022 04:46:11 GMT', 'Kestrel', 'chunked', '1.0']
    ${RespostaAPI}        Catenate    ${Charset}      ${RespostaAPI}
    Log    ${RespostaAPI}

Conferir Resposta API com atributo v 1.0 do Header
    ${v1_0}               Get Dictionary Values      ${RequestAPI.headers}
    ${RespostaAPI}        Remove String    ['application/json; charset=utf-8; v=1.0', 'Sat, 08 Jan 2022 04:46:11 GMT', 'Kestrel', 'chunked', '1.0']
                                    ...    ['application/json; charset=utf-8; 
    ${RespostaAPI}        Remove String    1.0    ', 'Sat, 08 Jan 2022 04:46:11 GMT', 'Kestrel', 'chunked', '1.0']
    ${RespostaAPI}        Catenate    ${V}      ${RespostaAPI}
    Log    ${RespostaAPI}

Conferir Resposta API com atributo Server Kestrel do Header
    ${kestrel}            Get Dictionary Values      ${RequestAPI.headers}
    ${RespostaAPI}        Remove String    ['application/json; charset=utf-8; v=1.0', 'Sat, 08 Jan 2022 04:46:11 GMT', 'Kestrel', 'chunked', '1.0']
                                    ...    ['application/json; charset=utf-8; v=1.0', 'Sat, 08 Jan 2022 04:46:11 GMT', '
    ${RespostaAPI}        Remove String    Kestrel    ', 'chunked', '1.0']
    ${RespostaAPI}        Catenate    ${Server}      ${RespostaAPI}
    Log    ${RespostaAPI}

Conferir Resposta API com atributo api-supported-versions 1.0 do Header
    ${apiVersions}        Get Dictionary Values      ${RequestAPI.headers}
    ${RespostaAPI}        Remove String    ['application/json; charset=utf-8; v=1.0', 'Sat, 08 Jan 2022 04:46:11 GMT', 'Kestrel', 'chunked', '1.0']
                                    ...    ['application/json; charset=utf-8; v=1.0', 'Sat, 08 Jan 2022 04:46:11 GMT', 'Kestrel', 'chunked', '
    ${RespostaAPI}        Remove String    1.0    ']
    ${RespostaAPI}        Catenate    ${ApiSupportedVersions}      ${RespostaAPI}
    Log    ${RespostaAPI}

Conferir Resposta API com atributo Date do Header
    ${data}               Get Dictionary Values      ${RequestAPI.headers}
    ${RespostaAPI}        Get Substring    ${data}    1    2
    ${RespostaAPI}        Catenate    ${Date}    ${RespostaAPI}
    Log    ${RespostaAPI}

Conferir Resposta API com a quantidade de Usuários
    ${RespostaAPI}    Get Length    ${RequestAPI.json()}
    ${RespostaAPI}    Catenate      ${QuantidadeUsuarios}    ${RespostaAPI}
    Log    ${RespostaAPI}


### CONSULTA USUÁRIO PELO ID ###
Requisitar Usuário pelo seu Id
    ${IdUsuario}          Generate Random String    1    [NUMBERS]
    IF    ${IdUsuario} == 0
        ${IdUsuario}      Generate Random String    1    [NUMBERS]

        ${RespostaAPI}    GET         ${URLFULL}${USER}/${IdUsuario}
        Status Should Be              ${200}    ${RespostaAPI}
        Should Be Equal As Strings    ${OK}     ${RespostaAPI.reason}
        ${Usuario}    Get Dictionary Values    ${RespostaAPI.json()}
        Log    ${Usuario}
    ELSE
        ${RespostaAPI}    GET         ${URLFULL}${USER}/${IdUsuario}
        Status Should Be              ${200}    ${RespostaAPI}
        Should Be Equal As Strings    ${OK}     ${RespostaAPI.reason}
        ${Usuario}    Get Dictionary Values    ${RespostaAPI.json()}
        Log    ${Usuario}    
    END

Conferir Resposta API com Status Code ${statuscode} do Usuário pelo seu Id
    Should Be Equal As Strings    ${statuscode}    ${RequestAPI.status_code}
    ${RespostaAPI}    Catenate    ${statuscode}    =    ${RequestAPI.status_code}
    Log    ${RespostaAPI}

Conferir Resposta API com Reason ${reason} do Usuário pelo seu Id
    Should Be Equal As Strings    ${reason}    ${RequestAPI.reason}
    ${RespostaAPI}    Catenate    ${reason}    =    ${RequestAPI.reason}
    Log    ${RespostaAPI}

Exibir Resposta API com Header do Usuário pelo seu Id
    Log    ${RequestAPI.headers}

Exibir Resposta API com Json do Usuário pelo seu Id
    Log    ${RequestAPI.json()}

Conferir Resposta API com atributo Transfer-Encoding chunked do Header do Usuário pelo seu Id
    ${chunked}            Get Dictionary Values      ${RequestAPI.headers}
    ${RespostaAPI}        Remove String    ['application/json; charset=utf-8; v=1.0', 'Sat, 08 Jan 2022 04:46:11 GMT', 'Kestrel', 'chunked', '1.0']
                                    ...    ['application/json; charset=utf-8; v=1.0', 'Sat, 08 Jan 2022 04:46:11 GMT', 'Kestrel', '
    ${RespostaAPI}        Remove String    chunked    ', '1.0']
    ${RespostaAPI}        Catenate    ${TransferEncoding}      ${RespostaAPI}
    Log    ${RespostaAPI}

Conferir Resposta API com atributo Content-Type application/json do Header do Usuário pelo seu Id
    ${applicationjson}    Get Dictionary Values      ${RequestAPI.headers}
    ${RespostaAPI}        Remove String    ['application/json; charset=utf-8; v=1.0', 'Sat, 08 Jan 2022 04:46:11 GMT', 'Kestrel', 'chunked', '1.0']
                                    ...   ; charset=utf-8; v=1.0', 'Sat, 08 Jan 2022 04:46:11 GMT', 'Kestrel', 'chunked', '1.0']
    ${RespostaAPI}        Remove String    ['application/json    ['
    ${RespostaAPI}        Catenate    ${ContentType}      ${RespostaAPI}
    Log    ${RespostaAPI}

Conferir Resposta API com atributo charset utf-8 do Header do Usuário pelo seu Id
    ${utf8}               Get Dictionary Values      ${RequestAPI.headers}
    ${RespostaAPI}        Remove String    ['application/json; charset=utf-8; v=1.0', 'Sat, 08 Jan 2022 04:46:11 GMT', 'Kestrel', 'chunked', '1.0']
                                    ...    ['application/json; charset=
    ${RespostaAPI}        Remove String    utf-8    ; v=1.0', 'Sat, 08 Jan 2022 04:46:11 GMT', 'Kestrel', 'chunked', '1.0']
    ${RespostaAPI}        Catenate    ${Charset}      ${RespostaAPI}
    Log    ${RespostaAPI}

Conferir Resposta API com atributo v 1.0 do Header do Usuário pelo seu Id
    ${v1_0}               Get Dictionary Values      ${RequestAPI.headers}
    ${RespostaAPI}        Remove String    ['application/json; charset=utf-8; v=1.0', 'Sat, 08 Jan 2022 04:46:11 GMT', 'Kestrel', 'chunked', '1.0']
                                    ...    ['application/json; charset=utf-8; 
    ${RespostaAPI}        Remove String    1.0    ', 'Sat, 08 Jan 2022 04:46:11 GMT', 'Kestrel', 'chunked', '1.0']
    ${RespostaAPI}        Catenate    ${V}      ${RespostaAPI}
    Log    ${RespostaAPI}    
    
Conferir Resposta API com atributo Server Kestrel do Header do Usuário pelo seu Id
    ${kestrel}            Get Dictionary Values      ${RequestAPI.headers}
    ${RespostaAPI}        Remove String    ['application/json; charset=utf-8; v=1.0', 'Sat, 08 Jan 2022 04:46:11 GMT', 'Kestrel', 'chunked', '1.0']
                                    ...    ['application/json; charset=utf-8; v=1.0', 'Sat, 08 Jan 2022 04:46:11 GMT', '
    ${RespostaAPI}        Remove String    Kestrel    ', 'chunked', '1.0']
    ${RespostaAPI}        Catenate    ${Server}      ${RespostaAPI}
    Log    ${RespostaAPI}

Conferir Resposta API com atributo api-supported-versions 1.0 do Header do Usuário pelo seu Id
    ${apiVersions}        Get Dictionary Values      ${RequestAPI.headers}
    ${RespostaAPI}        Remove String    ['application/json; charset=utf-8; v=1.0', 'Sat, 08 Jan 2022 04:46:11 GMT', 'Kestrel', 'chunked', '1.0']
                                    ...    ['application/json; charset=utf-8; v=1.0', 'Sat, 08 Jan 2022 04:46:11 GMT', 'Kestrel', 'chunked', '
    ${RespostaAPI}        Remove String    1.0    ']
    ${RespostaAPI}        Catenate    ${ApiSupportedVersions}      ${RespostaAPI}
    Log    ${RespostaAPI}    

Conferir Resposta API com atributo Date do Header do Usuário pelo seu Id
    ${data}               Get Dictionary Values      ${RequestAPI.headers}
    ${RespostaAPI}        Get Substring    ${data}    1    2
    Log    ${RespostaAPI}
    ${RespostaAPI}        Catenate    ${Date}    ${RespostaAPI}
    Log    ${RespostaAPI}
