unit WebPT_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 12/09/2015 19:15:55 from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\Copy\Copy\FPT Dev\Files\WebPT\WebPT.tlb (1)
// LIBID: {1A3B076B-B669-4650-8F39-CE19961B8A99}
// LCID: 0
// Helpfile: 
// HelpString: WebPT Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  WebPTMajorVersion = 1;
  WebPTMinorVersion = 0;

  LIBID_WebPT: TGUID = '{1A3B076B-B669-4650-8F39-CE19961B8A99}';

  IID_IClan: TGUID = '{E1D4CC7D-D0ED-4A90-98E0-F1124DFFB837}';
  CLASS_Clan: TGUID = '{B57F4164-B1AD-4198-94E0-CE4349ADD947}';
  IID_IGMPanel: TGUID = '{7C70D85B-9282-46F5-8988-7CD4A6466F67}';
  CLASS_GMPanel: TGUID = '{5FA81790-458B-40CC-849D-A33B91BCDCD7}';
  IID_IUserPanel: TGUID = '{DBDA5A58-6AA3-4FCD-A897-4273410AEDE9}';
  CLASS_UserPanel: TGUID = '{8DF9B920-25D8-4CC8-AAA9-FE81BBA3B872}';
  IID_IRanking: TGUID = '{3569D6CE-BC4F-47D2-93B6-6CB0DF3102BE}';
  CLASS_Ranking: TGUID = '{101792DD-6F00-4CC1-8624-25FFBB8DD08A}';
  IID_IWebSite: TGUID = '{C3774FBC-EEC5-42D0-861A-3B5FA41FDBF2}';
  CLASS_WebSite: TGUID = '{0CF53E07-FF49-4426-B6EF-A29582EC1268}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IClan = interface;
  IClanDisp = dispinterface;
  IGMPanel = interface;
  IGMPanelDisp = dispinterface;
  IUserPanel = interface;
  IUserPanelDisp = dispinterface;
  IRanking = interface;
  IRankingDisp = dispinterface;
  IWebSite = interface;
  IWebSiteDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  Clan = IClan;
  GMPanel = IGMPanel;
  UserPanel = IUserPanel;
  Ranking = IRanking;
  WebSite = IWebSite;


// *********************************************************************//
// Interface: IClan
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E1D4CC7D-D0ED-4A90-98E0-F1124DFFB837}
// *********************************************************************//
  IClan = interface(IDispatch)
    ['{E1D4CC7D-D0ED-4A90-98E0-F1124DFFB837}']
    procedure OnStartPage(const AScriptingContext: IUnknown); safecall;
    procedure OnEndPage; safecall;
    procedure ClanInsert; safecall;
    procedure ClanMember; safecall;
    procedure GetClanMembers; safecall;
    procedure CheckClanLeader; safecall;
    procedure CheckClanName; safecall;
    procedure CheckClanMember; safecall;
    procedure ClanDelete; safecall;
    procedure InvitePlayer; safecall;
    procedure CheckInvitedPlayer; safecall;
    procedure SetClanSubLeader; safecall;
    procedure ReleaseClanSubLeader; safecall;
    procedure SetClanLeader; safecall;
    procedure GetClanData; safecall;
    procedure SetReleasePlayerSelf; safecall;
    procedure SetReleasePlayer; safecall;
    procedure SodScore; safecall;
  end;

