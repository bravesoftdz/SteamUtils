{
  Steam Utilities
  Copyright (C) 2016, Simon J Stuart, All Rights Reserved
  Original Source Location: https://github.com/LaKraven/SteamUtils

  License:
    - You may use this library as you see fit, including use within commercial applications.
    - You may modify this library to suit your needs, without the requirement of distributing
      modified versions.
    - You may redistribute this library (in part or whole) individually, or as part of any
      other works.
    - You must NOT charge a fee for the distribution of this library (compiled or in its
      source form). It MUST be distributed freely.
    - This license and the surrounding comment block MUST remain in place on all copies and
      modified versions of this source code.
    - Modified versions of this source MUST be clearly marked, including the name of the
      person(s) and/or organization(s) responsible for the changes, and a SEPARATE "changelog"
      detailing all additions/deletions/modifications made.
  Disclaimer:
    - Your use of this source constitutes your understanding and acceptance of this
      disclaimer.
    - Simon J Stuart, nor any other contributor, may be held liable for your use of this source
      code. This includes any losses and/or damages resulting from your use of this source
      code, be they physical, financial, or psychological.
    - There is no warranty or guarantee (implicit or otherwise) provided with this source
      code. It is provided on an "AS-IS" basis.
  Donations:
    - While not mandatory, contributions are always appreciated. They help keep the coffee
      flowing during the long hours invested in this and all other Open Source projects we
      produce.
    - Donations can be made via PayPal to PayPal [at] LaKraven (dot) Com
                                          ^  Garbled to prevent spam!  ^
}
unit Steam.App.Manifests.Intf;

interface

{$I ADAPT.inc}

{
  NOTES:

  StateFlags = 1026 while Downloading...
  StateFlags = 4 when Downloaded/No Updates...

  Only allow Transfers if (BytesToDownload = 0) AND ((BytesDownloaded > 0) AND (SizeOnDisk > 0)) AND (BytesDownloaded = SizeOnDisk)

  Delete "MountedDepots" section entirely to solve the "Invalid Depots" bug (useful feature)
}

uses
  {$IFDEF ADAPT_USE_EXPLICIT_UNIT_NAMES}
    System.Classes,
  {$ELSE}
    Classes,
  {$ENDIF ADAPT_USE_EXPLICIT_UNIT_NAMES}
  ADAPT.Common.Intf, ADAPT.Common,
  ADAPT.Generics.Maps.Intf;

type
  // Forward Declarations
  ISteamAppManifest = interface;
  ISteamAppManifestConfig = interface;
  ISteamAppManifestStagedDepot = interface;
  ISteamAppManifestMountedDepot = interface;

  TSteamAutoUpdateBehavior = (aubAlwaysUpdate, aubUpdateOnLaunch, aubAlwaysUpdatePriority);
  TSteamBackgroundDownloadBehavior = (bdbGlobalSetting, bdbAllow, bdbNever);

//  ISteamAppManifestStagedDepotList = IADDictionary<Cardinal, ISteamAppManifestStagedDepot>; // Mapped on "Key"

  ISteamAppManifest = interface(IADInterface)
  ['{C5FA375B-302B-4059-8D55-A61BE93A6B80}']
    // Getters
    function GetAllowOtherDownloadsWhileRunning: TSteamBackgroundDownloadBehavior;
    function GetAppID: Cardinal;
    function GetAutoUpdateBehavior: TSteamAutoUpdateBehavior;
    function GetBuildId: Cardinal;
    function GetBytesDownloaded: Cardinal;
    function GetBytesToDownload: Cardinal;
    function GetConfig: ISteamAppManifestConfig;
    function GetHasBeenUpdated: Boolean;
    function GetInstallDir: String;
    function GetLastOwner: Cardinal; //TODO -oDaniel -cManifest Clarification: Should this be a Reference to a Steam User Object?
    function GetLastUpdated: TDateTime;
    function GetName: String;
    function GetSizeOnDisk: Cardinal;
    function GetStateFlags: Cardinal; //TODO -oDaniel -cManifest Clarification: Use Set of State Flags (once discovered)
    function GetUniverse: Cardinal; //TODO -oDaniel -cManifest Clarification: Should be Enum?
    function GetUpdateResult: Cardinal; //TODO -oDaniel -cManifest Clarification: Should be Enum?

    // Setters
    procedure SetAllowOtherDownloadsWhileRunning(const AValue: TSteamBackgroundDownloadBehavior);

    // Properties
    property AllowOtherDownloadsWhileRunning: TSteamBackgroundDownloadBehavior read GetAllowOtherDownloadsWhileRunning write SetAllowOtherDownloadsWhileRunning;
    property AppID: Cardinal read GetAppID;
    property AutoUpdateBehavior: TSteamAutoUpdateBehavior read GetAutoUpdateBehavior;
    property BuildId: Cardinal read GetBuildId;
    property BytesDownloaded: Cardinal read GetBytesDownloaded;
    property BytesToDownload: Cardinal read GetBytesToDownload;
    property Config: ISteamAppManifestConfig read GetConfig;
    property HasBeenUpdated: Boolean read GetHasBeenUpdated;
    property InstallDir: String read GetInstallDir;
    property LastOwner: Cardinal read GetLastOwner; //TODO -oDaniel -cManifest Clarification: Should this be a Reference to a Steam User Object?
    property LastUpdated: TDateTime read GetLastUpdated;
    property Name: String read GetName;
    property SizeOnDisk: Cardinal read GetSizeOnDisk;
    property StateFlags: Cardinal read GetStateFlags; //TODO -oDaniel -cManifest Clarification: Use Set of State Flags (once discovered)
    property Universe: Cardinal read GetUniverse; //TODO -oDaniel -cManifest Clarification: Should be Enum?
    property UpdateResult: Cardinal read GetUpdateResult;//TODO -oDaniel -cManifest Clarification: Should be Enum?
  end;

  ISteamAppManifestConfig = interface(IADInterface)
  ['{FA25981C-A43E-4276-B066-3F7C4D168FA9}']
    // Getters
    function GetBetaKey: String; //TODO -oDaniel -cManifest Clarification: Is this supposed to be an AppId of some kind?
    function GetLanguage: String; //TODO -oDaniel -cManifest Clarification: Use Enumeration of Supported Languages

    // Properties
    property BetaKey: String read GetBetaKey;
    property Language: String read GetLanguage; //TODO -oDaniel -cManifest Clarification: Use Enumeration of Supported Languages
  end;

  ISteamAppManifestStagedDepot = interface(IADInterface)
  ['{AFBD6B8B-E0D8-48BB-958A-8D5AEA20D182}']
    // Getters
    function GetKey: Cardinal; //TODO -oDaniel -cManifest Clarification: Is this supposed to be an AppId of some kind?
    function GetManifest: Cardinal;
    function GetSize: Cardinal;

    // Properties
    property Key: Cardinal read GetKey; //TODO -oDaniel -cManifest Clarification: Is this supposed to be an AppId of some kind?;
    property Manifest: Cardinal read GetManifest;
    property Size: Cardinal read GetSize;
  end;

  ISteamAppManifestMountedDepot = interface(IADInterface)
  ['{94347C09-03A2-4CED-8B97-FB629A97AF61}']
    // Getters
    function GetKey: Cardinal;
    function GetValue: Cardinal;

    // Properties
    property Key: Cardinal read GetKey;
    property Value: Cardinal read GetValue;
  end;

implementation

end.
