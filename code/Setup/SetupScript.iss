; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "X-Ray Oxygen"
#define MyAppVersion "1.7f"
#define MyAppPublisher "Oxygen Team"
#define MyAppURL "http://xray-oxygen.org"
#define MyAppExeName "xrPlay.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{7E6D5C6F-33A2-482E-9106-57F24C21166C}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppName}
DisableProgramGroupPage=yes
; Remove the following line to run in administrative install mode (install for all users.)
PrivilegesRequired=lowest
PrivilegesRequiredOverridesAllowed=commandline
OutputBaseFilename=OxygenSetup
Compression=lzma
SolidCompression=yes
WizardStyle=modern
DisableWelcomePage=False
AppCopyright=Oxygen Team 2019
MinVersion=0,6.1
SetupIconFile=oxygen_logo_setup.ico
WizardImageFile=Oxygen_Setup_eng.bmp

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "..\..\binaries\x64\Release\*.dll"; DestDir: "{app}\Oxygen"; Flags: ignoreversion
Source: "..\..\binaries\x64\Release\xrPlay.exe"; DestDir: "{app}\Oxygen"; Flags: ignoreversion
Source: "..\..\binaries\x64\Release\alsoft.ini"; DestDir: "{app}\Oxygen"; Flags: ignoreversion
Source: "..\..\game\fsgame.ltx"; DestDir: "{app}"; Flags: ignoreversion; BeforeInstall: OnFsltxIsAboutToBeCreated
Source: "..\..\game\gamedata\*.*"; DestDir: "{app}\gamedata"; Flags: ignoreversion recursesubdirs
Source: "vc_redist.x64.exe"; DestDir: "{tmp}"; Flags: ignoreversion
Source: "..\..\game\external\oalinst.exe"; DestDir: "{tmp}"; Flags: ignoreversion
Source: "Splash.bmp"; DestDir: "{tmp}"; Flags: ignoreversion dontcopy
Source: "Oxygen_Setup.bmp"; DestDir: "{tmp}"; Flags: ignoreversion dontcopy
Source: "Oxygen_Setup_eng.bmp"; DestDir: "{tmp}"; Flags: ignoreversion dontcopy

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\Oxygen\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\Oxygen\{#MyAppExeName}"; Tasks: desktopicon

[ThirdParty]
UseRelativePaths=True

[Dirs]
Name: "{app}\Oxygen"
Name: "{app}\gamedata"; BeforeInstall: OnGamedataIsAboutToBeCreated

[Run]
Filename: "{tmp}\vc_redist.x64.exe"; WorkingDir: "{app}"; Flags: postinstall; Description: "{cm:STR_OXY_MSVS_REDIST}"
Filename: "{tmp}\oalinst.exe"; WorkingDir: "{app}"; Flags: postinstall; Description: "{cm:STR_OXY_OAL}"

[CustomMessages]
english.MSG_OXY_AWDA=AWDA
russian.MSG_OXY_AWDA=AWDA
english.STR_OXY_CONFIG=Config
russian.STR_OXY_CONFIG=������������
english.STR_OXY_PRESET=Preset
russian.STR_OXY_PRESET=������
english.STR_OXY_VANILLA=Vanilla
russian.STR_OXY_VANILLA=������������
english.STR_OXY_EVERYTHING=Everything
russian.STR_OXY_EVERYTHING=��
english.STR_OXY_MSVS_REDIST=Install Microsoft Visual Studio redistributables (recommended)
russian.STR_OXY_MSVS_REDIST=���������� Microsoft Visual Studio redistributables (�������������)
english.STR_OXY_OAL=Install OpenAL Soft
russian.STR_OXY_OAL=���������� OpenAL Soft
english.STR_OXY_FEATURE_MONSTER_INV=Monster Inventory
russian.STR_OXY_FEATURE_MONSTER_INV=��������� � ��������
english.STR_OXY_FEATURE_ANTIFREEZE=Delayed npc spawn (increase performance)
russian.STR_OXY_FEATURE_ANTIFREEZE=���������� ������� ��� (�������� ������������������)
english.STR_OXY_FEATURE_POLTERHEIST=Polterheist Death Particles
russian.STR_OXY_FEATURE_POLTERHEIST=������ ������ � ������������
english.STR_OXY_FEATURE_THIRST=Thirst
russian.STR_OXY_FEATURE_THIRST=�����

[Code]
// Splash code
var
  PreviousBackupName  : String;
  SplashFileName      : String;
  SplashForm          : TForm;
  SplashImage         : TBitmapImage;
  chkLstFeatures	  : TNewCheckListBox;
  cmbPresets		  : TNewComboBox;

function GetBackground(Param: String): String;
var
	backgroundImagePath : String;
begin
	if ActiveLanguage() = 'english' then
	begin
		backgroundImagePath := ExpandConstant ('{tmp}\Oxygen_Setup_eng.bmp');
		ExtractTemporaryFile ('Oxygen_Setup_eng.bmp');
	end
	else if ActiveLanguage() = 'russian' then
	begin
		backgroundImagePath := ExpandConstant ('{tmp}\Oxygen_Setup.bmp');
		ExtractTemporaryFile ('Oxygen_Setup.bmp');
	end;
	
	Result := backgroundImagePath;
end;

procedure OpenSplash;
begin
  SplashFileName := ExpandConstant ('{tmp}\Splash.bmp');
  ExtractTemporaryFile ('Splash.bmp');
  SplashForm := TForm.create(nil);
  with SplashForm do
    begin
      BorderStyle := bsNone;
       Position := poScreenCenter;
      // Adjust the height and width of the SplashForm to the size of your splash image
      ClientWidth := 300;
      ClientHeight := 103;
    end;
  SplashImage := TBitmapImage.Create(SplashForm);
  with SplashImage do
    begin
      Bitmap.LoadFromFile(SplashFileName);
      Stretch := true;
      Align := alClient;
      Parent := SplashForm;
    end;
end;

procedure ShowSplash;
begin
  with SplashForm do
   begin
     Show;
     Repaint;
   end;
   BringToFrontAndRestore;
end;

procedure CloseSplash;
begin
  with SplashForm do
   begin
     Close;
     Free;
   end;
   BringToFrontAndRestore;
end;


function InitializeSetup : Boolean;
begin
  OpenSplash;
  ShowSplash;
  Result := TRUE;
end;

// check if gamedata folder is presented
// if folder already exist - rename it, so it's not mess up with Oxygen files
procedure OnGamedataIsAboutToBeCreated();
var
	gameDataFilePath : String;
	gameDataFilePathChanged : String;
begin
	gameDataFilePath := ExpandConstant('{app}\gamedata');
	if DirExists(gameDataFilePath) = True then
	begin
		gameDataFilePathChanged := ExpandConstant('{app}\gamedata_OLD');
		RenameFile(gameDataFilePath, gameDataFilePathChanged);
	end;
	
end;

procedure OnFsltxIsAboutToBeCreated();
var
    fsGameFilePath : String;
    fsGameFilePathChanged : String;
begin
  fsGameFilePath := ExpandConstant('{app}\fsgame.ltx');
	if FileExists(fsGameFilePath) = True then
	begin
		fsGameFilePathChanged := ExpandConstant('{app}\fsgame_OLD.ltx');
		RenameFile(fsGameFilePath, fsGameFilePathChanged);
	end;
end;

procedure OnPresetChanged(Sender: TObject);
begin
	if cmbPresets.ItemIndex = 0 then
	begin
		chkLstFeatures.CheckItem(0, coUncheck);
		chkLstFeatures.CheckItem(1, coUncheck);
		chkLstFeatures.CheckItem(2, cbChecked);
		chkLstFeatures.CheckItem(3, coUncheck);
	end
	else if cmbPresets.ItemIndex = 1 then
	begin
		chkLstFeatures.CheckItem(0, cbChecked);
		chkLstFeatures.CheckItem(1, cbChecked);
		chkLstFeatures.CheckItem(2, cbChecked);
		chkLstFeatures.CheckItem(3, cbChecked);
	end;
end;

// Custom pages with xrOxygen feature selection
procedure CreateConfigSelectionWizardPage;
var
  Page: TWizardPage;
  txtPresets: TNewStaticText;

begin
  Page := CreateCustomPage(wpWelcome, 'X-Ray Oxygen Setup', CustomMessage('STR_OXY_CONFIG'));

  txtPresets := TNewStaticText.Create(Page);
  txtPresets.Top := ScaleX(5);
  txtPresets.Left := ScaleY(0);
  txtPresets.Caption := CustomMessage('STR_OXY_PRESET');
  txtPresets.AutoSize := True;
  txtPresets.Anchors := [akLeft, akTop, akRight];
  txtPresets.Parent := Page.Surface;

  cmbPresets := TNewComboBox.Create(Page);
  cmbPresets.Top := ScaleX(0);
  cmbPresets.Left := ScaleY(50);
  cmbPresets.Anchors := [akLeft, akTop, akRight];
  cmbPresets.Parent := Page.Surface;
  cmbPresets.Style := csDropDownList;
  cmbPresets.Items.Add(CustomMessage('STR_OXY_VANILLA'));
  cmbPresets.Items.Add(CustomMessage('STR_OXY_EVERYTHING'));
  cmbPresets.ItemIndex := 0;
  cmbPresets.OnChange := @OnPresetChanged;

	chkLstFeatures := TNewCheckListBox.Create(Page);
	chkLstFeatures.Width := Page.SurfaceWidth;
	chkLstFeatures.Height := ScaleY(100);
  chkLstFeatures.Top := ScaleY(30);
	chkLstFeatures.Anchors := [akLeft, akTop, akRight, akBottom];
	chkLstFeatures.Flat := True;
	chkLstFeatures.Parent := Page.Surface;
	chkLstFeatures.AddCheckBox(CustomMessage('STR_OXY_FEATURE_MONSTER_INV'), '', 0, False, True, False, False, nil);
	chkLstFeatures.AddCheckBox(CustomMessage('STR_OXY_FEATURE_ANTIFREEZE'), '', 0, False, True, False, False, nil);
	chkLstFeatures.AddCheckBox(CustomMessage('STR_OXY_FEATURE_POLTERHEIST'), '', 0, True, True, False, False, nil);
	chkLstFeatures.AddCheckBox(CustomMessage('STR_OXY_FEATURE_THIRST'), '', 0, False, True, False, False, nil);
  
end;

procedure CurStepChanged(CurStep: TSetupStep);
var
	gameExtraFilePath : String;
	gameExtraContent  : String;
begin
	if CurStep = ssPostInstall then
	begin
		// install custom config
		// function SaveStringToFile(const FileName: String; const S: AnsiString; const Append: Boolean): Boolean;
		gameExtraFilePath := ExpandConstant('{app}\gamedata\configs\gameextra.ltx');
		DeleteFile(gameExtraFilePath);
		
		// dump settings
		gameExtraContent := '; Here should be commands, that enables or disable game features'#13#10;
		gameExtraContent := Format('%s%s', [gameExtraContent, '; Do not insert other config commands here'#13#10]);
		gameExtraContent := Format('%s%s', [gameExtraContent, '; This file was autogenerated by installer'#13#10]);
		gameExtraContent := Format('%s%s', [gameExtraContent, #13#10]);
		
		gameExtraContent := Format('%s%s', [gameExtraContent, 'game_extra_ruck off'#13#10]);
		if chkLstFeatures.State[0] = cbChecked then
		begin
			gameExtraContent := Format('%s%s', [gameExtraContent, 'game_extra_monster_inventory on'#13#10]);
		end
		else
		begin
			gameExtraContent := Format('%s%s', [gameExtraContent, 'game_extra_monster_inventory off'#13#10]);
		end;
		
		if chkLstFeatures.State[1] = cbChecked then
		begin
			gameExtraContent := Format('%s%s', [gameExtraContent, 'game_extra_spawn_antifreeze on'#13#10]);
		end
		else
		begin
			gameExtraContent := Format('%s%s', [gameExtraContent, 'game_extra_spawn_antifreeze off'#13#10]);
		end;
		
		gameExtraContent := Format('%s%s', [gameExtraContent, 'game_extra_weapon_autoreload off'#13#10]);
		gameExtraContent := Format('%s%s', [gameExtraContent, 'game_extra_dynamic_sun_movement off'#13#10]);
		gameExtraContent := Format('%s%s', [gameExtraContent, 'game_extra_hold_to_pickup on'#13#10]);
		
		if chkLstFeatures.State[2] = cbChecked then
		begin
			gameExtraContent := Format('%s%s', [gameExtraContent, 'game_extra_polter_show_particles_on_dead on'#13#10]);
		end
		else
		begin
			gameExtraContent := Format('%s%s', [gameExtraContent, 'game_extra_polter_show_particles_on_dead off'#13#10]);
		end;
		
		gameExtraContent := Format('%s%s', [gameExtraContent, 'game_extra_soc_talk_wnd off'#13#10]);
		gameExtraContent := Format('%s%s', [gameExtraContent, 'game_extra_soc_minimap off'#13#10]);
		gameExtraContent := Format('%s%s', [gameExtraContent, 'game_extra_vertical_belts off'#13#10]);
		
		if chkLstFeatures.State[3] = cbChecked then
		begin
			gameExtraContent := Format('%s%s', [gameExtraContent, 'game_extra_thirst on'#13#10]);
		end
		else
		begin
			gameExtraContent := Format('%s%s', [gameExtraContent, 'game_extra_thirst off'#13#10]);
		end;
		
		gameExtraContent := Format('%s%s', [gameExtraContent, 'game_extra_npc_grenade_up on'#13#10]);
		gameExtraContent := Format('%s%s', [gameExtraContent, 'game_extra_lamps_immunity off'#13#10]);
		
		SaveStringToFile(gameExtraFilePath, gameExtraContent, False);
	end;
end;

procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
var
	gameDataFilePath : String;
	gameDataFilePathChanged : String;

  fsGameFilePath : String;
  fsGameFilePathChanged : String;
begin
	if CurUninstallStep = usPostUninstall then
	begin
		// check if there is a folder "gamedataOLD".
		// if so - we should rename it back to "gamedata"
		gameDataFilePath := ExpandConstant('{app}\gamedata');
		gameDataFilePathChanged := ExpandConstant('{app}\gamedata_OLD');
    fsGameFilePath := ExpandConstant('{app}\fsgame.ltx');
    fsGameFilePathChanged := ExpandConstant('{app}\fsgame_OLD.ltx');
		if DirExists(gameDataFilePathChanged) = True then
		begin
			RenameFile(gameDataFilePathChanged, gameDataFilePath);
		end;

    if FileExists(fsGameFilePathChanged) = True then
    begin
      RenameFile(fsGameFilePathChanged, fsGameFilePath);
    end;
	end;
end;

procedure InitializeWizard;
begin
  CreateConfigSelectionWizardPage;
  CloseSplash;
end;