// *********************************************************************//
// DispIntf:  IClanDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E1D4CC7D-D0ED-4A90-98E0-F1124DFFB837}
// *********************************************************************//
  IClanDisp = dispinterface
    ['{E1D4CC7D-D0ED-4A90-98E0-F1124DFFB837}']
    procedure OnStartPage(const AScriptingContext: IUnknown); dispid 201;
    procedure OnEndPage; dispid 202;
    procedure ClanInsert; dispid 203;
    procedure ClanMember; dispid 204;
    procedure GetClanMembers; dispid 205;
    procedure CheckClanLeader; dispid 206;
    procedure CheckClanName; dispid 207;
    procedure CheckClanMember; dispid 208;
    procedure ClanDelete; dispid 209;
    procedure InvitePlayer; dispid 210;
    procedure CheckInvitedPlayer; dispid 211;
    procedure SetClanSubLeader; dispid 212;
    procedure ReleaseClanSubLeader; dispid 213;
    procedure SetClanLeader; dispid 214;
    procedure GetClanData; dispid 215;
    procedure SetReleasePlayerSelf; dispid 216;
    procedure SetReleasePlayer; dispid 217;
    procedure SodScore; dispid 218;
  end;

// *********************************************************************//
// Interface: IGMPanel
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {7C70D85B-9282-46F5-8988-7CD4A6466F67}
// *********************************************************************//
  IGMPanel = interface(IDispatch)
    ['{7C70D85B-9282-46F5-8988-7CD4A6466F67}']
    procedure OnStartPage(const AScriptingContext: IUnknown); safecall;
    procedure OnEndPage; safecall;
    procedure Index; safecall;
    procedure OnDashboardPage; safecall;
    procedure OnDashboardPageHandle; safecall;
    procedure OnSearchUserPage; safecall;
    procedure OnSearchUserPageHandle; safecall;
    procedure OnEditUserPage; safecall;
    procedure OnEditUserPageHandle; safecall;
    procedure OnListTicketPage; safecall;
    procedure OnReplyTicketPage; safecall;
    procedure OnReplyTicketPageHandle; safecall;
    procedure OnAddNoticePage; safecall;
    procedure OnAddNoticePageHandle; safecall;
    procedure OnListAllNoticesPage; safecall;
    procedure OnListAllNoticesPageHandle; safecall;
    procedure OnViewUsersOnline; safecall;
    procedure OnSetMaintenancePage; safecall;
    procedure OnSetMaintenancePageHandle; safecall;
    procedure OnCharacterPage; safecall;
    procedure OnSeeLogsCharacter; safecall;
  end;

// *********************************************************************//
// DispIntf:  IGMPanelDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {7C70D85B-9282-46F5-8988-7CD4A6466F67}
// *********************************************************************//
  IGMPanelDisp = dispinterface
    ['{7C70D85B-9282-46F5-8988-7CD4A6466F67}']
    procedure OnStartPage(const AScriptingContext: IUnknown); dispid 201;
    procedure OnEndPage; dispid 202;
    procedure Index; dispid 203;
    procedure OnDashboardPage; dispid 204;
    procedure OnDashboardPageHandle; dispid 205;
    procedure OnSearchUserPage; dispid 206;
    procedure OnSearchUserPageHandle; dispid 207;
    procedure OnEditUserPage; dispid 208;
    procedure OnEditUserPageHandle; dispid 209;
    procedure OnListTicketPage; dispid 210;
    procedure OnReplyTicketPage; dispid 211;
    procedure OnReplyTicketPageHandle; dispid 212;
    procedure OnAddNoticePage; dispid 213;
    procedure OnAddNoticePageHandle; dispid 214;
    procedure OnListAllNoticesPage; dispid 215;
    procedure OnListAllNoticesPageHandle; dispid 216;
    procedure OnViewUsersOnline; dispid 217;
    procedure OnSetMaintenancePage; dispid 218;
    procedure OnSetMaintenancePageHandle; dispid 219;
    procedure OnCharacterPage; dispid 220;
    procedure OnSeeLogsCharacter; dispid 221;
  end;

