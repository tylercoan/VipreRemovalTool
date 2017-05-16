@echo off
setlocal
 
echo ####################################################
echo #                                                  #
echo #         VIPRE Business Removal Tool v0.3         #
echo #                                                  #
echo #            Last update: May 16, 2017             #
echo #    Source Instructions: http://bit.ly/1qeyRtH    #
echo #                                                  #
echo ####################################################
echo .
echo THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
echo IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
echo FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
echo AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
echo LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
echo OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
echo THE SOFTWARE.
echo.
set /p AREYOUSURE="Have you read, understand, and agree to the disclaimer? [y/N] "
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END
 
 
echo.
echo Step 1: Running MsiExec /x on known GUIDs
echo.
echo NOTE: You may receive multiple errors saying something to the effect of:
echo.
echo This installation package could not be opened.  Verify that the package exists and that you can access it, or contact the application vendor to verify that this is a valid Windows Installer package.
echo.
echo This is normal.  Just click OK to proceed to the next one.
 
rem 9.6.6194 Agents
start /wait MsiExec.exe /x 8E94C826-08F4-45AF-B225-E120BE227C0B /qf /l*v "%temp%\VIPRE_MsiUninstall.log" REMOVE=ALL
start /wait MsiExec.exe /x A0428E33-FC8A-45AF-BFAC-D2E2A4B4E0A4 /qf /l*v "%temp%\VIPRE_MsiUninstall.log" REMOVE=ALL
start /wait MsiExec.exe /x 070BA5FF-CB66-4376-B088-0E0234310DCF /qf /l*v "%temp%\VIPRE_MsiUninstall.log" REMOVE=ALL

rem 9.6.6190 Agents
start /wait MsiExec.exe /x 7495E9C8-564D-4B31-97D6-840AF37D205C /qf /l*v "%temp%\VIPRE_MsiUninstall.log" REMOVE=ALL

rem 9.5.6159 Agents
start /wait MsiExec.exe /x C5A52260-126B-44C4-BAB6-A23D73CB8F62 /qf /l*v "%temp%\VIPRE_MsiUninstall.log" REMOVE=ALL
start /wait MsiExec.exe /x 3F0F54DF-836C-43D3-A1AF-AB4A4905B224 /qf /l*v "%temp%\VIPRE_MsiUninstall.log" REMOVE=ALL
start /wait MsiExec.exe /x 01C0B63C-D9E2-496E-B500-FEB4E0F6A1E4 /qf /l*v "%temp%\VIPRE_MsiUninstall.log" REMOVE=ALL

rem 9.5.6154 Agents
start /wait MsiExec.exe /x 7158DDCA-1459-4002-BB76-622BFE138B89 /qf /l*v "%temp%\VIPRE_MsiUninstall.log" REMOVE=ALL
start /wait MsiExec.exe /x 4070DFC4-DFB3-4F15-B78F-49B14A6357BF /qf /l*v "%temp%\VIPRE_MsiUninstall.log" REMOVE=ALL
start /wait MsiExec.exe /x EF078905-EA54-4E34-929E-28A75445F04D /qf /l*v "%temp%\VIPRE_MsiUninstall.log" REMOVE=ALL

rem 9.3.6032 Agents
start /wait MsiExec.exe /x 3945FDDF-3F01-45C5-98F3-483CA13DA7BE /qf /l*v "%temp%\VIPRE_MsiUninstall.log" REMOVE=ALL
start /wait MsiExec.exe /x 30D65515-CCD4-4CAF-AC61-836539CB2A63 /qf /l*v "%temp%\VIPRE_MsiUninstall.log" REMOVE=ALL
start /wait MsiExec.exe /x D10CB7F9-53B4-4ABD-936F-AA93CD1D9C65 /qf /l*v "%temp%\VIPRE_MsiUninstall.log" REMOVE=ALL

rem 9.3.6030 Agents
start /wait MsiExec.exe /x C6AB2467-7C8B-4523-A18C-C466049DBA4C /qf /l*v "%temp%\VIPRE_MsiUninstall.log" REMOVE=ALL
start /wait MsiExec.exe /x 345888D4-199F-48D1-A89C-694B48F2F5A3 /qf /l*v "%temp%\VIPRE_MsiUninstall.log" REMOVE=ALL
start /wait MsiExec.exe /x 1D9E6C77-07CA-43B1-9A25-BF4FA0EA8758 /qf /l*v "%temp%\VIPRE_MsiUninstall.log" REMOVE=ALL

rem 9.3.6012 Agents
start /wait MsiExec.exe /x 077A97DD-E63E-4A4F-B39C-E1111AA9E151 /qf /l*v "%temp%\VIPRE_MsiUninstall.log" REMOVE=ALL
start /wait MsiExec.exe /x 28090F18-50E3-4AE6-B258-D27DEC2404D9 /qf /l*v "%temp%\VIPRE_MsiUninstall.log" REMOVE=ALL
start /wait MsiExec.exe /x 3D81A81B-477F-4D0D-8B3C-599E032CF283 /qf /l*v "%temp%\VIPRE_MsiUninstall.log" REMOVE=ALL

rem 9.3.6000 Agents
start /wait MsiExec.exe /x 2B43966F-3C72-4D34-AB5A-2D35F5320C4C /qf /l*v "%temp%\VIPRE_MsiUninstall.log" REMOVE=ALL
start /wait MsiExec.exe /x 0C92648E-DC79-4A1E-A63A-FA7492E8CDA7 /qf /l*v "%temp%\VIPRE_MsiUninstall.log" REMOVE=ALL
start /wait MsiExec.exe /x 2645C2A8-4700-46F9-B2F7-A0E826DBCF91 /qf /l*v "%temp%\VIPRE_MsiUninstall.log" REMOVE=ALL
 
echo Done.
echo.
echo Step 2: Stopping and deleting services
 
