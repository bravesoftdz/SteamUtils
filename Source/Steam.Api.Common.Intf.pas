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
unit Steam.Api.Common.Intf;

interface

{$I ADAPT.inc}

uses
  {$IFDEF ADAPT_USE_EXPLICIT_UNIT_NAMES}
    System.Classes,
  {$ELSE}
    Classes,
  {$ENDIF ADAPT_USE_EXPLICIT_UNIT_NAMES}
  ADAPT.Common.Intf, ADAPT.Common,
  ADAPT.Generics.Lists.Intf,
  ADAPT.Generics.Maps.Intf,
  Steam.Common.Intf;

type
  // Forward Declarations
  ISteamApi = interface;
  ISteamWebApiInterfaceMethod = interface;
  ISteamWebApiInterface = interface;
  ISteamWebApiUtil = interface;
  ISteamApps = interface;

  // Generic Collections
  ISteamWebApiInterfaceMethodList = IADList<ISteamWebApiInterfaceMethod>;
  ISteamWebApiInterfaceList = IADList<ISteamWebApiInterface>;

  ISteamApi = interface(IADInterface)
  ['{2915FC43-626C-4F5D-8280-88329701CF0B}']

  end;

  ISteamWebApiInterfaceMethod = interface(IADInterface)
  ['{A379A5CA-C512-4753-B52A-BA6972249380}']

  end;

  ISteamWebApiInterface = interface(IADInterface)
  ['{FEE3007C-5EC1-4C60-B309-D1A2EF120703}']
    // Getters
    function GetName: String;

    // Properties
    property Name: String read GetName;
  end;

  ISteamWebApiUtil = interface(ISteamApi)
  ['{17F1051C-47B6-43F0-8624-14BA28EDAB47}']
    // Api Getters
    function GetSupportedApiList: ISteamWebApiInterfaceList;

    // Properties
    property SupportedApiList: ISteamWebApiInterfaceList read GetSupportedApiList;
  end;

  ISteamApps = interface(ISteamApi)
  ['{C028FD5E-BDA5-4677-877E-581EE3280582}']
    // Api Getters
    function GetAppList: ISteamAppList;

    // Properties
    property AppList: ISteamAppList read GetAppList;
  end;

implementation

end.