// *********************************************************************//
// Interface: IUserPanel
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {DBDA5A58-6AA3-4FCD-A897-4273410AEDE9}
// *********************************************************************//
  IUserPanel = interface(IDispatch)
    ['{DBDA5A58-6AA3-4FCD-A897-4273410AEDE9}']
    procedure OnStartPage(const AScriptingContext: IUnknown); safecall;
    procedure OnEndPage; safecall;
    procedure Index; safecall;
    procedure UpdateVersion; safecall;
    procedure TimeServer; safecall;
    procedure OnMainPage; safecall;
    procedure Menu; safecall;
    procedure SetNotifications; safecall;
    procedure OnListNoficationsPage; safecall;
    procedure OnNewTicketPage; safecall;
    procedure OnNewTicketPageHandle; safecall;
    procedure OnListTicketPage; safecall;
    procedure OnReplyTicketPage; safecall;
    procedure OnReplyTicketPageHandle; safecall;
    procedure OnVotePointsPage; safecall;
    procedure OnSettingsPage; safecall;
    procedure OnSettingsPageHandle; safecall;
    procedure OnClanManagementPageHandle; safecall;
  end;

// *********************************************************************//
// DispIntf:  IUserPanelDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {DBDA5A58-6AA3-4FCD-A897-4273410AEDE9}
// *********************************************************************//
  IUserPanelDisp = dispinterface
    ['{DBDA5A58-6AA3-4FCD-A897-4273410AEDE9}']
    procedure OnStartPage(const AScriptingContext: IUnknown); dispid 201;
    procedure OnEndPage; dispid 202;
    procedure Index; dispid 203;
    procedure UpdateVersion; dispid 204;
    procedure TimeServer; dispid 205;
    procedure OnMainPage; dispid 206;
    procedure Menu; dispid 207;
    procedure SetNotifications; dispid 208;
    procedure OnListNoficationsPage; dispid 209;
    procedure OnNewTicketPage; dispid 210;
    procedure OnNewTicketPageHandle; dispid 211;
    procedure OnListTicketPage; dispid 212;
    procedure OnReplyTicketPage; dispid 213;
    procedure OnReplyTicketPageHandle; dispid 214;
    procedure OnVotePointsPage; dispid 215;
    procedure OnSettingsPage; dispid 216;
    procedure OnSettingsPageHandle; dispid 217;
    procedure OnClanManagementPageHandle; dispid 218;
  end;

// *********************************************************************//
// Interface: IRanking
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {3569D6CE-BC4F-47D2-93B6-6CB0DF3102BE}
// *********************************************************************//
  IRanking = interface(IDispatch)
    ['{3569D6CE-BC4F-47D2-93B6-6CB0DF3102BE}']
    procedure OnStartPage(const AScriptingContext: IUnknown); safecall;
    procedure OnEndPage; safecall;
    procedure Index; safecall;
    procedure Top10; safecall;
    procedure RankingPVP; safecall;
  end;

// *********************************************************************//
// DispIntf:  IRankingDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {3569D6CE-BC4F-47D2-93B6-6CB0DF3102BE}
// *********************************************************************//
  IRankingDisp = dispinterface
    ['{3569D6CE-BC4F-47D2-93B6-6CB0DF3102BE}']
    procedure OnStartPage(const AScriptingContext: IUnknown); dispid 201;
    procedure OnEndPage; dispid 202;
    procedure Index; dispid 203;
    procedure Top10; dispid 204;
    procedure RankingPVP; dispid 205;
  end;

// *********************************************************************//
// Interface: IWebSite
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C3774FBC-EEC5-42D0-861A-3B5FA41FDBF2}
// *********************************************************************//
  IWebSite = interface(IDispatch)
    ['{C3774FBC-EEC5-42D0-861A-3B5FA41FDBF2}']
    procedure OnStartPage(const AScriptingContext: IUnknown); safecall;
    procedure OnEndPage; safecall;
    procedure OnListNewsPage; safecall;
    procedure Index; safecall;
    procedure StartPage; safecall;
    procedure EndPage; safecall;
    procedure OnViewNewsPage; safecall;
    procedure OnNextMaintenancePage; safecall;
    procedure OnListAllNewsPage; safecall;
    procedure OnServerTime; safecall;
    procedure OnLeaderSodPage; safecall;
    procedure OnRankingsPage; safecall;
    procedure OnLeaderBCPage; safecall;
  end;