SC stop gfiark
SC Delete gfiark
 
SC stop gfiutil
SC Delete gfiutil
 
SC stop SBAMSvc
SC Delete SBAMSvc

SC stop SBAPHD
SC Delete SBAPHD
 
SC stop SBAPIFS
SC Delete SBAPIFS
 
SC stop SBEMI
SC Delete SBEMI
 
SC stop SbFw
SC Delete SbFw

SC stop SBFWIMCL
SC Delete SBFWIMCL

SC stop SBFWIMCLMP
SC Delete SBFWIMCLMP
 
SC stop SBHIPS
SC Delete SBHIPS
 
SC stop SBPIMSVC
SC Delete SBPIMSVC
 
SC stop SBRE
SC Delete SBRE

SC stop SBTIS
SC Delete SBTIS

SC stop SBWTIS
SC Delete SBWTIS

SC stop VipreEdgeProtection
SC Delete VipreEdgeProtection
 
 
echo Done.
echo.
echo Step 3: Removing registry entries if they exist
 
reg query HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{C1D1FC57-3EB9-4B21-BCA3-F1C927508200}
if not ErrorLevel 1 (
  reg delete HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{C1D1FC57-3EB9-4B21-BCA3-F1C927508200}
)

reg query HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{3F0F54DF-836C-43D3-A1AF-AB4A4905B224}
if not ErrorLevel 1 (
  reg delete HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{3F0F54DF-836C-43D3-A1AF-AB4A4905B224}
)

reg query HKLM\Software\Wow6432Node\Sunbelt Software\Sunbelt Enterprise Agent
if not ErrorLevel 1 (
  reg delete HKLM\Software\Wow6432Node\Sunbelt Software\Sunbelt Enterprise Agent
)

reg query HKLM\Software\Wow6432Node\GFI Software\GFI Business Agent
if not ErrorLevel 1 (
  reg delete HKLM\Software\Wow6432Node\GFI Software\GFI Business Agent
)

reg query HKLM\Software\Wow6432Node\GFI Software\Deployment
if not ErrorLevel 1 (
  reg delete HKLM\Software\Wow6432Node\GFI Software\Deployment
)

reg query HKLM\Software\Wow6432Node\SBAMSvc
if not ErrorLevel 1 (
  reg delete HKLM\Software\Wow6432Node\SBAMSvc
)

reg query HKLM\Software\Wow6432Node\SBAMSvcVolatile
if not ErrorLevel 1 (
  reg delete HKLM\Software\Wow6432Node\SBAMSvcVolatile
)

reg query HKLM\Software\Wow6432Node\VIPRE Business Agent
if not ErrorLevel 1 (
  reg delete HKLM\Software\Wow6432Node\VIPRE Business Agent
)

reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\06225A5CB6214C44AB6B2AD337BCF826
if not ErrorLevel 1 (
  reg delete HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\06225A5CB6214C44AB6B2AD337BCF826
)

reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\0C90801EF56E39443AB1F368BDE6E9A2
if not ErrorLevel 1 (
  reg delete HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\0C90801EF56E39443AB1F368BDE6E9A2
)

reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\116445D9734F351419E319EC305638CC
if not ErrorLevel 1 (
  reg delete HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\116445D9734F351419E319EC305638CC
)

reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\18918EC9E846D9C4CAF2B621091709F3
if not ErrorLevel 1 (
  reg delete HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\18918EC9E846D9C4CAF2B621091709F3
)

reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\2B680A936D70B034EAE58BCAC18C347A
if not ErrorLevel 1 (
  reg delete HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\2B680A936D70B034EAE58BCAC18C347A
)

reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\33E8240AA8CFFA54FBCA2D2E4A4B0E4A
if not ErrorLevel 1 (
  reg delete HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\33E8240AA8CFFA54FBCA2D2E4A4B0E4A
)

reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\3709C2B8849C330439FE7E7F184EE353
if not ErrorLevel 1 (
  reg delete HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\3709C2B8849C330439FE7E7F184EE353
)

reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\4333AC6527B81D84187EE35F42E3545D
if not ErrorLevel 1 (
  reg delete HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\4333AC6527B81D84187EE35F42E3545D
)

reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\4CFD07043BFD51F47BF8941BA43675FB
if not ErrorLevel 1 (
  reg delete HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\4CFD07043BFD51F47BF8941BA43675FB
)

reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\4D888543F9911D848AC996B4842F5F3A
if not ErrorLevel 1 (
  reg delete HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\4D888543F9911D848AC996B4842F5F3A
)

reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\50178FD3AC9260F4A9CC7154FA4E5955
if not ErrorLevel 1 (
  reg delete HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\50178FD3AC9260F4A9CC7154FA4E5955
)

reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\509870FE45AE43E429E9827A45540FD4
if not ErrorLevel 1 (
  reg delete HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\509870FE45AE43E429E9827A45540FD4
)

reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\51556D034DCCFAC4CA16385693BCA236
if not ErrorLevel 1 (
  reg delete HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\51556D034DCCFAC4CA16385693BCA236
)

reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\5C64BF28D4948A14184C2ECC901496EB
if not ErrorLevel 1 (
  reg delete HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\5C64BF28D4948A14184C2ECC901496EB
)

reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\628C49E84F80FA542B521E02EB22C7B0
if not ErrorLevel 1 (
  reg delete HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\628C49E84F80FA542B521E02EB22C7B0
)

reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\67DD586D3A7716649B0FD7EAD2562106
if not ErrorLevel 1 (
  reg delete HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\67DD586D3A7716649B0FD7EAD2562106
)

reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\7642BA6CB8C732541AC84C6640D9ABC4
if not ErrorLevel 1 (
  reg delete HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\7642BA6CB8C732541AC84C6640D9ABC4
)

reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\77C6E9D1AC701B34A952FBF40AAE7885
if not ErrorLevel 1 (
  reg delete HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\77C6E9D1AC701B34A952FBF40AAE7885
)

reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\81F090823E056EA42B852DD7CE42409D
if not ErrorLevel 1 (
  reg delete HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\81F090823E056EA42B852DD7CE42409D
)

reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\8A2C546200749F642B7F0A8E62BDFC19
if not ErrorLevel 1 (
  reg delete HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\8A2C546200749F642B7F0A8E62BDFC19
)

reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\8C9E5947D46513B4796D48A03FD702C5
if not ErrorLevel 1 (
  reg delete HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\8C9E5947D46513B4796D48A03FD702C5
)

reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\8EAC1AABB7E80004CA6583CAB87B05A6
if not ErrorLevel 1 (
  reg delete HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\8EAC1AABB7E80004CA6583CAB87B05A6
)

reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\96AEC1CCFA7BEE74BA46867B1A2E3FFC
if not ErrorLevel 1 (
  reg delete HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\96AEC1CCFA7BEE74BA46867B1A2E3FFC
)

reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\9D9AEDB188972CB4D83EA24E6B6E9596
if not ErrorLevel 1 (
  reg delete HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\9D9AEDB188972CB4D83EA24E6B6E9596
)

reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\9F7BC01D4B35DBA439F6AA39DCD1C956
if not ErrorLevel 1 (
  reg delete HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\9F7BC01D4B35DBA439F6AA39DCD1C956
)

reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\ACDD851795412004BB6726B2EF31B898
if not ErrorLevel 1 (
  reg delete HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\ACDD851795412004BB6726B2EF31B898
)

reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\B18A18D3F774D0D4B8C395E930C22F38
if not ErrorLevel 1 (
  reg delete HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\B18A18D3F774D0D4B8C395E930C22F38
)

reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\C21346408A6123D4299DD1D723899DC1
if not ErrorLevel 1 (
  reg delete HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\C21346408A6123D4299DD1D723899DC1
)

reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\C36B0C102E9DE6945B00EF4B0E6F1A4E
if not ErrorLevel 1 (
  reg delete HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\C36B0C102E9DE6945B00EF4B0E6F1A4E
)

reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\C928BABD4AA3D694D99624F210BD8691
if not ErrorLevel 1 (
  reg delete HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\C928BABD4AA3D694D99624F210BD8691
)

reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\DD79A770E36EF4A43BC91E11A19A1E15
if not ErrorLevel 1 (
  reg delete HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\DD79A770E36EF4A43BC91E11A19A1E15
)

reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\E84629C097CDE1A46AA3AF47298EDC7A
if not ErrorLevel 1 (
  reg delete HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\E84629C097CDE1A46AA3AF47298EDC7A
)

reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\F66934B227C343D4BAA5D2535F23C0C4
if not ErrorLevel 1 (
  reg delete HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\F66934B227C343D4BAA5D2535F23C0C4
)

reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\FD45F0F3C6383D341AFABAA494502B42
if not ErrorLevel 1 (
  reg delete HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\FD45F0F3C6383D341AFABAA494502B42
)

reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\FDDF549310F35C54893F84C31AD37AEB
if not ErrorLevel 1 (
  reg delete HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\FDDF549310F35C54893F84C31AD37AEB
)

reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\FF5AB07066BC67340B88E0204313D0FC
if not ErrorLevel 1 (
  reg delete HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Products\FF5AB07066BC67340B88E0204313D0FC
)

reg query HKLM\Software\Classes\Installer\Features\06225A5CB6214C44AB6B2AD337BCF826
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Features\06225A5CB6214C44AB6B2AD337BCF826
)

reg query HKLM\Software\Classes\Installer\Features\0C90801EF56E39443AB1F368BDE6E9A2
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Features\0C90801EF56E39443AB1F368BDE6E9A2
)

reg query HKLM\Software\Classes\Installer\Features\116445D9734F351419E319EC305638CC
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Features\116445D9734F351419E319EC305638CC
)

reg query HKLM\Software\Classes\Installer\Features\18918EC9E846D9C4CAF2B621091709F3
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Features\18918EC9E846D9C4CAF2B621091709F3
)

reg query HKLM\Software\Classes\Installer\Features\2B680A936D70B034EAE58BCAC18C347A
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Features\2B680A936D70B034EAE58BCAC18C347A
)

reg query HKLM\Software\Classes\Installer\Features\33E8240AA8CFFA54FBCA2D2E4A4B0E4A
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Features\33E8240AA8CFFA54FBCA2D2E4A4B0E4A
)

reg query HKLM\Software\Classes\Installer\Features\3709C2B8849C330439FE7E7F184EE353
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Features\3709C2B8849C330439FE7E7F184EE353
)

reg query HKLM\Software\Classes\Installer\Features\4333AC6527B81D84187EE35F42E3545D
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Features\4333AC6527B81D84187EE35F42E3545D
)

reg query HKLM\Software\Classes\Installer\Features\4CFD07043BFD51F47BF8941BA43675FB
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Features\4CFD07043BFD51F47BF8941BA43675FB
)

reg query HKLM\Software\Classes\Installer\Features\4D888543F9911D848AC996B4842F5F3A
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Features\4D888543F9911D848AC996B4842F5F3A
)

reg query HKLM\Software\Classes\Installer\Features\50178FD3AC9260F4A9CC7154FA4E5955
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Features\50178FD3AC9260F4A9CC7154FA4E5955
)

reg query HKLM\Software\Classes\Installer\Features\509870FE45AE43E429E9827A45540FD4
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Features\509870FE45AE43E429E9827A45540FD4
)

reg query HKLM\Software\Classes\Installer\Features\51556D034DCCFAC4CA16385693BCA236
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Features\51556D034DCCFAC4CA16385693BCA236
)

