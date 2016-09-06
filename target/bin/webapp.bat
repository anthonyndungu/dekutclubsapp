@REM ----------------------------------------------------------------------------
@REM  Copyright 2001-2006 The Apache Software Foundation.
@REM
@REM  Licensed under the Apache License, Version 2.0 (the "License");
@REM  you may not use this file except in compliance with the License.
@REM  You may obtain a copy of the License at
@REM
@REM       http://www.apache.org/licenses/LICENSE-2.0
@REM
@REM  Unless required by applicable law or agreed to in writing, software
@REM  distributed under the License is distributed on an "AS IS" BASIS,
@REM  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@REM  See the License for the specific language governing permissions and
@REM  limitations under the License.
@REM ----------------------------------------------------------------------------
@REM
@REM   Copyright (c) 2001-2006 The Apache Software Foundation.  All rights
@REM   reserved.

@echo off

set ERROR_CODE=0

:init
@REM Decide how to startup depending on the version of windows

@REM -- Win98ME
if NOT "%OS%"=="Windows_NT" goto Win9xArg

@REM set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" @setlocal

@REM -- 4NT shell
if "%eval[2+2]" == "4" goto 4NTArgs

@REM -- Regular WinNT shell
set CMD_LINE_ARGS=%*
goto WinNTGetScriptDir

@REM The 4NT Shell from jp software
:4NTArgs
set CMD_LINE_ARGS=%$
goto WinNTGetScriptDir

:Win9xArg
@REM Slurp the command line arguments.  This loop allows for an unlimited number
@REM of arguments (up to the command line limit, anyway).
set CMD_LINE_ARGS=
:Win9xApp
if %1a==a goto Win9xGetScriptDir
set CMD_LINE_ARGS=%CMD_LINE_ARGS% %1
shift
goto Win9xApp

:Win9xGetScriptDir
set SAVEDIR=%CD%
%0\
cd %0\..\.. 
set BASEDIR=%CD%
cd %SAVEDIR%
set SAVE_DIR=
goto repoSetup

:WinNTGetScriptDir
set BASEDIR=%~dp0\..

:repoSetup
set REPO=


if "%JAVACMD%"=="" set JAVACMD=java

if "%REPO%"=="" set REPO=%BASEDIR%\repo