// *********************************************************************//
// DispIntf:  IWebSiteDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C3774FBC-EEC5-42D0-861A-3B5FA41FDBF2}
// *********************************************************************//
  IWebSiteDisp = dispinterface
    ['{C3774FBC-EEC5-42D0-861A-3B5FA41FDBF2}']
    procedure OnStartPage(const AScriptingContext: IUnknown); dispid 201;
    procedure OnEndPage; dispid 202;
    procedure OnListNewsPage; dispid 203;
    procedure Index; dispid 204;
    procedure StartPage; dispid 205;
    procedure EndPage; dispid 206;
    procedure OnViewNewsPage; dispid 207;
    procedure OnNextMaintenancePage; dispid 208;
    procedure OnListAllNewsPage; dispid 209;
    procedure OnServerTime; dispid 210;
    procedure OnLeaderSodPage; dispid 211;
    procedure OnRankingsPage; dispid 212;
    procedure OnLeaderBCPage; dispid 213;
  end;

// *********************************************************************//
// The Class CoClan provides a Create and CreateRemote method to          
// create instances of the default interface IClan exposed by              
// the CoClass Clan. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoClan = class
    class function Create: IClan;
    class function CreateRemote(const MachineName: string): IClan;
  end;

// *********************************************************************//
// The Class CoGMPanel provides a Create and CreateRemote method to          
// create instances of the default interface IGMPanel exposed by              
// the CoClass GMPanel. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoGMPanel = class
    class function Create: IGMPanel;
    class function CreateRemote(const MachineName: string): IGMPanel;
  end;

// *********************************************************************//
// The Class CoUserPanel provides a Create and CreateRemote method to          
// create instances of the default interface IUserPanel exposed by              
// the CoClass UserPanel. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoUserPanel = class
    class function Create: IUserPanel;
    class function CreateRemote(const MachineName: string): IUserPanel;
  end;

// *********************************************************************//
// The Class CoRanking provides a Create and CreateRemote method to          
// create instances of the default interface IRanking exposed by              
// the CoClass Ranking. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoRanking = class
    class function Create: IRanking;
    class function CreateRemote(const MachineName: string): IRanking;
  end;

// *********************************************************************//
// The Class CoWebSite provides a Create and CreateRemote method to          
// create instances of the default interface IWebSite exposed by              
// the CoClass WebSite. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoWebSite = class
    class function Create: IWebSite;
    class function CreateRemote(const MachineName: string): IWebSite;
  end;

implementation

uses ComObj;

class function CoClan.Create: IClan;
begin
  Result := CreateComObject(CLASS_Clan) as IClan;
end;

class function CoClan.CreateRemote(const MachineName: string): IClan;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Clan) as IClan;
end;

class function CoGMPanel.Create: IGMPanel;
begin
  Result := CreateComObject(CLASS_GMPanel) as IGMPanel;
end;

class function CoGMPanel.CreateRemote(const MachineName: string): IGMPanel;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_GMPanel) as IGMPanel;
end;

class function CoUserPanel.Create: IUserPanel;
begin
  Result := CreateComObject(CLASS_UserPanel) as IUserPanel;
end;

class function CoUserPanel.CreateRemote(const MachineName: string): IUserPanel;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_UserPanel) as IUserPanel;
end;

class function CoRanking.Create: IRanking;
begin
  Result := CreateComObject(CLASS_Ranking) as IRanking;
end;

class function CoRanking.CreateRemote(const MachineName: string): IRanking;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Ranking) as IRanking;
end;

class function CoWebSite.Create: IWebSite;
begin
  Result := CreateComObject(CLASS_WebSite) as IWebSite;
end;

class function CoWebSite.CreateRemote(const MachineName: string): IWebSite;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_WebSite) as IWebSite;
end;

end.