reg query HKLM\Software\Classes\Installer\Features\5C64BF28D4948A14184C2ECC901496EB
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Features\5C64BF28D4948A14184C2ECC901496EB
)

reg query HKLM\Software\Classes\Installer\Features\628C49E84F80FA542B521E02EB22C7B0
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Features\628C49E84F80FA542B521E02EB22C7B0
)

reg query HKLM\Software\Classes\Installer\Features\67DD586D3A7716649B0FD7EAD2562106
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Features\67DD586D3A7716649B0FD7EAD2562106
)

reg query HKLM\Software\Classes\Installer\Features\7642BA6CB8C732541AC84C6640D9ABC4
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Features\7642BA6CB8C732541AC84C6640D9ABC4
)

reg query HKLM\Software\Classes\Installer\Features\77C6E9D1AC701B34A952FBF40AAE7885
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Features\77C6E9D1AC701B34A952FBF40AAE7885
)

reg query HKLM\Software\Classes\Installer\Features\81F090823E056EA42B852DD7CE42409D
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Features\81F090823E056EA42B852DD7CE42409D
)

reg query HKLM\Software\Classes\Installer\Features\8A2C546200749F642B7F0A8E62BDFC19
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Features\8A2C546200749F642B7F0A8E62BDFC19
)

reg query HKLM\Software\Classes\Installer\Features\8C9E5947D46513B4796D48A03FD702C5
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Features\8C9E5947D46513B4796D48A03FD702C5
)

reg query HKLM\Software\Classes\Installer\Features\8EAC1AABB7E80004CA6583CAB87B05A6
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Features\8EAC1AABB7E80004CA6583CAB87B05A6
)

reg query HKLM\Software\Classes\Installer\Features\96AEC1CCFA7BEE74BA46867B1A2E3FFC
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Features\96AEC1CCFA7BEE74BA46867B1A2E3FFC
)

reg query HKLM\Software\Classes\Installer\Features\9D9AEDB188972CB4D83EA24E6B6E9596
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Features\9D9AEDB188972CB4D83EA24E6B6E9596
)

reg query HKLM\Software\Classes\Installer\Features\9F7BC01D4B35DBA439F6AA39DCD1C956
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Features\9F7BC01D4B35DBA439F6AA39DCD1C956
)

reg query HKLM\Software\Classes\Installer\Features\ACDD851795412004BB6726B2EF31B898
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Features\ACDD851795412004BB6726B2EF31B898
)

reg query HKLM\Software\Classes\Installer\Features\B18A18D3F774D0D4B8C395E930C22F38
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Features\B18A18D3F774D0D4B8C395E930C22F38
)

reg query HKLM\Software\Classes\Installer\Features\C21346408A6123D4299DD1D723899DC1
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Features\C21346408A6123D4299DD1D723899DC1
)

reg query HKLM\Software\Classes\Installer\Features\C36B0C102E9DE6945B00EF4B0E6F1A4E
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Features\C36B0C102E9DE6945B00EF4B0E6F1A4E
)

reg query HKLM\Software\Classes\Installer\Features\C928BABD4AA3D694D99624F210BD8691
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Features\C928BABD4AA3D694D99624F210BD8691
)

reg query HKLM\Software\Classes\Installer\Features\DD79A770E36EF4A43BC91E11A19A1E15
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Features\DD79A770E36EF4A43BC91E11A19A1E15
)

reg query HKLM\Software\Classes\Installer\Features\E84629C097CDE1A46AA3AF47298EDC7A
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Features\E84629C097CDE1A46AA3AF47298EDC7A
)

reg query HKLM\Software\Classes\Installer\Features\F66934B227C343D4BAA5D2535F23C0C4
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Features\F66934B227C343D4BAA5D2535F23C0C4
)

reg query HKLM\Software\Classes\Installer\Features\FD45F0F3C6383D341AFABAA494502B42
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Features\FD45F0F3C6383D341AFABAA494502B42
)

reg query HKLM\Software\Classes\Installer\Features\FDDF549310F35C54893F84C31AD37AEB
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Features\FDDF549310F35C54893F84C31AD37AEB
)

reg query HKLM\Software\Classes\Installer\Features\FF5AB07066BC67340B88E0204313D0FC
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Features\FF5AB07066BC67340B88E0204313D0FC
)

reg query HKLM\Software\Classes\Installer\Products\06225A5CB6214C44AB6B2AD337BCF826
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Products\06225A5CB6214C44AB6B2AD337BCF826
)

reg query HKLM\Software\Classes\Installer\Products\0C90801EF56E39443AB1F368BDE6E9A2
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Products\0C90801EF56E39443AB1F368BDE6E9A2
)

reg query HKLM\Software\Classes\Installer\Products\116445D9734F351419E319EC305638CC
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Products\116445D9734F351419E319EC305638CC
)

reg query HKLM\Software\Classes\Installer\Products\18918EC9E846D9C4CAF2B621091709F3
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Products\18918EC9E846D9C4CAF2B621091709F3
)

reg query HKLM\Software\Classes\Installer\Products\2B680A936D70B034EAE58BCAC18C347A
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Products\2B680A936D70B034EAE58BCAC18C347A
)

reg query HKLM\Software\Classes\Installer\Products\33E8240AA8CFFA54FBCA2D2E4A4B0E4A
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Products\33E8240AA8CFFA54FBCA2D2E4A4B0E4A
)

reg query HKLM\Software\Classes\Installer\Products\3709C2B8849C330439FE7E7F184EE353
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Products\3709C2B8849C330439FE7E7F184EE353
)

reg query HKLM\Software\Classes\Installer\Products\4333AC6527B81D84187EE35F42E3545D
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Products\4333AC6527B81D84187EE35F42E3545D
)

