unit DarkModeClasses;

{$mode delphi}{$H+}
interface

uses
  Windows, SysUtils;


const
  THEME_LIB = 'uxtheme.dll';

type
  TShouldAppsUseDarkMode = function: BOOL; stdcall;
  TAllowDarkModeForWindow = function(hwnd: HWND; allow: BOOL): BOOL; stdcall;
  TAllowDarkModeForApp = function(allow: BOOL): BOOL; stdcall;
  TFlushMenuThemes = procedure; stdcall;
  TRefreshImmersiveColorPolicyState = procedure; stdcall;

var
  FHandle: THandle;
  FLoaded: Boolean;
  RefreshImmersiveColorPolicyState: TRefreshImmersiveColorPolicyState;
  ShouldAppsUseDarkMode: TShouldAppsUseDarkMode;
  AllowDarkModeForWindow: TAllowDarkModeForWindow;
  AllowDarkModeForApp: TAllowDarkModeForApp;
  FlushMenuThemes: TFlushMenuThemes;
  DarkModeSupported: Boolean;

implementation

function DarkModeLoadLibrary: Boolean;
begin
  if CheckWin32Version(10) {and (TOSVersion.Build >= 17763)} then
    FHandle := LoadLibrary(PChar(THEME_LIB));
  Result := FHandle <> 0;
  if Result then
  begin
    @RefreshImmersiveColorPolicyState := GetProcAddress(FHandle, MakeIntResource(104));
    @ShouldAppsUseDarkMode := GetProcAddress(FHandle, MakeIntResource(132));
    @AllowDarkModeForWindow := GetProcAddress(FHandle, MakeIntResource(133));
    @AllowDarkModeForApp := GetProcAddress(FHandle, MakeIntResource(135));
    @FlushMenuThemes := GetProcAddress(FHandle, MakeIntResource(136));
    if (@RefreshImmersiveColorPolicyState <> nil) and
      (@ShouldAppsUseDarkMode <> nil) and (@AllowDarkModeForWindow <> nil) and
      (@AllowDarkModeForApp <> nil) and (@FlushMenuThemes <> nil) then
      DarkModeSupported := True;
  end;
end;

procedure DarkModeFreeLibrary;
begin
  if FHandle <> 0 then
    FreeLibrary(FHandle);
  FHandle := 0;
end;

initialization

if not FLoaded then
  FLoaded := DarkModeLoadLibrary;

finalization

if FLoaded then
  DarkModeFreeLibrary;

end.
