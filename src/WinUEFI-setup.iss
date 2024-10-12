; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define AppName "WinUEFI"
#define AppVersion "GetEnv('VERSION')"
#define AppPublisher "FreakinSoftMania"
#define AppExeName "WinUEFI-amd64.exe"
#define AppAssocName AppName + ""
#define AppAssocExt ".exe"
#define AppAssocKey StringChange(AppAssocName, " ", "") + AppAssocExt

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{2F162912-9BC1-4D7F-802B-8CA8BFF1467E}
AppName={#AppName}
AppVersion={#AppVersion}
;AppVerName={#AppName} {#AppVersion}
AppPublisher={#AppPublisher}
DefaultDirName={autopf}\{#AppName}
OutputDir=D:\a\WinUEFI\WinUEFI\build
ChangesAssociations=yes
DefaultGroupName={#AppName}
AllowNoIcons=yes
; Uncomment the following line to run in non administrative install mode (install for current user only.)
;PrivilegesRequired=lowest
OutputBaseFilename=WinUEFI-setup
Compression=lzma
SolidCompression=yes
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "app64desktopicon"; Description: "WinUEFI (64-bit) icon"; \
    GroupDescription: "{cm:AdditionalIcons}"
Name: "app64condesktopicon"; Description: "WinUEFI (64-bit) Console icon"; \
    GroupDescription: "{cm:AdditionalIcons}"
Name: "app32desktopicon"; Description: "WinUEFI (32-bit) icon"; \
    GroupDescription: "{cm:AdditionalIcons}"
Name: "app32condesktopicon"; Description: "WinUEFI (32-bit) Console icon"; \
    GroupDescription: "{cm:AdditionalIcons}"

[Files]
Source: "D:\a\WinUEFI\WinUEFI\build\{#AppExeName}"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\a\WinUEFI\WinUEFI\build\WinUEFI-amd64-console.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\a\WinUEFI\WinUEFI\build\WinUEFI-i386.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\a\WinUEFI\WinUEFI\build\WinUEFI-i386-console.exe"; DestDir: "{app}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Registry]
Root: HKA; Subkey: "Software\Classes\{#AppAssocExt}\OpenWithProgids"; ValueType: string; ValueName: "{#AppAssocKey}"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\{#AppAssocKey}"; ValueType: string; ValueName: ""; ValueData: "{#AppAssocName}"; Flags: uninsdeletekey
Root: HKA; Subkey: "Software\Classes\{#AppAssocKey}\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\{#AppExeName},0"
Root: HKA; Subkey: "Software\Classes\{#AppAssocKey}\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#AppExeName}"" ""%1"""
Root: HKA; Subkey: "Software\Classes\Applications\{#AppExeName}\SupportedTypes"; ValueType: string; ValueName: ".myp"; ValueData: ""

[Icons]
Name: "{autodesktop}\{#AppName}"; \
    Filename: "{app}\{#AppExeName}"; Tasks: app64desktopicon
Name: "{autodesktop}\WinUEFI (64-bit) Console"; \
    Filename: "{app}\WinUEFI-amd64-console.exe"; Tasks: app64condesktopicon
Name: "{autodesktop}\WinUEFI (32-bit)"; \
    Filename: "{app}\WinUEFI-i386.exe"; Tasks: app32desktopicon
Name: "{autodesktop}\WinUEFI (32-bit) Console"; \
    Filename: "{app}\WinUEFI-i386-console.exe"; Tasks: app32condesktopicon

[Run]
Filename: "{app}\{#AppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(AppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent; Check: NoRunSwitch

[Code]
function NoRunSwitch: boolean;
var
  i: integer;
begin
  // Return TRUE to show the checkbox on the final page, return FALSE to hide it.
  Result := False; // In case there are no parameters
  for i := 1 to ParamCount do
  begin
    // Tweak the switch parsing to suit your needs here
    Result := not (UpperCase(ParamStr(i)) = '/NORUN');
    if not Result then break;
  end;
end;