reg query HKLM\Software\Classes\Installer\Products\4CFD07043BFD51F47BF8941BA43675FB
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Products\4CFD07043BFD51F47BF8941BA43675FB
)

reg query HKLM\Software\Classes\Installer\Products\4D888543F9911D848AC996B4842F5F3A
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Products\4D888543F9911D848AC996B4842F5F3A
)

reg query HKLM\Software\Classes\Installer\Products\50178FD3AC9260F4A9CC7154FA4E5955
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Products\50178FD3AC9260F4A9CC7154FA4E5955
)

reg query HKLM\Software\Classes\Installer\Products\509870FE45AE43E429E9827A45540FD4
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Products\509870FE45AE43E429E9827A45540FD4
)

reg query HKLM\Software\Classes\Installer\Products\51556D034DCCFAC4CA16385693BCA236
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Products\51556D034DCCFAC4CA16385693BCA236
)

reg query HKLM\Software\Classes\Installer\Products\5C64BF28D4948A14184C2ECC901496EB
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Products\5C64BF28D4948A14184C2ECC901496EB
)

reg query HKLM\Software\Classes\Installer\Products\628C49E84F80FA542B521E02EB22C7B0
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Products\628C49E84F80FA542B521E02EB22C7B0
)

reg query HKLM\Software\Classes\Installer\Products\67DD586D3A7716649B0FD7EAD2562106
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Products\67DD586D3A7716649B0FD7EAD2562106
)

reg query HKLM\Software\Classes\Installer\Products\7642BA6CB8C732541AC84C6640D9ABC4
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Products\7642BA6CB8C732541AC84C6640D9ABC4
)

reg query HKLM\Software\Classes\Installer\Products\77C6E9D1AC701B34A952FBF40AAE7885
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Products\77C6E9D1AC701B34A952FBF40AAE7885
)

reg query HKLM\Software\Classes\Installer\Products\81F090823E056EA42B852DD7CE42409D
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Products\81F090823E056EA42B852DD7CE42409D
)

reg query HKLM\Software\Classes\Installer\Products\8A2C546200749F642B7F0A8E62BDFC19
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Products\8A2C546200749F642B7F0A8E62BDFC19
)

reg query HKLM\Software\Classes\Installer\Products\8C9E5947D46513B4796D48A03FD702C5
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Products\8C9E5947D46513B4796D48A03FD702C5
)

reg query HKLM\Software\Classes\Installer\Products\8EAC1AABB7E80004CA6583CAB87B05A6
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Products\8EAC1AABB7E80004CA6583CAB87B05A6
)

reg query HKLM\Software\Classes\Installer\Products\96AEC1CCFA7BEE74BA46867B1A2E3FFC
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Products\96AEC1CCFA7BEE74BA46867B1A2E3FFC
)

reg query HKLM\Software\Classes\Installer\Products\9D9AEDB188972CB4D83EA24E6B6E9596
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Products\9D9AEDB188972CB4D83EA24E6B6E9596
)

reg query HKLM\Software\Classes\Installer\Products\9F7BC01D4B35DBA439F6AA39DCD1C956
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Products\9F7BC01D4B35DBA439F6AA39DCD1C956
)

reg query HKLM\Software\Classes\Installer\Products\ACDD851795412004BB6726B2EF31B898
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Products\ACDD851795412004BB6726B2EF31B898
)

reg query HKLM\Software\Classes\Installer\Products\B18A18D3F774D0D4B8C395E930C22F38
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Products\B18A18D3F774D0D4B8C395E930C22F38
)

reg query HKLM\Software\Classes\Installer\Products\C21346408A6123D4299DD1D723899DC1
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Products\C21346408A6123D4299DD1D723899DC1
)

reg query HKLM\Software\Classes\Installer\Products\C36B0C102E9DE6945B00EF4B0E6F1A4E
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Products\C36B0C102E9DE6945B00EF4B0E6F1A4E
)

reg query HKLM\Software\Classes\Installer\Products\C928BABD4AA3D694D99624F210BD8691
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Products\C928BABD4AA3D694D99624F210BD8691
)

reg query HKLM\Software\Classes\Installer\Products\DD79A770E36EF4A43BC91E11A19A1E15
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Products\DD79A770E36EF4A43BC91E11A19A1E15
)

reg query HKLM\Software\Classes\Installer\Products\E84629C097CDE1A46AA3AF47298EDC7A
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Products\E84629C097CDE1A46AA3AF47298EDC7A
)

reg query HKLM\Software\Classes\Installer\Products\F66934B227C343D4BAA5D2535F23C0C4
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Products\F66934B227C343D4BAA5D2535F23C0C4
)

reg query HKLM\Software\Classes\Installer\Products\FD45F0F3C6383D341AFABAA494502B42
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Products\FD45F0F3C6383D341AFABAA494502B42
)

reg query HKLM\Software\Classes\Installer\Products\FDDF549310F35C54893F84C31AD37AEB
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Products\FDDF549310F35C54893F84C31AD37AEB
)

reg query HKLM\Software\Classes\Installer\Products\FF5AB07066BC67340B88E0204313D0FC
if not ErrorLevel 1 (
  reg delete HKLM\Software\Classes\Installer\Products\FF5AB07066BC67340B88E0204313D0FC
)

reg query HKCR\Installer\Products\06225A5CB6214C44AB6B2AD337BCF826
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Products\06225A5CB6214C44AB6B2AD337BCF826
)

reg query HKCR\Installer\Products\0C90801EF56E39443AB1F368BDE6E9A2
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Products\0C90801EF56E39443AB1F368BDE6E9A2
)

reg query HKCR\Installer\Products\116445D9734F351419E319EC305638CC
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Products\116445D9734F351419E319EC305638CC
)

reg query HKCR\Installer\Products\18918EC9E846D9C4CAF2B621091709F3
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Products\18918EC9E846D9C4CAF2B621091709F3
)