set CLASSPATH="%BASEDIR%"\etc;"%REPO%"\org\springframework\spring-context\4.2.2.RELEASE\spring-context-4.2.2.RELEASE.jar;"%REPO%"\org\springframework\spring-beans\4.2.2.RELEASE\spring-beans-4.2.2.RELEASE.jar;"%REPO%"\org\glassfish\jersey\containers\jersey-container-servlet\2.14\jersey-container-servlet-2.14.jar;"%REPO%"\org\glassfish\jersey\containers\jersey-container-servlet-core\2.14\jersey-container-servlet-core-2.14.jar;"%REPO%"\org\glassfish\jersey\core\jersey-common\2.14\jersey-common-2.14.jar;"%REPO%"\javax\annotation\javax.annotation-api\1.2\javax.annotation-api-1.2.jar;"%REPO%"\org\glassfish\jersey\bundles\repackaged\jersey-guava\2.14\jersey-guava-2.14.jar;"%REPO%"\org\glassfish\hk2\osgi-resource-locator\1.0.1\osgi-resource-locator-1.0.1.jar;"%REPO%"\org\glassfish\jersey\core\jersey-server\2.14\jersey-server-2.14.jar;"%REPO%"\javax\ws\rs\javax.ws.rs-api\2.0.1\javax.ws.rs-api-2.0.1.jar;"%REPO%"\org\glassfish\jersey\core\jersey-client\2.14\jersey-client-2.14.jar;"%REPO%"\org\glassfish\hk2\hk2-api\2.4.0-b06\hk2-api-2.4.0-b06.jar;"%REPO%"\org\glassfish\hk2\hk2-utils\2.4.0-b06\hk2-utils-2.4.0-b06.jar;"%REPO%"\org\glassfish\hk2\external\aopalliance-repackaged\2.4.0-b06\aopalliance-repackaged-2.4.0-b06.jar;"%REPO%"\org\glassfish\hk2\external\javax.inject\2.4.0-b06\javax.inject-2.4.0-b06.jar;"%REPO%"\org\glassfish\hk2\hk2-locator\2.4.0-b06\hk2-locator-2.4.0-b06.jar;"%REPO%"\org\glassfish\jersey\connectors\jersey-apache-connector\2.14\jersey-apache-connector-2.14.jar;"%REPO%"\org\apache\httpcomponents\httpclient\4.3.1\httpclient-4.3.1.jar;"%REPO%"\org\apache\httpcomponents\httpcore\4.3\httpcore-4.3.jar;"%REPO%"\commons-codec\commons-codec\1.6\commons-codec-1.6.jar;"%REPO%"\org\apache\tomcat\embed\tomcat-embed-core\8.0.30\tomcat-embed-core-8.0.30.jar;"%REPO%"\org\apache\tomcat\embed\tomcat-embed-logging-juli\8.0.30\tomcat-embed-logging-juli-8.0.30.jar;"%REPO%"\org\apache\tomcat\embed\tomcat-embed-jasper\8.0.30\tomcat-embed-jasper-8.0.30.jar;"%REPO%"\org\apache\tomcat\embed\tomcat-embed-el\8.0.30\tomcat-embed-el-8.0.30.jar;"%REPO%"\org\eclipse\jdt\core\compiler\ecj\4.4.2\ecj-4.4.2.jar;"%REPO%"\org\apache\tomcat\tomcat-jasper\8.0.30\tomcat-jasper-8.0.30.jar;"%REPO%"\org\apache\tomcat\tomcat-juli\8.0.30\tomcat-juli-8.0.30.jar;"%REPO%"\org\apache\tomcat\tomcat-el-api\8.0.30\tomcat-el-api-8.0.30.jar;"%REPO%"\org\apache\tomcat\tomcat-api\8.0.30\tomcat-api-8.0.30.jar;"%REPO%"\org\apache\tomcat\tomcat-util-scan\8.0.30\tomcat-util-scan-8.0.30.jar;"%REPO%"\org\apache\tomcat\tomcat-util\8.0.30\tomcat-util-8.0.30.jar;"%REPO%"\org\apache\tomcat\tomcat-jasper-el\8.0.30\tomcat-jasper-el-8.0.30.jar;"%REPO%"\org\apache\tomcat\tomcat-jsp-api\8.0.30\tomcat-jsp-api-8.0.30.jar;"%REPO%"\mysql\mysql-connector-java\5.1.32\mysql-connector-java-5.1.32.jar;"%REPO%"\org\springframework\spring-expression\4.2.0.RELEASE\spring-expression-4.2.0.RELEASE.jar;"%REPO%"\org\springframework\spring-tx\4.2.2.RELEASE\spring-tx-4.2.2.RELEASE.jar;"%REPO%"\org\springframework\spring-webmvc\4.3.2.RELEASE\spring-webmvc-4.3.2.RELEASE.jar;"%REPO%"\org\springframework\spring-web\4.3.2.RELEASE\spring-web-4.3.2.RELEASE.jar;"%REPO%"\org\springframework\security\spring-security-web\4.0.1.RELEASE\spring-security-web-4.0.1.RELEASE.jar;"%REPO%"\aopalliance\aopalliance\1.0\aopalliance-1.0.jar;"%REPO%"\org\springframework\security\spring-security-core\4.0.1.RELEASE\spring-security-core-4.0.1.RELEASE.jar;"%REPO%"\org\springframework\spring-context-support\3.0.5.RELEASE\spring-context-support-3.0.5.RELEASE.jar;"%REPO%"\org\springframework\spring-core\4.3.2.RELEASE\spring-core-4.3.2.RELEASE.jar;"%REPO%"\commons-logging\commons-logging\1.2\commons-logging-1.2.jar;"%REPO%"\org\hibernate\hibernate-core\4.0.1.Final\hibernate-core-4.0.1.Final.jar;"%REPO%"\commons-collections\commons-collections\3.2.1\commons-collections-3.2.1.jar;"%REPO%"\antlr\antlr\2.7.7\antlr-2.7.7.jar;"%REPO%"\org\jboss\spec\javax\transaction\jboss-transaction-api_1.1_spec\1.0.0.Final\jboss-transaction-api_1.1_spec-1.0.0.Final.jar;"%REPO%"\dom4j\dom4j\1.6.1\dom4j-1.6.1.jar;"%REPO%"\xml-apis\xml-apis\1.0.b2\xml-apis-1.0.b2.jar;"%REPO%"\org\jboss\logging\jboss-logging\3.1.0.CR2\jboss-logging-3.1.0.CR2.jar;"%REPO%"\org\javassist\javassist\3.15.0-GA\javassist-3.15.0-GA.jar;"%REPO%"\org\hibernate\common\hibernate-commons-annotations\4.0.1.Final\hibernate-commons-annotations-4.0.1.Final.jar;"%REPO%"\org\springframework\spring-orm\4.1.6.RELEASE\spring-orm-4.1.6.RELEASE.jar;"%REPO%"\org\springframework\spring-jdbc\4.1.6.RELEASE\spring-jdbc-4.1.6.RELEASE.jar;"%REPO%"\org\hibernate\hibernate-validator\4.1.0.Final\hibernate-validator-4.1.0.Final.jar;"%REPO%"\org\hibernate\common\hibernate-commons-annotations\4.0.1.Final\hibernate-commons-annotations-4.0.1.Final-tests.jar;"%REPO%"\org\hibernate\javax\persistence\hibernate-jpa-2.0-api\1.0.1.Final\hibernate-jpa-2.0-api-1.0.1.Final.jar;"%REPO%"\org\hibernate\hibernate-entitymanager\4.0.1.Final\hibernate-entitymanager-4.0.1.Final.jar;"%REPO%"\org\hibernate\hibernate-c3p0\4.1.9.Final\hibernate-c3p0-4.1.9.Final.jar;"%REPO%"\c3p0\c3p0\0.9.1\c3p0-0.9.1.jar;"%REPO%"\org\hibernate\hibernate-ehcache\4.1.9.Final\hibernate-ehcache-4.1.9.Final.jar;"%REPO%"\net\sf\ehcache\ehcache-core\2.4.3\ehcache-core-2.4.3.jar;"%REPO%"\org\springframework\spring-aop\4.3.2.RELEASE\spring-aop-4.3.2.RELEASE.jar;"%REPO%"\javax\validation\validation-api\1.0.0.GA\validation-api-1.0.0.GA.jar;"%REPO%"\com\itextpdf\itextpdf\5.5.9\itextpdf-5.5.9.jar;"%REPO%"\javax\mail\mail\1.4.3\mail-1.4.3.jar;"%REPO%"\javax\activation\activation\1.1\activation-1.1.jar;"%REPO%"\org\aspectj\aspectjrt\1.8.1\aspectjrt-1.8.1.jar;"%REPO%"\org\slf4j\slf4j-api\1.7.12\slf4j-api-1.7.12.jar;"%REPO%"\org\slf4j\jcl-over-slf4j\1.7.12\jcl-over-slf4j-1.7.12.jar;"%REPO%"\org\slf4j\slf4j-log4j12\1.7.12\slf4j-log4j12-1.7.12.jar;"%REPO%"\log4j\log4j\1.2.16\log4j-1.2.16.jar;"%REPO%"\javax\inject\javax.inject\1\javax.inject-1.jar;"%REPO%"\javax\servlet\jsp\jstl\jstl-api\1.2\jstl-api-1.2.jar;"%REPO%"\org\glassfish\web\jstl-impl\1.2\jstl-impl-1.2.jar;"%REPO%"\com\fasterxml\jackson\core\jackson-databind\2.5.3\jackson-databind-2.5.3.jar;"%REPO%"\com\fasterxml\jackson\core\jackson-annotations\2.5.0\jackson-annotations-2.5.0.jar;"%REPO%"\com\fasterxml\jackson\core\jackson-core\2.5.3\jackson-core-2.5.3.jar;"%REPO%"\com\rometools\rome\1.5.0\rome-1.5.0.jar;"%REPO%"\com\rometools\rome-utils\1.5.0\rome-utils-1.5.0.jar;"%REPO%"\org\jdom\jdom\2.0.2\jdom-2.0.2.jar;"%REPO%"\joda-time\joda-time\2.3\joda-time-2.3.jar;"%REPO%"\commons-fileupload\commons-fileupload\1.2.2\commons-fileupload-1.2.2.jar;"%REPO%"\commons-io\commons-io\2.0.1\commons-io-2.0.1.jar;"%REPO%"\com\dekutclubs\DekutClubManager\1.0-SNAPSHOT\DekutClubManager-1.0-SNAPSHOT.war

