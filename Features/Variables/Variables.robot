*** Variables ***
### URL ###
${URLBASE}    https://fakerestapi.azurewebsites.net
${PATH}       /api/v1/
${URLFULL}    ${URLBASE}${PATH}

### STATUS CODE ###
${200}    200

### Reason ###
${OK}     OK

### ATRIBUTOS DO HEADER ###
${TransferEncoding}          Transfer-Encoding =
${ContentType}               Content-Type =
${charset}                   Charset =
${V}                         v =
${Server}                    Server =
${ApiSupportedVersions}      Api-Supported-Versions =
${Date}                      Date =

### ATRIBUTOS DO BODY ###
${QuantidadeUsuarios}        Quantidade de Usuários =
${StatusCode}                Status Code =
${Reason}                    Reason =
${IdUsuario}                 Id do Usuário =
${userNameUsuario}           UserName do Usuário =
${passwordUsuario}           Password do Usuário =

### END-POINTS ###
${USER}    /Users