reg query HKCR\Installer\Products\2B680A936D70B034EAE58BCAC18C347A
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Products\2B680A936D70B034EAE58BCAC18C347A
)

reg query HKCR\Installer\Products\33E8240AA8CFFA54FBCA2D2E4A4B0E4A
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Products\33E8240AA8CFFA54FBCA2D2E4A4B0E4A
)

reg query HKCR\Installer\Products\3709C2B8849C330439FE7E7F184EE353
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Products\3709C2B8849C330439FE7E7F184EE353
)

reg query HKCR\Installer\Products\4333AC6527B81D84187EE35F42E3545D
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Products\4333AC6527B81D84187EE35F42E3545D
)

reg query HKCR\Installer\Products\4CFD07043BFD51F47BF8941BA43675FB
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Products\4CFD07043BFD51F47BF8941BA43675FB
)

reg query HKCR\Installer\Products\4D888543F9911D848AC996B4842F5F3A
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Products\4D888543F9911D848AC996B4842F5F3A
)

reg query HKCR\Installer\Products\50178FD3AC9260F4A9CC7154FA4E5955
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Products\50178FD3AC9260F4A9CC7154FA4E5955
)

reg query HKCR\Installer\Products\509870FE45AE43E429E9827A45540FD4
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Products\509870FE45AE43E429E9827A45540FD4
)

reg query HKCR\Installer\Products\51556D034DCCFAC4CA16385693BCA236
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Products\51556D034DCCFAC4CA16385693BCA236
)

reg query HKCR\Installer\Products\5C64BF28D4948A14184C2ECC901496EB
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Products\5C64BF28D4948A14184C2ECC901496EB
)

reg query HKCR\Installer\Products\628C49E84F80FA542B521E02EB22C7B0
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Products\628C49E84F80FA542B521E02EB22C7B0
)

reg query HKCR\Installer\Products\67DD586D3A7716649B0FD7EAD2562106
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Products\67DD586D3A7716649B0FD7EAD2562106
)

reg query HKCR\Installer\Products\7642BA6CB8C732541AC84C6640D9ABC4
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Products\7642BA6CB8C732541AC84C6640D9ABC4
)

reg query HKCR\Installer\Products\77C6E9D1AC701B34A952FBF40AAE7885
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Products\77C6E9D1AC701B34A952FBF40AAE7885
)

reg query HKCR\Installer\Products\81F090823E056EA42B852DD7CE42409D
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Products\81F090823E056EA42B852DD7CE42409D
)

reg query HKCR\Installer\Products\8A2C546200749F642B7F0A8E62BDFC19
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Products\8A2C546200749F642B7F0A8E62BDFC19
)

reg query HKCR\Installer\Products\8C9E5947D46513B4796D48A03FD702C5
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Products\8C9E5947D46513B4796D48A03FD702C5
)

reg query HKCR\Installer\Products\8EAC1AABB7E80004CA6583CAB87B05A6
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Products\8EAC1AABB7E80004CA6583CAB87B05A6
)

reg query HKCR\Installer\Products\96AEC1CCFA7BEE74BA46867B1A2E3FFC
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Products\96AEC1CCFA7BEE74BA46867B1A2E3FFC
)

reg query HKCR\Installer\Products\9D9AEDB188972CB4D83EA24E6B6E9596
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Products\9D9AEDB188972CB4D83EA24E6B6E9596
)

reg query HKCR\Installer\Products\9F7BC01D4B35DBA439F6AA39DCD1C956
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Products\9F7BC01D4B35DBA439F6AA39DCD1C956
)

reg query HKCR\Installer\Products\ACDD851795412004BB6726B2EF31B898
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Products\ACDD851795412004BB6726B2EF31B898
)

reg query HKCR\Installer\Products\B18A18D3F774D0D4B8C395E930C22F38
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Products\B18A18D3F774D0D4B8C395E930C22F38
)

reg query HKCR\Installer\Products\C21346408A6123D4299DD1D723899DC1
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Products\C21346408A6123D4299DD1D723899DC1
)

reg query HKCR\Installer\Products\C36B0C102E9DE6945B00EF4B0E6F1A4E
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Products\C36B0C102E9DE6945B00EF4B0E6F1A4E
)

reg query HKCR\Installer\Products\C928BABD4AA3D694D99624F210BD8691
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Products\C928BABD4AA3D694D99624F210BD8691
)

reg query HKCR\Installer\Products\DD79A770E36EF4A43BC91E11A19A1E15
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Products\DD79A770E36EF4A43BC91E11A19A1E15
)

reg query HKCR\Installer\Products\E84629C097CDE1A46AA3AF47298EDC7A
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Products\E84629C097CDE1A46AA3AF47298EDC7A
)

reg query HKCR\Installer\Products\F66934B227C343D4BAA5D2535F23C0C4
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Products\F66934B227C343D4BAA5D2535F23C0C4
)

reg query HKCR\Installer\Products\FD45F0F3C6383D341AFABAA494502B42
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Products\FD45F0F3C6383D341AFABAA494502B42
)

reg query HKCR\Installer\Products\FDDF549310F35C54893F84C31AD37AEB
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Products\FDDF549310F35C54893F84C31AD37AEB
)

reg query HKCR\Installer\Products\FF5AB07066BC67340B88E0204313D0FC
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Products\FF5AB07066BC67340B88E0204313D0FC
)

reg query HKCR\Installer\Features\06225A5CB6214C44AB6B2AD337BCF826
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Features\06225A5CB6214C44AB6B2AD337BCF826
)

reg query HKCR\Installer\Features\0C90801EF56E39443AB1F368BDE6E9A2
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Features\0C90801EF56E39443AB1F368BDE6E9A2
)

