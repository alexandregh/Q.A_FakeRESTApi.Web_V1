*** Settings ***
Library     Collections
Library     RequestsLibrary
Library     String

Resource    ../Variables/Variables.robot

*** Keywords ***
Conectar FakeRESTApi
    Create Session    FakeRESTApi    ${URLFULL}
    ${Resposta}    Session Exists    FakeRESTApi
    Should Be True    ${Resposta}