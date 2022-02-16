*** Settings ***
### BASE ###
Resource    ../Base/Base.robot

### API ###
Resource    ../API/User/GET/APITestsUser.robot
Resource    ../API/User/POST/APITestsUser.robot
Resource    ../API/User/PUT/APITestsUser.robot
Resource    ../API/User/DELETE/APITestsUser.robot