reg query HKCR\Installer\Features\116445D9734F351419E319EC305638CC
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Features\116445D9734F351419E319EC305638CC
)

reg query HKCR\Installer\Features\18918EC9E846D9C4CAF2B621091709F3
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Features\18918EC9E846D9C4CAF2B621091709F3
)

reg query HKCR\Installer\Features\2B680A936D70B034EAE58BCAC18C347A
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Features\2B680A936D70B034EAE58BCAC18C347A
)

reg query HKCR\Installer\Features\33E8240AA8CFFA54FBCA2D2E4A4B0E4A
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Features\33E8240AA8CFFA54FBCA2D2E4A4B0E4A
)

reg query HKCR\Installer\Features\3709C2B8849C330439FE7E7F184EE353
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Features\3709C2B8849C330439FE7E7F184EE353
)

reg query HKCR\Installer\Features\4333AC6527B81D84187EE35F42E3545D
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Features\4333AC6527B81D84187EE35F42E3545D
)

reg query HKCR\Installer\Features\4CFD07043BFD51F47BF8941BA43675FB
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Features\4CFD07043BFD51F47BF8941BA43675FB
)

reg query HKCR\Installer\Features\4D888543F9911D848AC996B4842F5F3A
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Features\4D888543F9911D848AC996B4842F5F3A
)

reg query HKCR\Installer\Features\50178FD3AC9260F4A9CC7154FA4E5955
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Features\50178FD3AC9260F4A9CC7154FA4E5955
)

reg query HKCR\Installer\Features\509870FE45AE43E429E9827A45540FD4
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Features\509870FE45AE43E429E9827A45540FD4
)

reg query HKCR\Installer\Features\51556D034DCCFAC4CA16385693BCA236
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Features\51556D034DCCFAC4CA16385693BCA236
)

reg query HKCR\Installer\Features\5C64BF28D4948A14184C2ECC901496EB
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Features\5C64BF28D4948A14184C2ECC901496EB
)

reg query HKCR\Installer\Features\628C49E84F80FA542B521E02EB22C7B0
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Features\628C49E84F80FA542B521E02EB22C7B0
)

reg query HKCR\Installer\Features\67DD586D3A7716649B0FD7EAD2562106
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Features\67DD586D3A7716649B0FD7EAD2562106
)

reg query HKCR\Installer\Features\7642BA6CB8C732541AC84C6640D9ABC4
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Features\7642BA6CB8C732541AC84C6640D9ABC4
)

reg query HKCR\Installer\Features\77C6E9D1AC701B34A952FBF40AAE7885
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Features\77C6E9D1AC701B34A952FBF40AAE7885
)

reg query HKCR\Installer\Features\81F090823E056EA42B852DD7CE42409D
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Features\81F090823E056EA42B852DD7CE42409D
)

reg query HKCR\Installer\Features\8A2C546200749F642B7F0A8E62BDFC19
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Features\8A2C546200749F642B7F0A8E62BDFC19
)

reg query HKCR\Installer\Features\8C9E5947D46513B4796D48A03FD702C5
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Features\8C9E5947D46513B4796D48A03FD702C5
)

reg query HKCR\Installer\Features\8EAC1AABB7E80004CA6583CAB87B05A6
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Features\8EAC1AABB7E80004CA6583CAB87B05A6
)

reg query HKCR\Installer\Features\96AEC1CCFA7BEE74BA46867B1A2E3FFC
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Features\96AEC1CCFA7BEE74BA46867B1A2E3FFC
)

reg query HKCR\Installer\Features\9D9AEDB188972CB4D83EA24E6B6E9596
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Features\9D9AEDB188972CB4D83EA24E6B6E9596
)

reg query HKCR\Installer\Features\9F7BC01D4B35DBA439F6AA39DCD1C956
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Features\9F7BC01D4B35DBA439F6AA39DCD1C956
)

reg query HKCR\Installer\Features\ACDD851795412004BB6726B2EF31B898
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Features\ACDD851795412004BB6726B2EF31B898
)

reg query HKCR\Installer\Features\B18A18D3F774D0D4B8C395E930C22F38
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Features\B18A18D3F774D0D4B8C395E930C22F38
)

reg query HKCR\Installer\Features\C21346408A6123D4299DD1D723899DC1
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Features\C21346408A6123D4299DD1D723899DC1
)

reg query HKCR\Installer\Features\C36B0C102E9DE6945B00EF4B0E6F1A4E
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Features\C36B0C102E9DE6945B00EF4B0E6F1A4E
)

reg query HKCR\Installer\Features\C928BABD4AA3D694D99624F210BD8691
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Features\C928BABD4AA3D694D99624F210BD8691
)

reg query HKCR\Installer\Features\DD79A770E36EF4A43BC91E11A19A1E15
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Features\DD79A770E36EF4A43BC91E11A19A1E15
)

reg query HKCR\Installer\Features\E84629C097CDE1A46AA3AF47298EDC7A
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Features\E84629C097CDE1A46AA3AF47298EDC7A
)

reg query HKCR\Installer\Features\F66934B227C343D4BAA5D2535F23C0C4
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Features\F66934B227C343D4BAA5D2535F23C0C4
)

reg query HKCR\Installer\Features\FD45F0F3C6383D341AFABAA494502B42
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Features\FD45F0F3C6383D341AFABAA494502B42
)

reg query HKCR\Installer\Features\FDDF549310F35C54893F84C31AD37AEB
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Features\FDDF549310F35C54893F84C31AD37AEB
)

reg query HKCR\Installer\Features\FF5AB07066BC67340B88E0204313D0FC
if not ErrorLevel 1 (
  reg delete HKCR\Installer\Features\FF5AB07066BC67340B88E0204313D0FC
)