set ENDORSED_DIR=
if NOT "%ENDORSED_DIR%" == "" set CLASSPATH="%BASEDIR%"\%ENDORSED_DIR%\*;%CLASSPATH%

if NOT "%CLASSPATH_PREFIX%" == "" set CLASSPATH=%CLASSPATH_PREFIX%;%CLASSPATH%

@REM Reaching here means variables are defined and arguments have been captured
:endInit

%JAVACMD% %JAVA_OPTS%  -classpath %CLASSPATH% -Dapp.name="webapp" -Dapp.repo="%REPO%" -Dapp.home="%BASEDIR%" -Dbasedir="%BASEDIR%" launch.Main %CMD_LINE_ARGS%
if %ERRORLEVEL% NEQ 0 goto error
goto end

:error
if "%OS%"=="Windows_NT" @endlocal
set ERROR_CODE=%ERRORLEVEL%

:end
@REM set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" goto endNT

@REM For old DOS remove the set variables from ENV - we assume they were not set
@REM before we started - at least we don't leave any baggage around
set CMD_LINE_ARGS=
goto postExec

:endNT
@REM If error code is set to 1 then the endlocal was done already in :error.
if %ERROR_CODE% EQU 0 @endlocal


:postExec

if "%FORCE_EXIT_ON_ERROR%" == "on" (
  if %ERROR_CODE% NEQ 0 exit %ERROR_CODE%
)

exit /B %ERROR_CODE%
