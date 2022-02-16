*** Settings ***
Resource       ../../Features/Resources/ResourcesGlobals.robot
Suite Setup    Conectar FakeRESTApi

*** Test Cases ***
Caso de Teste 01 - Realizar requisição (GET) de todos os Usuários com sucesso
    Requisitar todos os Usuários
    Conferir Resposta API com Status Code 200 de todos os Usuários
    Conferir Resposta API com Reason OK de todos os Usuários
    Exibir Resposta API com Header de todos os Usuários
    Exibir Resposta API com Json de todos os Usuários
    Conferir Resposta API com atributo Transfer-Encoding chunked do Header
    Conferir Resposta API com atributo Content-Type application/json do Header
    Conferir Resposta API com atributo charset utf-8 do Header
    Conferir Resposta API com atributo v 1.0 do Header
    Conferir Resposta API com atributo Server Kestrel do Header
    Conferir Resposta API com atributo api-supported-versions 1.0 do Header
    Conferir Resposta API com atributo Date do Header
    Conferir Resposta API com a quantidade de Usuários

Caso de Teste 02 - Realizar requisição (GET) de um Usuário com sucesso
    Requisitar Usuário pelo seu Id
    Conferir Resposta API com Status Code 200 do Usuário pelo seu Id
    Conferir Resposta API com Reason OK do Usuário pelo seu Id
    Exibir Resposta API com Header do Usuário pelo seu Id
    Exibir Resposta API com Json do Usuário pelo seu Id
    Conferir Resposta API com atributo Transfer-Encoding chunked do Header do Usuário pelo seu Id
    Conferir Resposta API com atributo Content-Type application/json do Header do Usuário pelo seu Id
    Conferir Resposta API com atributo charset utf-8 do Header do Usuário pelo seu Id
    Conferir Resposta API com atributo v 1.0 do Header do Usuário pelo seu Id
    Conferir Resposta API com atributo Server Kestrel do Header do Usuário pelo seu Id
    Conferir Resposta API com atributo api-supported-versions 1.0 do Header do Usuário pelo seu Id
    Conferir Resposta API com atributo Date do Header do Usuário pelo seu Id

Caso de Teste 03 - Realizar requisição (POST) de um Usuário com sucesso
    Realizar POST de um Usuário
    Conferir Resposta API com Status Code 200 do Usuário inserido
    Conferir Resposta API com Reason OK do Usuário inserido
    Exibir Resposta API com Header do Usuário inserido
    Exibir Resposta API com Json do Usuário inserido
    Conferir Resposta API com Json pelo id do Usuário inserido
    Conferir Resposta API com Json pelo userName do Usuário inserido
    Conferir Resposta API com Json pelo password do Usuário inserido
    Conferir Resposta API com atributo Transfer-Encoding chunked do Header do Usuário inserido
    Conferir Resposta API com atributo Content-Type application/json do Header do Usuário inserido
    Conferir Resposta API com atributo charset utf-8 do Header do Usuário inserido
    Conferir Resposta API com atributo v 1.0 do Header do Usuário inserido
    Conferir Resposta API com atributo Server Kestrel do Header do Usuário inserido
    Conferir Resposta API com atributo api-supported-versions 1.0 do Header do Usuário inserido
    Conferir Resposta API com atributo Date do Header do Usuário inserido

Caso de Teste 04 - Realizar requisição (PUT) de um Usuário com sucesso
    Realizar PUT de um Usuário
    Conferir Resposta API com Status Code 200 do Usuário atualizado
    Conferir Resposta API com Reason OK do Usuário atualizado
    Exibir Resposta API com Header do Usuário atualizado
    Exibir Resposta API com Json do Usuário atualizado
    Conferir Resposta API com Json pelo id do Usuário atualizado
    Conferir Resposta API com Json pelo userName do Usuário atualizado
    Conferir Resposta API com Json pelo password do Usuário atualizado
    Conferir Resposta API com atributo Transfer-Encoding chunked do Header do Usuário atualizado
    Conferir Resposta API com atributo Content-Type application/json do Header do Usuário atualizado
    Conferir Resposta API com atributo charset utf-8 do Header do Usuário atualizado
    Conferir Resposta API com atributo v 1.0 do Header do Usuário atualizado
    Conferir Resposta API com atributo Server Kestrel do Header do Usuário atualizado
    Conferir Resposta API com atributo api-supported-versions 1.0 do Header do Usuário atualizado
    Conferir Resposta API com atributo Date do Header do Usuário atualizado

Caso de Teste 05 - Realizar requisição (DELETE) de um Usuário com sucesso
    Exibir Resposta API com Json de todos os Usuários antes de realizar DELETE
    Realizar DELETE de um Usuário
    Exibir Resposta API com Json de todos os Usuários após realizar DELETE
    Conferir Resposta API com Status Code 200 do Usuário excluido
    Conferir Resposta API com Reason OK do Usuário excluido
    Conferir Resposta API com atributo Transfer-Encoding chunked do Header do Usuário após exclusão
    Conferir Resposta API com atributo Content-Type application/json do Header do Usuário após exclusão
    Conferir Resposta API com atributo charset utf-8 do Header do Usuário após exclusão
    Conferir Resposta API com atributo v 1.0 do Header do Usuário após exclusão
    Conferir Resposta API com atributo Server Kestrel do Header do Usuário após exclusão
    Conferir Resposta API com atributo api-supported-versions 1.0 do Header do Usuário após exclusão
    Conferir Resposta API com atributo Date do Header do Usuário após exclusão