rem This fucker was hanging in the registry preventing BitDefender from installing.  Delete this piece of shit before this computer gets chucked out the window.
reg query HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{56CA3334-8B72-48D1-81E7-3EF5243E45D5}
if not ErrorLevel 1 (
  reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{56CA3334-8B72-48D1-81E7-3EF5243E45D5}
)
 
echo Done.
echo.
echo Step 4: Unregistering SBAMScanShell.dll
 
 
CD "C:\Program Files (x86)\GFI Software\VIPRE Business Agent\"
RegSvr32 /u SBAMScanShellExt.dll /s
 
 
echo Done.
echo.
echo Step 5: Removing folders and files if they exist
 
 
if exist "C:\Program Files\VIPRE Business Agent\" rmdir /s /q "C:\Program Files\VIPRE Business Agent\"
if exist "C:\Program Files\GFI Software\Deployment\" rmdir /s /q "C:\Program Files\GFI Software\Deployment\"
if exist "C:\Program Files\GFI Software\GFIAgent\" rmdir /s /q "C:\Program Files\GFI Software\GFIAgent\"
if exist "C:\Program Files\GFI Software\LanGuard 10\" rmdir /s /q "C:\Program Files\GFI Software\LanGuard 10\"
if exist "C:\Program Files\Sunbelt Software\Deployment\" rmdir /s /q "C:\Program Files\Sunbelt Software\Deployment\"
if exist "C:\Program Files\Sunbelt Software\SBEAgent\" rmdir /s /q "C:\Program Files\Sunbelt Software\SBEAgent\"
if exist "C:\Program Files (x86)\VIPRE Business Agent\" rmdir /s /q "C:\Program Files (x86)\VIPRE Business Agent\"
if exist "C:\Program Files (x86)\GFI Software\Deployment\" rmdir /s /q "C:\Program Files (x86)\GFI Software\Deployment\"
if exist "C:\Program Files (x86)\GFI Software\GFIAgent\" rmdir /s /q "C:\Program Files (x86)\GFI Software\GFIAgent\"
if exist "C:\Program Files (x86)\GFI Software\LanGuard 10\" rmdir /s /q "C:\Program Files (x86)\GFI Software\LanGuard 10\"
if exist "C:\Program Files (x86)\Sunbelt Software\Deployment\" rmdir /s /q "C:\Program Files (x86)\Sunbelt Software\Deployment\"
if exist "C:\Program Files (x86)\Sunbelt Software\SBEAgent\" rmdir /s /q "C:\Program Files (x86)\Sunbelt Software\SBEAgent\"
if exist "C:\ProgramData\VIPRE Business Agent\" rmdir /s /q "C:\ProgramData\VIPRE Business Agent\"
if exist "C:\ProgramData\GFI Software\Antimalware\" rmdir /s /q "C:\ProgramData\GFI Software\Antimalware\"
if exist "C:\ProgramData\GFI Software\LanGuard 10\" rmdir /s /q "C:\ProgramData\GFI Software\LanGuard 10\"
if exist "C:\ProgramData\Sunbelt Software\Antimalware\" rmdir /s /q "C:\ProgramData\Sunbelt Software\Antimalware\"
if exist "C:\Documents and Settings\All Users\Application Data\VIPRE Business Agent\" rmdir /s /q "C:\Documents and Settings\All Users\Application Data\VIPRE Business Agent\"
if exist "C:\Documents and Settings\All Users\Application Data\GFI Software\Antimalware\" rmdir /s /q "C:\Documents and Settings\All Users\Application Data\GFI Software\Antimalware\"
if exist "C:\Documents and Settings\All Users\Application Data\GFI Software\LanGuard 10\" rmdir /s /q "C:\Documents and Settings\All Users\Application Data\GFI Software\LanGuard 10\"
if exist "C:\Documents and Settings\All Users\Application Data\Sunbelt Software\Antimalware\" rmdir /s /q "C:\Documents and Settings\All Users\Application Data\Sunbelt Software\Antimalware\"
if exist "%SYSTEMROOT%\system32\drivers\sbaphd.sys" del "%SYSTEMROOT%\system32\drivers\sbaphd.sys"
if exist "%SYSTEMROOT%\system32\drivers\sbapifs.sys" del "%SYSTEMROOT%\system32\drivers\sbapifs.sys"
if exist "%SYSTEMROOT%\system32\drivers\SbFw.sys" del "%SYSTEMROOT%\system32\drivers\SbFw.sys"
if exist "%SYSTEMROOT%\system32\drivers\SbFwIm.sys" del "%SYSTEMROOT%\system32\drivers\SbFwIm.sys"
if exist "%SYSTEMROOT%\system32\drivers\sbhips.sys" del "%SYSTEMROOT%\system32\drivers\sbhips.sys"
if exist "%SYSTEMROOT%\system32\drivers\SBREDrv.sys" del "%SYSTEMROOT%\system32\drivers\SBREDrv.sys"
if exist "%SYSTEMROOT%\system32\drivers\sbtis.sys" del "%SYSTEMROOT%\system32\drivers\sbtis.sys"
if exist "%SYSTEMROOT%\system32\drivers\sbwtis.sys" del "%SYSTEMROOT%\system32\drivers\sbwtis.sys"
if exist "%SYSTEMROOT%\system32\drivers\gfiark.sys" del "%SYSTEMROOT%\system32\drivers\gfiark.sys"
if exist "%SYSTEMROOT%\system32\drivers\gfiutil.sys" del "%SYSTEMROOT%\system32\drivers\gfiutil.sys"
 
echo Done.
echo.
echo This script is now complete.  The final task is to reboot.
echo Please ensure you've saved everything and the system is
echo prepared to reboot *IMMEDIATELY*.
echo.
set /p SHOULDIREBOOT="Would you like to reboot the computer now? [y/N]"
IF /I "%SHOULDIREBOOT%" NEQ "Y" GOTO END
 
shutdown -t 0 -r
 
:END
endlocal