unit U_GMPanel;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, AspTlb, WebPT_TLB, StdVcl, U_SQL, Variants;

type
  TGMPanel = class(TASPObject, IGMPanel)
  protected
    procedure OnEndPage; safecall;
    procedure OnStartPage(const AScriptingContext: IUnknown); safecall;
    procedure Index; safecall;
    procedure StartPage; safecall;
    procedure EndPage; safecall;
    procedure Menu; safecall;
    procedure OnLogsPage; safecall;
    procedure OnLogsPageHandle; safecall;
    procedure OnUserPage; safecall;
    procedure OnUserPageHandle; safecall;
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

implementation

uses ComServ, SysUtils;

function CleanStringTag(const S: String): String;
begin
  Result := S;
  Result:= StringReplace(Result,chr($27),'[aspaspt]',[rfReplaceAll,rfIgnoreCase]);
  Result:= StringReplace(Result,'/','[barpt]',[rfReplaceAll,rfIgnoreCase]);
  Result:= StringReplace(Result,'.','[dotpt]',[rfReplaceAll,rfIgnoreCase]);
  Result:= StringReplace(Result,'-','[minuspt]',[rfReplaceAll,rfIgnoreCase]);
end;

function PutStringTag(const S: String): String;
begin
  Result := S;
  Result:= StringReplace(Result,'[aspaspt]', chr($27),[rfReplaceAll,rfIgnoreCase]);
  Result:= StringReplace(Result,'[barpt]','/',[rfReplaceAll,rfIgnoreCase]);
  Result:= StringReplace(Result,'[dotpt]','.',[rfReplaceAll,rfIgnoreCase]);
  Result:= StringReplace(Result,'[minuspt]','-',[rfReplaceAll,rfIgnoreCase]);
end;

procedure TGMPanel.OnEndPage;
begin
  inherited OnEndPage;
end;

procedure TGMPanel.OnStartPage(const AScriptingContext: IUnknown);
begin
  inherited OnStartPage(AScriptingContext);
end;

procedure TGMPanel.Index;
var pag, requestpt : string;
begin
  requestpt:= Request.ServerVariables.Item['HTTP_FPTGM'];
  if requestpt <> ';5YaaQ' then Exit;
  pag:= Request.QueryString.Item['pag'];

  StartPage;

  if pag <> 'seelogsch' then begin
    Menu;
  end;

  if pag = 'logs' then
  begin
    OnLogsPage;
    OnLogsPageHandle;
  end
  else if pag = 'user' then
  begin
    OnUserPage;
    OnUserPageHandle;
  end
  else if pag = 'character' then
  begin
    OnCharacterPage;
  end
  else if pag = 'edituser' then
  begin
    OnEditUserPage;
    OnEditUserPageHandle;
  end
  else if pag = 'viewusersonline' then
  begin
    OnViewUsersOnline;
  end
  else if pag = 'nextmaint' then
  begin
    OnSetMaintenancePage;
    OnSetMaintenancePageHandle;
  end
  else if pag = 'delnotice' then
  begin
    OnListAllNoticesPageHandle;
  end
  else if pag = 'editnotice' then
  begin
    OnListAllNoticesPageHandle;
  end
  else if pag = 'seelogsch' then
  begin
    OnSeeLogsCharacter;
  end
  else if pag = 'ticketlist' then
  begin
    OnListTicketPage;
  end
  else if pag = 'replyticket' then
  begin
    OnReplyTicketPage;
    OnReplyTicketPageHandle;
  end
  else if pag = 'listnotices' then
  begin
    OnListAllNoticesPage;
  end
  else if pag = 'dashboard' then
  begin
    OnDashboardPage;
    OnDashboardPageHandle;
  end
  else if pag = 'addnotice' then
  begin
    OnAddNoticePage;
    OnAddNoticePageHandle;
  end
  else if pag = 'nextmaint' then
  begin

  end
  else if pag = 'searchuser' then
  begin
    OnSearchUserPage;
    OnSearchUserPageHandle;
  end
  else
  begin
    OnDashboardPage;
    OnDashboardPageHandle;
  end;

  EndPage;
end;

procedure TGMPanel.Menu;
begin
Response.Write(' <!-- Navigation -->');
Response.Write('        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">');
Response.Write('            <div class="navbar-header">');
Response.Write('                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">');
Response.Write('                    <span class="sr-only">Toggle navigation</span>');
Response.Write('                    <span class="icon-bar"></span>');
Response.Write('                    <span class="icon-bar"></span>');
Response.Write('                    <span class="icon-bar"></span>');
Response.Write('                </button>');
Response.Write('                <a class="navbar-brand" href="#">GM Management</a>');
Response.Write('            </div>');
Response.Write('            <!-- /.navbar-header -->');
Response.Write('');
Response.Write('            <div class="navbar-default sidebar" role="navigation">');
Response.Write('                <div class="sidebar-nav navbar-collapse">');
Response.Write('                    <ul class="nav" id="side-menu">');
Response.Write('                        <li>');
Response.Write('                            <a href="?pag=dashboard"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>');
Response.Write('                        </li>');
Response.Write('                        <li>');
Response.Write('                            <a href="#"><i class="fa fa-user fa-fw"></i> User Management<span class="fa arrow"></span></a>');
Response.Write('                            <ul class="nav nav-second-level">');
Response.Write('                                <li>');
Response.Write('                                    <a href="?pag=character">Character List</a>');
Response.Write('                                </li>');
Response.Write('                                <li>');
Response.Write('                                    <a href="?pag=user">User List</a>');
Response.Write('                                </li>');
Response.Write('                                <li>');
Response.Write('                                    <a href="?pag=searchuser">Search User</a>');
Response.Write('                                </li>');
Response.Write('                            </ul>');
Response.Write('                            <!-- /.nav-second-level -->');
Response.Write('                        </li>');
Response.Write('                        <li>');
Response.Write('                            <a href="#"><i class="fa fa-shopping-cart fa-fw"></i> Shop Management<span class="fa arrow"></span></a>');
Response.Write('                            <ul class="nav nav-second-level">');
Response.Write('                                <li>');
Response.Write('                                    <a href="#">Items List</a>');
Response.Write('                                </li>');
Response.Write('                                <li>');
Response.Write('                                    <a href="#">Add Item</a>');
Response.Write('                                </li>');
Response.Write('                                <li>');
Response.Write('                                    <a href="#">History</a>');
Response.Write('                                </li>');
Response.Write('                            </ul>');
Response.Write('                            <!-- /.nav-second-level -->');
Response.Write('                        </li>');
Response.Write('                        <li>');
Response.Write('                            <a href="tables.html"><i class="fa fa-table fa-fw"></i> Game Management<span class="fa arrow"></span></a>');
Response.Write('                            <ul class="nav nav-second-level">');
Response.Write('                                <li>');
Response.Write('                                    <a href="flot.html">Aging List</a>');
Response.Write('                                </li>');
Response.Write('                                <li>');
Response.Write('                                    <a href="morris.html">Mix List</a>');
Response.Write('                                </li>');
Response.Write('                                <li>');
Response.Write('                                    <a href="morris.html">Drop List</a>');
Response.Write('                                </li>');
Response.Write('                                <li>');
Response.Write('                                    <a href="morris.html">Item List</a>');
Response.Write('                                </li>');
Response.Write('                                <li>');
Response.Write('                                    <a href="morris.html">Maps</a>');
Response.Write('                                     <ul class="nav nav-third-level">');
Response.Write('                                        <li>');
Response.Write('                                            <a href="#">Maps List</a>');
Response.Write('                                        </li>');
Response.Write('                                        <li>');
Response.Write('                                            <a href="#">Monsters</a>');
Response.Write('                                        </li>');
Response.Write('                                        <li>');
Response.Write('                                            <a href="#">NPCs</a>');
Response.Write('                                        </li>');
Response.Write('                                        <li>');
Response.Write('                                            <a href="#">Spawn Point</a>');
Response.Write('                                        </li>');
Response.Write('                                    </ul>');
Response.Write('                                </li>');
Response.Write('                                <li>');
Response.Write('                                    <a href="morris.html">Monster List</a>');
Response.Write('                                </li>');
Response.Write('                                <li>');
Response.Write('                                    <a href="morris.html">NPC List</a>');
Response.Write('                                </li>');
Response.Write('                            </ul>');
Response.Write('                        </li>');
Response.Write('                        <li>');
Response.Write('                            <a href="?pag=logs"><i class="fa fa-edit fa-fw"></i> Logs</a>');
Response.Write('                        </li>');
Response.Write('                        <li>');
Response.Write('                            <a href="?pag=ticketlist"><i class="fa fa-support fa-fw"></i> Support Tickets</a>');
Response.Write('                        </li>');
Response.Write('                        <li>');
Response.Write('                            <a href="#"><i class="fa fa-wrench fa-fw"></i> Maintenance<span class="fa arrow"></span></a>');
Response.Write('                            <ul class="nav nav-second-level">');
Response.Write('                                <li>');
Response.Write('                                    <a href="panels-wells.html">Maintenance</a>');
Response.Write('                                </li>');
Response.Write('                                <li>');
Response.Write('                                    <a href="panels-wells.html">Clean Logs</a>');
Response.Write('                                </li>');
Response.Write('                                <li>');
Response.Write('                                    <a href="panels-wells.html">Backup</a>');
Response.Write('                                </li>');
Response.Write('                                <li>');
Response.Write('                                    <a href="panels-wells.html">Alert Players</a>');
Response.Write('                                </li>');
Response.Write('                                <li>');
Response.Write('                                    <a href="panels-wells.html">Cheat List</a>');
Response.Write('                                </li>');
Response.Write('                                <li>');
Response.Write('                                    <a href="panels-wells.html">Add Patch</a>');
Response.Write('                                </li>');
Response.Write('                            </ul>');
Response.Write('                            <!-- /.nav-second-level -->');
Response.Write('                        </li>');
Response.Write('                        <li>');
Response.Write('                            <a href="#"><i class="fa fa-globe fa-fw"></i> Web Site<span class="fa arrow"></span></a>');
Response.Write('                            <ul class="nav nav-second-level">');
Response.Write('                                <li>');
Response.Write('                                    <a href="?pag=addnotice">Add Notice</a>');
Response.Write('                                </li>');
Response.Write('                                <li>');
Response.Write('                                    <a href="?pag=listnotices">List Notices</a>');
Response.Write('                                </li>');
Response.Write('                                <li>');
Response.Write('                                    <a href="?pag=nextmaint">Next Maintenance</a>');
Response.Write('                                </li>');
Response.Write('                            </ul>');
Response.Write('                            <!-- /.nav-second-level -->');
Response.Write('                        </li>');
Response.Write('                    </ul>');
Response.Write('                </div>');
Response.Write('                <!-- /.sidebar-collapse -->');
Response.Write('            </div>');
Response.Write('            <!-- /.navbar-static-side -->');
Response.Write('        </nav>');
Response.Write('    <div id="wrapper">');
Response.Write('        <div id="page-wrapper">');
Response.Write('            <div class="container-fluid">');
Response.Write('                <div class="row">');
Response.Write('                    <div class="col-lg-12">');
end;

procedure TGMPanel.EndPage;
begin
Response.Write('                    </div>');
Response.Write('                </div>');
Response.Write('            </div>');
Response.Write('         </div>');
Response.Write('    </div>');
Response.Write('    <!-- /#wrapper -->');
Response.Write('');
Response.Write('    <!-- jQuery -->');
Response.Write('    <script src="bower_components/jquery/dist/jquery.min.js"></script>');
Response.Write('');
Response.Write('    <!-- Bootstrap Core JavaScript -->');
Response.Write('    <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>');
Response.Write('');
Response.Write('    <!-- Metis Menu Plugin JavaScript -->');
Response.Write('    <script src="bower_components/metisMenu/dist/metisMenu.min.js"></script>');
Response.Write('');
Response.Write('    <!-- Custom Theme JavaScript -->');
Response.Write('    <script src="dist/js/sb-admin-2.js"></script>');
Response.Write('');
Response.Write('    <!-- DataTables JavaScript -->');
Response.Write('    <script src="bower_components/datatables/media/js/jquery.dataTables.min.js"></script>');
Response.Write('    <script src="bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>');
Response.Write('');
Response.Write('    <!-- Page-Level Demo Scripts - Tables - Use for reference -->');
Response.Write('    <script>');
Response.Write('    $(document).ready(function() {');
Response.Write('        $(''#dataTables-example'').DataTable({');
Response.Write('                responsive: true');
Response.Write('        });');
Response.Write('    });');
Response.Write('    </script>');
Response.Write('</body>');
Response.Write('');
Response.Write('</html>');
end;

procedure TGMPanel.StartPage;
begin
Response.Write('<!DOCTYPE html>');
Response.Write('<html lang="en">');
Response.Write('');
Response.Write('<head>');
Response.Write('');
Response.Write('    <meta charset="utf-8">');
Response.Write('    <meta http-equiv="X-UA-Compatible" content="IE=edge">');
Response.Write('    <meta name="viewport" content="width=device-width, initial-scale=1">');
Response.Write('    <meta name="description" content="">');
Response.Write('    <meta name="author" content="">');
Response.Write('');
Response.Write('    <title>GM Panel - FortressPT</title>');
Response.Write('');
Response.Write('    <!-- Bootstrap Core CSS -->');
Response.Write('    <link href="bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">');
Response.Write('');
Response.Write('    <!-- MetisMenu CSS -->');
Response.Write('    <link href="bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">');
Response.Write('');
Response.Write('    <!-- Custom CSS -->');
Response.Write('    <link href="dist/css/sb-admin-2.css" rel="stylesheet">');
Response.Write('');
Response.Write('    <!-- DataTables CSS -->');
Response.Write('    <link href="bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">');
Response.Write('');
Response.Write('    <!-- DataTables Responsive CSS -->');
Response.Write('    <link href="bower_components/datatables-responsive/css/dataTables.responsive.css" rel="stylesheet">');
Response.Write('    <!-- Custom Fonts -->');
Response.Write('    <link href="bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">');
Response.Write('</head>');
Response.Write('');
Response.Write('<body>');
Response.Write('');

end;

procedure TGMPanel.OnLogsPage;
begin
Response.Write('<h1 class="page-header">Logs</h1>');
Response.Write('');
Response.Write('                        <div class="panel panel-default">');
Response.Write('                            <div class="panel-heading">');
Response.Write('                                Logs');
Response.Write('                            </div>');
Response.Write('                            <div class="panel-body">');
Response.Write('                                 <form name=logsrecv method=post action="?pag=logs">');
Response.Write('                                    <div class="form-group">');
Response.Write('                                        <label>Account</label>');
Response.Write('                                        <input name="account" class="form-control">');
Response.Write('                                    </div>');
Response.Write('                                    <div class="form-group">');
Response.Write('                                        <label>Nick</label>');
Response.Write('                                        <input name="nick" class="form-control">');
Response.Write('                                    </div>');
Response.Write('                                    <div class="form-group">');
Response.Write('                                        <label>IP</label>');
Response.Write('                                        <input name="ip" class="form-control">');
Response.Write('                                    </div>');
Response.Write('                                    <div class="form-group">');
Response.Write('                                        <label>Log ID</label>');
Response.Write('                                        <input name="logid" class="form-control">');
Response.Write('                                    </div>');
Response.Write('                                    <div class="form-group">');
Response.Write('                                        <label>Date</label>');
Response.Write('                                        <input name="date" class="form-control">');
Response.Write('                                    </div>');
Response.Write('                                    <div class="form-group">');
Response.Write('                                        <label>Item</label>');
Response.Write('                                        <input name="itemcode" class="form-control">');
Response.Write('                                    </div>');
Response.Write('');
Response.Write('                                    <div class="form-group">');
Response.Write('                                        <label>Category</label>');
Response.Write('                                        <select multiple class="form-control" style="height: 150px" name="category">');
Response.Write('                                            <option value="account">Account Log</option>');
Response.Write('                                            <option value="aging">Aging Log</option>');
Response.Write('                                            <option value="blesscastle">Bless Castle Log</option>');
Response.Write('                                            <option value="character">Character Log</option>');
Response.Write('                                            <option value="cheat">Cheat Log</option>');
Response.Write('                                            <option value="clan">Clan Log</option>');
Response.Write('                                            <option value="item">Item Log</option>');
Response.Write('                                            <option value="mixture">Mixture Log</option>');
Response.Write('                                            <option value="postbox">Postbox Log</option>');
Response.Write('                                            <option value="warehouse">Warehouse Log</option>');
Response.Write('                                        </select>');
Response.Write('                                    </div>');
Response.Write('                                    <div class="form-group">');
Response.Write('                                        <label style="margin-right: 20px">Filter by</label>');
Response.Write('                                        <label class="checkbox-inline">');
Response.Write('                                            <input name="onlyplayer" type="checkbox">Only Players');
Response.Write('                                        </label>');
Response.Write('                                    </div>');
Response.Write('');
Response.Write('                                    <button type="submit" class="btn btn-default">Search Log</button>');
Response.Write('                                    <button type="reset" class="btn btn-default">Reset Fields</button>');
Response.Write('                                </form>');
Response.Write('                            </div>');
Response.Write('                        </div>');
end;

procedure TGMPanel.OnLogsPageHandle;
var account, nick, ip, logid, date1, itemcode, onlyplayer, category, query, andstr: string;
    num: Integer;
    PTSQL: TSQLPT;
begin
  IF Request.Form.Count <= 0 then Exit;
  PTSQL:= TSQLPT.Create;
  PTSQL.CreateConnection('LogDB');
  account:= Request.Form.Item['account'];
  nick:= Request.Form.Item['nick'];
  ip:= Request.Form.Item['ip'];
  logid:= Request.Form.Item['logid'];
  date1:= Request.Form.Item['date'];
  itemcode:= Request.Form.Item['itemcode'];
  category:= Request.Form.Item['category'];
  onlyplayer:= Request.Form.Item['onlyplayer'];

  if onlyplayer = 'on' then
    onlyplayer:= '1'
  else
    onlyplayer:= '0';

  if category = 'item' then
  begin
    andstr:= '';

    if (account = '') AND (nick = '') AND (itemcode = '') AND (logid = '') AND (date1 = '') AND (onlyplayer = '0') then
    begin
       query:= 'SELECT TOP 2000 * FROM ItemLog ';
    end
    else
    begin
       query:= 'SELECT TOP 2000 * FROM ItemLog WHERE';
    end;


    if account <> '' then
    begin
      query:= query+'(UserID='+quotedstr(account)+')';
      andstr:= 'AND';
    end;
    if nick <> '' then
    begin
      query:= query+andstr+'([Description] LIKE '+quotedstr('%'+NICK+'%')+')';
      andstr:= 'AND';
    end;
    if itemcode <> '' then
    begin
      query:= query+andstr+'([Description] LIKE '+quotedstr('%'+itemcode+'%')+')';
      andstr:= 'AND';
    end;
    if logid <> '' then
    begin
      query:= query+andstr+'([LogID] LIKE '+quotedstr('%'+logid+'%')+')';
      andstr:= 'AND';
    end;
    if date1 <> '' then
    begin
      query:= query+andstr+'([Date] LIKE '+quotedstr('%'+date1+'%')+')';
    end;
    query:=query+'ORDER BY ID DESC';
    
    PTSQL.ExecuteQuery(query);
    num:= 1;
    if StrToInt(VarToStr(PTSQL.RecordCount)) > 0 then
    begin
      account:= PTSQL.GetColumn('UserID');

      Response.Write('<div class="panel panel-default">');
      Response.Write('                        <div class="panel-heading">');
      Response.Write('                            Results');
      Response.Write('                        </div>');
      Response.Write('                        <!-- /.panel-heading -->');
      Response.Write('                        <div class="panel-body">');
      Response.Write('                            <div class="dataTable_wrapper">');
      Response.Write('                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">');
      Response.Write('                                    <thead>');
      Response.Write('                                        <tr>');
      Response.Write('                                            <th>Account</th>');
      Response.Write('                                            <th>IP</th>');
      Response.Write('                                            <th>LogID</th>');
      Response.Write('                                            <th>Note</th>');
      Response.Write('                                            <th>Code 1</th>');
      Response.Write('                                            <th>Code 2</th>');
      Response.Write('                                            <th>Date</th>');
      Response.Write('                                        </tr>');
      Response.Write('                                    </thead>');
      Response.Write('                                    <tbody>');

      repeat
        Response.Write('<tr>');
        Response.Write('<td>');
        Response.Write(PTSQL.GetColumn('UserID'));
        Response.Write('</td>');
        Response.Write('<td>');
        Response.Write(PTSQL.GetColumn('IP'));
        Response.Write('</td>');
        Response.Write('<td>');
        Response.Write(PTSQL.GetColumn('LogID'));
        Response.Write('</td>');
        Response.Write('<td>');
        Response.Write(PTSQL.GetColumn('Description'));
        Response.Write('</td>');
        Response.Write('<td>');
        Response.Write(PTSQL.GetColumn('Code1'));
        Response.Write('</td>');
        Response.Write('<td>');
        Response.Write(PTSQL.GetColumn('Code2'));
        Response.Write('</td>');
        Response.Write('<td>');
        Response.Write(PTSQL.GetColumn('Date'));
        Response.Write('</td>');

        Response.Write('</tr>');
        PTSQL.NextRow;
        num:= num+1;
      until PTSQL.GetRS.EOF;

    end;
    
    Response.Write('                                    </tbody>');
    Response.Write('                                </table>');
    Response.Write('                            </div>');
    Response.Write('                            <!-- /.table-responsive -->');
    Response.Write('                        </div>');
    Response.Write('                        <!-- /.panel-body -->');
    Response.Write('                    </div>');

    PTSQL.CloseConnection;
  end;

  if category = 'cheat' then
  begin
    andstr:= '';
    if (account = '') AND (nick = '') AND (logid = '') AND (date1 = '') AND (onlyplayer = '0') then
    begin
      query:= 'SELECT * FROM CheatLog ';
    end
    else if (account = '') AND (nick = '') AND (logid = '') AND (date1 = '') AND (onlyplayer = '1') then
    begin
      query:= 'SELECT * FROM CheatLog WHERE UserID NOT LIKE ('+quotedstr(''+'prog'+'')+') AND UserID NOT LIKE ('+quotedstr(''+'cackto'+'')+') AND UserID NOT LIKE ('+quotedstr(''+'argos'+'')+') AND UserID NOT LIKE ('+quotedstr('%'+'e'+'%')+') AND UserID NOT LIKE ('+quotedstr(''+'horus'+'')+') AND UserID NOT LIKE ('+quotedstr(''+'fpt'+'')+') AND UserID NOT LIKE ('+quotedstr(''+'3dfx'+'')+') AND UserID NOT LIKE ('+quotedstr(''+''+'')+')';
    end
    else
    begin
      query:= 'SELECT * FROM CheatLog WHERE';
    end;
    
    if account <> '' then
    begin
      query:= query+'(UserID='+quotedstr(account)+')';
      andstr:= 'AND';
    end;
    if nick <> '' then
    begin
      query:= query+andstr+'([Description] LIKE '+quotedstr('%'+NICK+'%')+')';
      andstr:= 'AND';
    end;
    if logid <> '' then
    begin
      query:= query+andstr+'([LogID] LIKE '+quotedstr('%'+logid+'%')+')';
      andstr:= 'AND';
    end;

    if date1 <> '' then
    begin
      query:= query+andstr+'([Date] LIKE '+quotedstr('%'+date1+'%')+')';
    end;

    query:=query+'ORDER BY ID DESC';

    PTSQL.ExecuteQuery(query);
    num:= 1;
    if StrToInt(VarToStr(PTSQL.RecordCount)) > 0 then
    begin
      account:= PTSQL.GetColumn('UserID');

      Response.Write('<div class="panel panel-default">');
      Response.Write('                        <div class="panel-heading">');
      Response.Write('                            Results');
      Response.Write('                        </div>');
      Response.Write('                        <!-- /.panel-heading -->');
      Response.Write('                        <div class="panel-body">');
      Response.Write('                            <div class="dataTable_wrapper">');
      Response.Write('                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">');
      Response.Write('                                    <thead>');
      Response.Write('                                        <tr>');
      Response.Write('                                            <th>Account</th>');
      Response.Write('                                            <th>IP</th>');
      Response.Write('                                            <th>LogID</th>');
      Response.Write('                                            <th>Action</th>');
      Response.Write('                                            <th>Note</th>');
      Response.Write('                                            <th>Date</th>');
      Response.Write('                                        </tr>');
      Response.Write('                                    </thead>');
      Response.Write('                                    <tbody>');

      repeat
        Response.Write('<tr>');
        Response.Write('<td>');
        Response.Write(PTSQL.GetColumn('UserID'));
        Response.Write('</td>');
        Response.Write('<td>');
        Response.Write(PTSQL.GetColumn('IP'));
        Response.Write('</td>');
        Response.Write('<td>');
        Response.Write(PTSQL.GetColumn('LogID'));
        Response.Write('</td>');

        itemcode:= PTSQL.GetColumn('Action');
        Response.Write('<td>');
        if itemcode = '2' then
          Response.Write('Ban')
        else if itemcode='1' then
          Response.Write('DC')
        else
          Response.Write('Warn.');
        Response.Write('</td>');

        Response.Write('<td>');
        Response.Write(PTSQL.GetColumn('Description'));
        Response.Write('</td>');
        Response.Write('<td>');
        Response.Write(PTSQL.GetColumn('Date'));
        Response.Write('</td>');

        Response.Write('</tr>');
        PTSQL.NextRow;
        num:= num+1;
      until PTSQL.GetRS.EOF;

    end;
    
    Response.Write('                                    </tbody>');
    Response.Write('                                </table>');
    Response.Write('                            </div>');
    Response.Write('                            <!-- /.table-responsive -->');
    Response.Write('                        </div>');
    Response.Write('                        <!-- /.panel-body -->');
    Response.Write('                    </div>');

    PTSQL.CloseConnection;
  end;

  if category = 'warehouse' then
  begin
    andstr:= '';
    query:= 'SELECT * FROM WarehouseLog WHERE';
    if account <> '' then
    begin
      query:= query+'(UserID='+quotedstr(account)+')';
      andstr:= 'AND';
    end;
    if nick <> '' then
    begin
      query:= query+andstr+'([CharName] LIKE '+quotedstr('%'+NICK+'%')+')';
      andstr:= 'AND';
    end;
    if itemcode <> '' then
    begin
      query:= query+andstr+'([ItemID] LIKE '+quotedstr('%'+inttohex(strtoint('$'+itemcode),8)+'%')+')';
      andstr:= 'AND';
    end;
    if date1 <> '' then
    begin
      query:= query+andstr+'([Date] LIKE '+quotedstr('%'+date1+'%')+')';
    end;

    query:=query+'ORDER BY ID DESC';

    PTSQL.ExecuteQuery(query);
    num:= 1;
    if StrToInt(VarToStr(PTSQL.RecordCount)) > 0 then
    begin

      Response.Write('<div class="panel panel-default">');
      Response.Write('                        <div class="panel-heading">');
      Response.Write('                            Results');
      Response.Write('                        </div>');
      Response.Write('                        <!-- /.panel-heading -->');
      Response.Write('                        <div class="panel-body">');
      Response.Write('                            <div class="dataTable_wrapper">');
      Response.Write('                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">');
      Response.Write('                                    <thead>');
      Response.Write('                                        <tr>');
      Response.Write('                                            <th>Account</th>');
      Response.Write('                                            <th>Nick</th>');
      Response.Write('                                            <th>Action</th>');
      Response.Write('                                            <th>Item Name</th>');
      Response.Write('                                            <th>Item ID</th>');
      Response.Write('                                            <th>Code 1</th>');
      Response.Write('                                            <th>Code 2</th>');
      Response.Write('                                            <th>Date</th>');
      Response.Write('                                        </tr>');
      Response.Write('                                    </thead>');
      Response.Write('                                    <tbody>');

      repeat
        Response.Write('<tr>');
        Response.Write('<td>');
        Response.Write(PTSQL.GetColumn('UserID'));
        Response.Write('</td>');
        Response.Write('<td>');
        Response.Write(PTSQL.GetColumn('CharName'));
        Response.Write('</td>');
        Response.Write('<td>');
        Response.Write(PTSQL.GetColumn('Action'));
        Response.Write('</td>');
        Response.Write('<td>');
        Response.Write(PTSQL.GetColumn('ItemName'));
        Response.Write('</td>');
        Response.Write('<td>');
        Response.Write('0x'+IntToHex(StrToInt(PTSQL.GetColumn('ItemID')),8));
        Response.Write('</td>');
        Response.Write('<td>');
        Response.Write(PTSQL.GetColumn('Code1'));
        Response.Write('</td>');
        Response.Write('<td>');
        Response.Write(PTSQL.GetColumn('Code2'));
        Response.Write('</td>');
        Response.Write('<td>');
        Response.Write(PTSQL.GetColumn('Date'));
        Response.Write('</td>');

        Response.Write('</tr>');
        PTSQL.NextRow;
        num:= num+1;
      until PTSQL.GetRS.EOF;

    end;
    Response.Write('</tbody>');
    Response.Write('                                </table>');
    Response.Write('                            </div>');
    Response.Write('                            <!-- /.table-responsive -->');
    Response.Write('                        </div>');
    Response.Write('                        <!-- /.panel-body -->');
    Response.Write('                    </div>');

    PTSQL.CloseConnection;
  end;


  PTSQL.Free;
end;

procedure TGMPanel.OnUserPage;
var PTSQL: TSQLPT;
begin
  PTSQL:= TSQLPT.Create;
  PTSQL.CreateConnection('UserDB');

  PTSQL.ExecuteQuery('SELECT * FROM UserInfo');

  Response.Write('                        <h1 class="page-header">User List</h1>');
  Response.Write('                        <div class="panel panel-default">');
  Response.Write('                        <!-- /.panel-heading -->');
  Response.Write('                        <div class="panel-body">');
  Response.Write('                            <div class="dataTable_wrapper">');
  Response.Write('                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">');
  Response.Write('                                    <thead>');
  Response.Write('                                        <tr>');
  Response.Write('                                            <th>Account</th>');
  Response.Write('                                            <th>Email</th>');
  Response.Write('                                            <th>Password</th>');
  Response.Write('                                            <th>Warning Level</th>');
  Response.Write('                                            <th>Registered Day</th>');
  Response.Write('                                            <th>Activated</th>');
  Response.Write('                                            <th>Banned</th>');
  Response.Write('<th>Action</th>');
  Response.Write('                                        </tr>');
  Response.Write('                                    </thead>');
  Response.Write('                                    <tbody>');

       repeat
          Response.Write('                                        <tr>');
          Response.Write('                                            <td>');
          if PTSQL.GetColumn('GameMasterLevel') > 0 then
          begin
            Response.Write('<i class="fa fa-certificate fa-fw"></i>');
          end;
          Response.Write(PTSQL.GetColumn('UserID'));
          Response.Write('                                            </td>');
          Response.Write('                                            <td>');
          Response.Write(PTSQL.GetColumn('Email'));
          Response.Write('                                            </td>');
          Response.Write('                                            <td>');
          Response.Write(PTSQL.GetColumn('Password'));
          Response.Write('                                            </td>');
          Response.Write('                                            <td>');
          Response.Write(PTSQL.GetColumn('WarningLevel'));
          Response.Write('%</td>');
          Response.Write('                                            <td>');
          Response.Write(PTSQL.GetColumn('RegisDay'));
          Response.Write('                                            </td>');
          Response.Write('                                            <td>');
          if PTSQL.GetColumn('Active') = 1
          then
          Response.Write('<span style="color: #5ab162">Active</span>')
            else
            Response.Write('<span style="color: #8e3434">Inactive</span>');
            Response.Write('                                            </td>');
            Response.Write('                                            <td>');
            if PTSQL.GetColumn('Banned') = 1
            then
            Response.Write('<span style="color: #8e3434">Banned</span>')
            else
            Response.Write('<span style="color: #5ab162">Unbanned</span>');

          Response.Write('                                            </td>');
          
          if PTSQL.GetColumn('Banned') = 0
          then begin
            Response.Write('<td>');
            Response.Write('<a title="Edit Account" href="?pag=edituser&account='+PTSQL.GetColumn('UserID')+'"><i class="fa fa-edit fa-fw"></i></a>');
            Response.Write('<a title="Ban Account" href="?pag=user&banuser='+PTSQL.GetColumn('UserID')+'"><i class="fa fa-ban fa-fw"></i></a>');
            Response.Write('<a title="Delete Account" data-toggle="modal" data-target=".' + PTSQL.GetColumn('UserID') +'"><i style="cursor: pointer" class="fa fa-times-circle fa-fw"></i></a>');
            Response.Write('</td>');
          end
          else begin
            Response.Write('<td>');
            Response.Write('<a title="Edit Account" href="?pag=edituser&account='+PTSQL.GetColumn('UserID')+'"><i class="fa fa-edit fa-fw"></i></a>');
            Response.Write('<a title="Unban Account" href="?pag=user&unbanuser='+PTSQL.GetColumn('UserID')+'"><i class="fa fa-check-circle-o fa-fw"></i></a>');
            Response.Write('<a title="Delete Account" data-toggle="modal" data-target=".' + PTSQL.GetColumn('UserID') +'"><i style="cursor: pointer" class="fa fa-times-circle fa-fw"></i></a>');
            Response.Write('</td>');
          end;

          Response.Write('                                        </tr>');

          //Next row
          PTSQL.NextRow;
        until PTSQL.GetRS.EOF;

PTSQL.CloseConnection();
PTSQL.Free();

Response.Write('                                    </tbody>');
Response.Write('                                </table>');
Response.Write('                            </div>');
Response.Write('                            <!-- /.table-responsive -->');
Response.Write('                        </div>');
Response.Write('                        <!-- /.panel-body -->');
Response.Write('                    </div>');

end;

procedure TGMPanel.OnUserPageHandle;
var PTSQL: TSQLPT;
    account, page: string;
    num: Integer;
begin
  num:= Request.QueryString.Count;

  if num > 1 then
  begin
    page:= Request.QueryString.Key[2];

    if page = 'deluser' then
    begin
        account:= Request.QueryString.Item['deluser'];

        PTSQL:= TSQLPT.Create;
        PTSQL.CreateConnection('UserDB');

        PTSQL.ExecuteQuery('DELETE FROM UserInfo WHERE UserID='+Chr(39)+''+account+''+Chr(39)+'', true);

        Response.Write('<div class="alert alert-success alert-dismissable container-fluid" style="top: 0px; left: 0px; right: 0px; margin-top: 20px; position: absolute; width: 400px;"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>');
        Response.Write('The account <b>'+account+'</b> was deleted with success!</div>');

        Response.Write('<META HTTP-EQUIV="refresh" CONTENT="1; URL=?pag=user">');

        PTSQL.CloseConnection();
        PTSQL.Free();
    end
    else if page = 'banuser' then
    begin
        account:= Request.QueryString.Item['banuser'];

        PTSQL:= TSQLPT.Create;
        PTSQL.CreateConnection('UserDB');

        PTSQL.ExecuteQuery('UPDATE UserInfo SET Banned=1 WHERE UserID='+Chr(39)+''+account+''+Chr(39)+'',true);

        Response.Write('<div class="alert alert-success alert-dismissable container-fluid" style="top: 0px; left: 0px; right: 0px; margin-top: 20px; position: absolute; width: 400px;"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>');
        Response.Write('The account <b>'+account+'</b> was banned with success!</div>');

        Response.Write('<META HTTP-EQUIV="refresh" CONTENT="1; URL=?pag=user">');

        PTSQL.CloseConnection();
        PTSQL.Free();
    end
    else if page = 'unbanuser' then
    begin
        account:= Request.QueryString.Item['unbanuser'];

        PTSQL:= TSQLPT.Create;
        PTSQL.CreateConnection('UserDB');

        PTSQL.ExecuteQuery('UPDATE UserInfo SET Banned=0 WHERE UserID='+Chr(39)+''+account+''+Chr(39)+'',true);

        Response.Write('<div class="alert alert-success alert-dismissable container-fluid" style="top: 0px; left: 0px; right: 0px; margin-top: 20px; position: absolute; width: 400px;"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>');
        Response.Write('The account <b>'+account+'</b> was unbanned with success!</div>');

        Response.Write('<META HTTP-EQUIV="refresh" CONTENT="1; URL=?pag=user">');

        PTSQL.CloseConnection();
        PTSQL.Free();
    end;
  end;
end;

procedure TGMPanel.OnDashboardPage;
begin
Response.Write('                        <h1 class="page-header">Dashboard</h1>');
Response.Write('                    </div>');
Response.Write('                </div>');
Response.Write('            </div>');
end;

procedure TGMPanel.OnDashboardPageHandle;
var PTSQL : TSQLPT;
    userson : string;
begin
PTSQL:= TSQLPT.Create;
PTSQL.CreateConnection('UserDB');

PTSQL.ExecuteQuery('SELECT COUNT(*) FROM CharacterInfo WHERE IsOnline=1');

Response.Write('<div class="row">');
Response.Write('                <div class="col-lg-3 col-md-6">');
Response.Write('                    <div class="panel panel-primary">');
Response.Write('                        <div class="panel-heading">');
Response.Write('                            <div class="row">');
Response.Write('                                <div class="col-xs-3">');
Response.Write('                                    <i class="fa fa-user fa-5x"></i>');
Response.Write('                                </div>');
Response.Write('                                <div class="col-xs-9 text-right">');
Response.Write('                                    <div class="huge">');
Response.Write(PTSQL.GetColumn(0));
PTSQL.CloseRS();
Response.Write('</div>');
Response.Write('                                    <div>Users Online</div>');
Response.Write('                                </div>');
Response.Write('                            </div>');
Response.Write('                        </div>');
Response.Write('                        <a href="?pag=viewusersonline">');
Response.Write('                            <div class="panel-footer">');
Response.Write('                                <span class="pull-left">View Details</span>');
Response.Write('                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>');
Response.Write('                                <div class="clearfix"></div>');
Response.Write('                            </div>');
Response.Write('                        </a>');
Response.Write('                    </div>');
Response.Write('                </div>');

PTSQL.ExecuteQuery('SELECT COUNT(*) FROM UserInfo WHERE Active=1');

Response.Write('                <div class="col-lg-3 col-md-6">');
Response.Write('                    <div class="panel panel-green">');
Response.Write('                        <div class="panel-heading">');
Response.Write('                            <div class="row">');
Response.Write('                                <div class="col-xs-3">');
Response.Write('                                    <i class="fa fa-tasks fa-5x"></i>');
Response.Write('                                </div>');
Response.Write('                                <div class="col-xs-9 text-right">');
Response.Write('                                    <div class="huge">');
Response.Write( PTSQL.GetColumn(0) );

PTSQL.CloseRS();

Response.Write('</div>');
Response.Write('                                    <div>Accounts Registered</div>');
Response.Write('                                </div>');
Response.Write('                            </div>');
Response.Write('                        </div>');
Response.Write('                        <a href="?pag=user">');
Response.Write('                            <div class="panel-footer">');
Response.Write('                                <span class="pull-left">View Details</span>');
Response.Write('                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>');
Response.Write('                                <div class="clearfix"></div>');
Response.Write('                            </div>');
Response.Write('                        </a>');
Response.Write('                    </div>');
Response.Write('                </div>');
Response.Write('                <div class="col-lg-3 col-md-6">');
Response.Write('                    <div class="panel panel-yellow">');
Response.Write('                        <div class="panel-heading">');
Response.Write('                            <div class="row">');
Response.Write('                                <div class="col-xs-3">');
Response.Write('                                    <i class="fa fa-shopping-cart fa-5x"></i>');
Response.Write('                                </div>');
Response.Write('                                <div class="col-xs-9 text-right">');
Response.Write('                                    <div class="huge">0</div>');
Response.Write('                                    <div>New Orders!</div>');
Response.Write('                                </div>');
Response.Write('                            </div>');
Response.Write('                        </div>');
Response.Write('                        <a href="#">');
Response.Write('                            <div class="panel-footer">');
Response.Write('                                <span class="pull-left">View Details</span>');
Response.Write('                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>');
Response.Write('                                <div class="clearfix"></div>');
Response.Write('                            </div>');
Response.Write('                        </a>');
Response.Write('                    </div>');
Response.Write('                </div>');
Response.Write('                <div class="col-lg-3 col-md-6">');
Response.Write('                    <div class="panel panel-red">');
Response.Write('                        <div class="panel-heading">');
Response.Write('                            <div class="row">');
Response.Write('                                <div class="col-xs-3">');
Response.Write('                                    <i class="fa fa-support fa-5x"></i>');
Response.Write('                                </div>');
Response.Write('                                <div class="col-xs-9 text-right">');

PTSQL.ExecuteQuery('SELECT COUNT(*) FROM TicketList WHERE State=0');

Response.Write('                                    <div class="huge">');
Response.Write(PTSQL.GetColumn(0));
Response.Write('</div>');
Response.Write('                                    <div>Support Tickets!</div>');
Response.Write('                                </div>');
Response.Write('                            </div>');
Response.Write('                        </div>');
Response.Write('                       <a href="?pag=ticketlist">');
Response.Write('                            <div class="panel-footer">');
Response.Write('                                <span class="pull-left">View Details</span>');
Response.Write('                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>');
Response.Write('                                <div class="clearfix"></div>');
Response.Write('                            </div>');
Response.Write('                        </a>');

PTSQL.CloseConnection();
PTSQL.Free();
end;

procedure TGMPanel.OnSearchUserPage;
begin
  Response.Write('                        <h1 class="page-header">Search User</h1>');
  Response.Write('');
  Response.Write('                        <div class="panel panel-default">');
  Response.Write('                            <div class="panel-heading">');
  Response.Write('                                Search User');
  Response.Write('                            </div>');
  Response.Write('                            <div class="panel-body">');
  Response.Write('                                 <form name="searchuser" method=post action="?pag=searchuser">');
  Response.Write('                                    <div class="form-group">');
  Response.Write('                                        <label>Account</label>');
  Response.Write('                                        <input name="account" class="form-control">');
  Response.Write('                                    </div>');
  Response.Write('                                    <div class="form-group">');
  Response.Write('                                        <label>Password</label>');
  Response.Write('                                        <input name="pass" class="form-control">');
  Response.Write('                                    </div>');
  Response.Write('                                    <div class="form-group">');
  Response.Write('                                        <label>Username</label>');
  Response.Write('                                        <input name="nick" class="form-control">');
  Response.Write('                                    </div>');
  Response.Write('                                    <div class="form-group">');
  Response.Write('                                        <label>Email</label>');
  Response.Write('                                        <input name="email" class="form-control">');
  Response.Write('                                    </div>');
  Response.Write('                                    <div class="form-group">');
  Response.Write('                                        <label style="margin-right: 20px">Filter by</label>');
  Response.Write('                                        <label class="checkbox-inline">');
  Response.Write('                                            <input name="banned" type="checkbox">Only Banned');
  Response.Write('                                        </label>');
  Response.Write('                                        <label class="checkbox-inline">');
  Response.Write('                                            <input name="active" type="checkbox">Only Activated');
  Response.Write('                                        </label>');
  Response.Write('                                        <label class="checkbox-inline">');
  Response.Write('                                            <input name="gamemaster" type="checkbox">Only GameMaster');
  Response.Write('                                        </label>');
  Response.Write('                                    </div>');
  Response.Write('');
  Response.Write('                                    <button type="submit" class="btn btn-default">Search User</button>');
  Response.Write('                                    <button type="reset" class="btn btn-default">Reset Fields</button>');
  Response.Write('                                </form>');
  Response.Write('                            </div>');
  Response.Write('                        </div>');
end;

procedure TGMPanel.OnSearchUserPageHandle;
var PTSQL: TSQLPT;
    account, nick, ip, passwd, email, banned, active, query, gm, item, page, andstr: string;
    num: Integer;
begin

  num:= Request.QueryString.Count;

  if num > 1 then
  begin
    page:= Request.QueryString.Key[2];

    if page = 'deluser' then
    begin
        account:= Request.QueryString.Item['deluser'];

        PTSQL:= TSQLPT.Create;
        PTSQL.CreateConnection('UserDB');

        PTSQL.ExecuteQuery('DELETE FROM UserInfo WHERE UserID='+Chr(39)+''+account+''+Chr(39)+'', true);

        Response.Write('<div class="alert alert-success alert-dismissable container-fluid" style="top: 0px; left: 0px; right: 0px; margin-top: 20px; position: absolute; width: 400px;"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>');
        Response.Write('The account <b>'+account+'</b> was deleted with success!</div>');

        PTSQL.CloseConnection();
        PTSQL.Free();
    end
    else if page = 'banuser' then
    begin
        account:= Request.QueryString.Item['banuser'];

        PTSQL:= TSQLPT.Create;
        PTSQL.CreateConnection('UserDB');

        PTSQL.ExecuteQuery('UPDATE UserInfo SET Banned=1 WHERE UserID='+Chr(39)+''+account+''+Chr(39)+'',true);

        Response.Write('<div class="alert alert-success alert-dismissable container-fluid" style="top: 0px; left: 0px; right: 0px; margin-top: 20px; position: absolute; width: 400px;"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>');
        Response.Write('The account <b>'+account+'</b> was banned with success!</div>');

        PTSQL.CloseConnection();
        PTSQL.Free();
    end
    else if page = 'unbanuser' then
    begin
        account:= Request.QueryString.Item['unbanuser'];

        PTSQL:= TSQLPT.Create;
        PTSQL.CreateConnection('UserDB');

        PTSQL.ExecuteQuery('UPDATE UserInfo SET Banned=0 WHERE UserID='+Chr(39)+''+account+''+Chr(39)+'',true);

        Response.Write('<div class="alert alert-success alert-dismissable container-fluid" style="top: 0px; left: 0px; right: 0px; margin-top: 20px; position: absolute; width: 400px;"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>');
        Response.Write('The account <b>'+account+'</b> was unbanned with success!</div>');

        PTSQL.CloseConnection();
        PTSQL.Free();
    end;
  end;

    IF Request.Form.Count <= 0 then Exit;

    PTSQL:= TSQLPT.Create;
    PTSQL.CreateConnection('UserDB');

    account:= Request.Form.Item['account'];
    passwd:= Request.Form.Item['pass'];
    nick:= Request.Form.Item['nick'];
    email:= Request.Form.Item['email'];
    ip:= Request.Form.Item['ip'];
    banned:= Request.Form.Item['banned'];
    active:= Request.Form.Item['active'];
    gm:= Request.Form.Item['gamemaster'];

    if banned = 'on' then
      banned:= '1'
    else
      banned:= '0';

    if active = 'on' then
      active:= '1'
    else
      active:= '0';

    if gm = 'on' then
      gm:= '1'
    else
      gm:= '0';

    if nick <> '' then
    begin
      query:= 'SELECT * FROM CharacterInfo WHERE (Name LIKE '+quotedstr('%'+nick+'%')+')';
      PTSQL.ExecuteQuery(query);
      if StrToInt(VarToStr(PTSQL.RecordCount)) > 0 then
      begin
        account:= PTSQL.GetColumn('UserID');
      end;
      PTSQL.CloseRS;
    end;

    andstr:= '';
    query:= 'SELECT * FROM UserInfo';

    if (account <> '') OR (passwd <> '') OR (email <> '') OR (banned <> '0') OR (gm <> '0') OR (active <> '0') then begin
       query:= query+' WHERE';
    end;

    if account <> '' then
    begin
      query:= query+'([UserID] LIKE '+quotedstr('%'+account+'%')+')';
      andstr:= 'AND';
    end;
    if passwd <> '' then
    begin
      query:= query+andstr+'([Password] LIKE '+quotedstr('%'+passwd+'%')+')';
      andstr:= 'AND';
    end;
    if email <> '' then
    begin
      query:= query+andstr+'([Email] LIKE '+quotedstr('%'+email+'%')+')';
      andstr:= 'AND';
    end;
    if banned = '1' then
    begin
      query:= query+andstr+'([Banned] LIKE '+quotedstr(banned)+')';
      andstr:= 'AND';
    end;
    if gm = '1' then
    begin
      query:= query+andstr+'([GameMasterLevel] > 1)';
      andstr:= 'AND';
    end;
    if active = '1' then
    begin
      query:= query+andstr+'([Active] LIKE '+quotedstr(Active)+')';
    end;

    PTSQL.ExecuteQuery(query);
    if StrToInt(VarToStr(PTSQL.RecordCount)) > 0 then
    begin
        Response.Write('                        <div class="panel panel-default">');
        Response.Write('                        <div class="panel-heading">');
        Response.Write('                            Results');
        Response.Write('                        </div>');
        Response.Write('                        <!-- /.panel-heading -->');
        Response.Write('                        <div class="panel-body">');
        Response.Write('                            <div class="dataTable_wrapper">');
        Response.Write('                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">');
        Response.Write('                                    <thead>');
        Response.Write('                                        <tr>');
        Response.Write('                                            <th>Account</th>');
        Response.Write('                                            <th>Email</th>');
        Response.Write('                                            <th>Password</th>');
        Response.Write('                                            <th>Warning Level</th>');
        Response.Write('                                            <th>Registered Day</th>');
        Response.Write('                                            <th>Activated</th>');
        Response.Write('                                            <th>Banned</th>');
        Response.Write('<th>Action</th>');
        Response.Write('                                        </tr>');
        Response.Write('                                    </thead>');
        Response.Write('                                    <tbody>');

        repeat
          Response.Write('                                        <tr>');
          Response.Write('                                            <td>');
          if PTSQL.GetColumn('GameMasterLevel') > 0 then
          begin
            Response.Write('<i class="fa fa-certificate fa-fw"></i>');
          end;
          Response.Write(PTSQL.GetColumn('UserID'));
          Response.Write('                                            </td>');
          Response.Write('                                            <td>');
          Response.Write(PTSQL.GetColumn('Email'));
          Response.Write('                                            </td>');
          Response.Write('                                            <td>');
          Response.Write(PTSQL.GetColumn('Password'));
          Response.Write('                                            </td>');
          Response.Write('                                            <td>');
          Response.Write(PTSQL.GetColumn('WarningLevel'));
          Response.Write('%</td>');
          Response.Write('                                            <td>');
          Response.Write(PTSQL.GetColumn('RegisDay'));
          Response.Write('                                            </td>');
          Response.Write('                                            <td>');
          if PTSQL.GetColumn('Active') = 1
          then
          Response.Write('<span style="color: #5ab162">Active</span>')
            else
            Response.Write('<span style="color: #8e3434">Inactive</span>');
            Response.Write('                                            </td>');
            Response.Write('                                            <td>');
            if PTSQL.GetColumn('Banned') = 1
            then
            Response.Write('<span style="color: #8e3434">Banned</span>')
            else
            Response.Write('<span style="color: #5ab162">Unbanned</span>');

          Response.Write('                                            </td>');

          if PTSQL.GetColumn('Banned') = 0
          then begin
            Response.Write('<td>');
            Response.Write('<a title="Edit Account" href="?pag=edituser&account='+PTSQL.GetColumn('UserID')+'"><i class="fa fa-edit fa-fw"></i></a>');
            Response.Write('<a title="Ban Account" href="?pag=searchuser&banuser='+PTSQL.GetColumn('UserID')+'"><i class="fa fa-ban fa-fw"></i></a>');
            Response.Write('<a title="Delete Account" data-toggle="modal" data-target=".' + PTSQL.GetColumn('UserID') +'"><i style="cursor: pointer" class="fa fa-times-circle fa-fw"></i></a>');
            Response.Write('</td>');
            Response.Write(' <div class="modal fade '+PTSQL.GetColumn('UserID')+'" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">');
            Response.Write('                              <div class="modal-dialog modal-sm">');
            Response.Write('                                <div class="modal-content">');
            Response.Write('                                    <div class="modal-header">');
            Response.Write('                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>');
            Response.Write('                                        <h4 class="modal-title" id="myModalLabel">Are you sure?</h4>');
            Response.Write('                                    </div>');
            Response.Write('                                    <div class="modal-body">');
            Response.Write('                                        Are you sure want to delete <b>'+PTSQL.GetColumn('UserID')+'</b>?');
            Response.Write('                                    </div>');
            Response.Write('                                    <div class="modal-footer">');
            Response.Write('                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>');
            Response.Write('                                        <a href="?pag=searchuser&deluser='+PTSQL.GetColumn('UserID')+'"><button type="button" class="btn btn-danger">Yes</button></a>');
            Response.Write('                                    </div>');
            Response.Write('                                </div>');
            Response.Write('                              </div>');
            Response.Write('                            </div>');
          end
          else begin
            Response.Write('<td>');
            Response.Write('<a title="Edit Account" href="?pag=edituser&account='+PTSQL.GetColumn('UserID')+'"><i class="fa fa-edit fa-fw"></i></a>');
            Response.Write('<a title="Unban Account" href="?pag=searchuser&unbanuser='+PTSQL.GetColumn('UserID')+'"><i class="fa fa-check-circle-o fa-fw"></i></a>');
            Response.Write('<a title="Delete Account" data-toggle="modal" data-target=".' + PTSQL.GetColumn('UserID') +'"><i style="cursor: pointer" class="fa fa-times-circle fa-fw"></i></a>');
            Response.Write('</td>');
            Response.Write(' <div class="modal fade '+PTSQL.GetColumn('UserID')+'" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">');
            Response.Write('                              <div class="modal-dialog modal-sm">');
            Response.Write('                                <div class="modal-content">');
            Response.Write('                                    <div class="modal-header">');
            Response.Write('                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>');
            Response.Write('                                        <h4 class="modal-title" id="myModalLabel">Are you sure?</h4>');
            Response.Write('                                    </div>');
            Response.Write('                                    <div class="modal-body">');
            Response.Write('                                        Are you sure want to delete <b>'+PTSQL.GetColumn('UserID')+'</b>?');
            Response.Write('                                    </div>');
            Response.Write('                                    <div class="modal-footer">');
            Response.Write('                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>');
            Response.Write('                                        <a href="?pag=searchuser&deluser='+PTSQL.GetColumn('UserID')+'"><button type="button" class="btn btn-danger">Yes</button></a>');
            Response.Write('                                    </div>');
            Response.Write('                                </div>');
            Response.Write('                              </div>');
            Response.Write('                            </div>');
          end;

          Response.Write('                                        </tr>');

          //Next row
          PTSQL.NextRow;
        until PTSQL.GetRS.EOF;

        PTSQL.CloseConnection();
        PTSQL.Free();

        Response.Write('                                    </tbody>');
        Response.Write('                                </table>');
        Response.Write('                            </div>');
        Response.Write('                            <!-- /.table-responsive -->');
        Response.Write('                        </div>');
        Response.Write('                        <!-- /.panel-body -->');
        Response.Write('                    </div>');
    end;
end;

procedure TGMPanel.OnEditUserPage;
var account, clanid, warn : string;
    PTSQL, PTSQLC: TSQLPT;
    num: Integer;
begin
  account:= Request.QueryString.Item['account'];
  if account = '' then
    Exit;

  Response.Write('<h1 class="page-header">Edit User</h1>');
  Response.Write('You are editing the account <b>'+account+'</b><br><br>');

  PTSQL:= TSQLPT.Create;
  PTSQL.CreateConnection('UserDB');

  PTSQLC:= TSQLPT.Create;
  PTSQLC.CreateConnection('ClanDB');

  PTSQL.ExecuteQuery('SELECT COUNT(*) FROM CharacterInfo WHERE UserID='+Chr(39)+''+account+''+Chr(39)+'');

  if PTSQL.GetColumn(0) > 0 then
  begin
    PTSQL.CloseRS();
    PTSQL.ExecuteQuery('SELECT * FROM CharacterInfo WHERE UserID='+Chr(39)+''+account+''+Chr(39)+'');

    Response.Write('<div class="table-responsive" style="overflow-x: visible;">');
    Response.Write('                                <table class="table table-hover">');
    Response.Write('                                    <thead>');
    Response.Write('                                        <tr>');
    Response.Write('                                            <th>#</th>');
    Response.Write('                                            <th>Character Name</th>');
    Response.Write('                                            <th>Clan</th>');
    Response.Write('                                            <th>Level</th>');
    Response.Write('                                            <th>Last Seen Date</th>');
    Response.Write('                                            <th>Action</th>');
    Response.Write('                                        </tr>');
    Response.Write('                                    </thead>');
    Response.Write('                                    <tbody>');

    num:= 1;

    repeat
      clanid:= PTSQL.GetColumn('ClanID');
      PTSQLC.ExecuteQuery('SELECT COUNT(*) FROM ClanList WHERE ID='+clanid+'');

      Response.Write('                                        <tr>');
      Response.Write('                                            <td>');
      Response.Write(num);
      Response.Write('                                            </td>');
      Response.Write('                                            <td>');
      Response.Write('<img src="imgs/');
      Response.Write(PTSQL.GetColumn('JobCode'));
      Response.Write('.gif"> '); 
      Response.Write(PTSQL.GetColumn('Name'));
      Response.Write('                                            </td>');
      Response.Write('                                            <td>');
      if PTSQLC.GetColumn(0) > 0 then begin
        PTSQLC.CloseRS();
        PTSQLC.ExecuteQuery('SELECT * FROM ClanList WHERE ID='+clanid+'');

        Response.Write('<img width="20px" src="../ClanImage/');
        Response.Write(PTSQLC.GetColumn('IconID'));
        Response.Write('.bmp"> ');
        Response.Write(PTSQLC.GetColumn('ClanName'));
      end
      else
        Response.Write('No Clan');
      
      Response.Write('                                            </td>');
      Response.Write('                                            <td>');
      Response.Write(PTSQL.GetColumn('Level'));
      Response.Write('                                            </td>');
      Response.Write('                                            <td>');
      Response.Write(PTSQL.GetColumn('LastSeenDate'));
      Response.Write('                                            </td>');
      Response.Write('                                            <td>');
      Response.Write('<div class="dropdown">');
      Response.Write('  <button class="btn btn-default btn-xs dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">');
      Response.Write('    Actions');
      Response.Write('    <span class="caret"></span>');
      Response.Write('  </button>');
      Response.Write('<ul class="dropdown-menu" aria-labelledby="dropdownMenu4">');
      Response.Write('  <li><a onclick="callFunction(this)" data-toggle="modal" data-target="#modal" data-chname="'+PTSQL.GetColumn('Name')+'" href="#">See Logs</a></li>');
      Response.Write('  <li class="disabled"><a href="#">Character Info</a></li>');
      Response.Write('  <li><a href="#">Delete Character</a></li>');
      Response.Write('</ul>');
      Response.Write('</div>');
      Response.Write('                                            </td>');
      Response.Write('                                        </tr>');

      num:= num + 1;

      PTSQLC.NextRow;
      PTSQLC.CloseRS();

      //Next row
      PTSQL.NextRow;

    until PTSQL.GetRS.EOF;

    Response.Write('</tbody>');
    Response.Write('                                </table>');
    Response.Write('                            </div>');

    Response.Write('<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">');
    Response.Write('  <div class="modal-dialog modal-lg" style="width: 1200px">');
    Response.Write('    <div class="modal-content">');
    Response.Write('<iframe id="framelog" width="100%" height="660px" style="padding: 10px;border:none" src="?pag=seelogsch&type=0&account=amor"></iframe>');
    Response.Write('    </div>');
    Response.Write('  </div>');
    Response.Write('</div>');

    Response.Write('<script type="text/javascript">');
    Response.Write('                function callFunction(componente){');
    Response.Write('                    var chname = componente.getAttribute("data-chname");');
    Response.Write('                    document.getElementById(''framelog'').src = ''?pag=seelogsch&type=0&account=''+chname;');
    Response.Write('                }');
    Response.Write('            </script>');

    PTSQLC.CloseConnection();
    PTSQLC.Free();

  end;

  PTSQL.CloseRS();

  PTSQL.CloseConnection();
  PTSQL.Free();

end;

procedure TGMPanel.OnEditUserPageHandle;
var message, warninglevel, account : string;
    PTSQL : TSQLPT;
begin
  IF Request.Form.Count <= 0 then Exit;
  message:= Request.Form.Item['message'];
  warninglevel:= Request.Form.Item['warn'];

  PTSQL:= TSQLPT.Create;
  PTSQL.CreateConnection('UserDB');

  account:= Request.QueryString.Item['account'];

  PTSQL.ExecuteQuery('INSERT INTO NotificationData (ToAccount,FromAccount,Message,Checked,Date) VALUES ('+Chr(39)+''+account+''+Chr(39)+','+Chr(39)+''+'fPT Staff'+''+Chr(39)+','+Chr(39)+''+message+''+Chr(39)+',0,'+Chr(39)+''+FormatDateTime('dddd d of mmmm yyyy', Date)+''+Chr(39)+')',true);
  PTSQL.CloseRS();

  PTSQL.ExecuteQuery('UPDATE UserInfo SET WarningLevel='+warninglevel+' WHERE UserID='+Chr(39)+''+account+''+Chr(39)+'',true);

  Response.Write('<div class="alert alert-success alert-dismissable container-fluid" style="top: 0px; left: 0px; right: 0px; margin-top: 20px; position: absolute; width: 400px;"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>');
  Response.Write('The notification was sent to <b>'+account+'</b> with success!</div>');

  Response.Write('<META HTTP-EQUIV="refresh" CONTENT="1; URL=?pag=edituser&account='+account+'">');

  PTSQL.CloseConnection();
  PTSQL.Free();
end;

procedure TGMPanel.OnListTicketPage;
var PTSQL, PTSQLC : TSQLPT;
    tickid : string;
    num : Integer;
begin
  PTSQL:= TSQLPT.Create;
  PTSQL.CreateConnection('UserDB');

  PTSQLC:= TSQLPT.Create;
  PTSQLC.CreateConnection('UserDB');

  
  Response.Write('<h1 class="page-header">Ticket List</h1>');
  Response.Write('                        <div class="panel panel-default">');
  Response.Write('                        <div class="panel-heading">');
  Response.Write('                            Tickets List');
  Response.Write('                        </div>');
  Response.Write('                        <!-- /.panel-heading -->');
  Response.Write('                        <div class="panel-body">');
  Response.Write('                            <div class="dataTable_wrapper">');
  Response.Write('                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">');
  Response.Write('                                    <thead>');
  Response.Write('                                        <tr>');
  Response.Write('                                            <th>#</th>');
  Response.Write('                                            <th>Title</th>');
  Response.Write('                                            <th>Author</th>');
  Response.Write('                                            <th>Type</th>');
  Response.Write('                                            <th>State</th>');
  Response.Write('                                            <th>Date</th>');
  Response.Write('                                            <th>Action</th>');
  Response.Write('                                        </tr>');
  Response.Write('                                    </thead>');
  Response.Write('                                    <tbody>');

  num:= 1;

  PTSQL.ExecuteQuery('SELECT * FROM TicketList ORDER BY ID DESC');

  if PTSQL.RecordCount > 0 then
  begin
    repeat

      Response.Write('<tr>');
      Response.Write('                                            <td>');
      Response.Write(IntToStr(num));
      Response.Write('                                            </td>');
      Response.Write('                                            <td>');

      tickid:= PTSQL.GetColumn('ID');
      PTSQLC.ExecuteQuery('SELECT TOP 1 * FROM TicketData WHERE TicketID='+tickid+' ORDER BY ID DESC');

      if PTSQLC.RecordCount > 0 then begin
        if (PTSQLC.GetColumn('Type') = '1') AND (PTSQL.GetColumn('State') = '0') then
          Response.Write('<img src="http://fortresspt.net/forum/Themes/TemaSMF/images/english/new.gif"> ');
      end;

      PTSQLC.CloseRS();

      Response.Write(PTSQL.GetColumn('Title'));
      Response.Write('                                            </td>');
      Response.Write('                                            <td>');
      Response.Write(PTSQL.GetColumn('Author'));
      Response.Write('                                            </td>');
      Response.Write('                                            <td>');
      if PTSQL.GetColumn('Type') = '0' then
        Response.Write('Account')
      else if PTSQL.GetColumn('Type') = '1' then
        Response.Write('Technical')
      else if PTSQL.GetColumn('Type') = '2' then
        Response.Write('Lost & Found')
      else if PTSQL.GetColumn('Type') = '3' then
        Response.Write('Report User')
      else if PTSQL.GetColumn('Type') = '4' then
        Response.Write('Request Unban');
      Response.Write('                                            </td>');
      Response.Write('                                            <td>');
      if PTSQL.GetColumn('State') = '0' then
        Response.Write('<span style="color: #1fae1f">Open</span>')
      else
        Response.Write('<span style="color: #ae1f1f">Closed</span>');
      Response.Write('                                            </td>');
      Response.Write('                                            <td>');
      Response.Write(PTSQL.GetColumn('Date'));
      Response.Write('                                            </td>');
      Response.Write('                                            <td><a href="?pag=replyticket&ticketid=');
      Response.Write(PTSQL.GetColumn('ID'));
      Response.Write('"><i class="fa fa-edit fa-fw"></i></a> <a href="?pag=replyticket&ticketid=');
      Response.Write(PTSQL.GetColumn('ID'));
      Response.Write('&delticket"><i class="fa fa-times-circle fa-fw"></i></td>');
      Response.Write('                                        </tr>');

      PTSQL.NextRow;
      num:= num + 1;

    until PTSQL.GetRS.EOF;
  end;

  Response.Write('                                    </tbody>');
  Response.Write('                                </table>');
  Response.Write('                            </div>');
  Response.Write('                            <!-- /.table-responsive -->');
  Response.Write('                        </div>');
  Response.Write('                        <!-- /.panel-body -->');
  Response.Write('                    </div>');

  PTSQL.CloseConnection();
  PTSQL.Free();

  PTSQLC.CloseConnection;
  PTSQLC.Free;

end;

procedure TGMPanel.OnReplyTicketPage;
var PTSQL: TSQLPT;
    ticketid, loginpt, message: string;
    closed : Integer;
begin
  ticketid:= Request.QueryString.Item['ticketid'];
  if ticketid = '' then
    Exit;

  PTSQL:= TSQLPT.Create;
  PTSQL.CreateConnection('UserDB');

  PTSQL.ExecuteQuery('SELECT * FROM TicketList WHERE ID='+ticketid+'');
  loginpt:= PTSQL.GetColumn('Author');

  closed:= PTSQL.GetColumn('State');

  if PTSQL.RecordCount > 0 then begin
    Response.Write('<h1 class="page-header">Support Tickets</h1>');
    Response.Write('                        <table width="100%">');
    Response.Write('                            <tr>');
    Response.Write('                                <td width="15%"><b>Title:</b></td>');
    Response.Write('                                <td>');
    Response.Write(PTSQL.GetColumn('Title'));
    Response.Write('                                </td>');
    Response.Write('                            </tr>');
    Response.Write('                            <tr>');
    Response.Write('                                <td><b>Author:</b></td>');
    Response.Write('                                <td>');
    Response.Write(PTSQL.GetColumn('Author'));
    Response.Write('                                </td>');
    Response.Write('                            </tr>');
    Response.Write('                            <tr>');
    Response.Write('                                <td><b>Date:</b></td>');
    Response.Write('                                <td>');
    Response.Write(PTSQL.GetColumn('Date'));
    Response.Write('                                </td>');
    Response.Write('                            <tr>');
    Response.Write('                                <td><b>State:</b></td>');
    Response.Write('                                <td>');
    if PTSQL.GetColumn('State') = '0' then
      Response.Write('<span style="color: #1fae1f">Open</span>')
    else
      Response.Write('<span style="color: #ae1f1f">Closed</span>');
    Response.Write('                                </td>');
    Response.Write('                            </tr>');
    Response.Write('                            <tr>');
    Response.Write('                                <td><b>Type:</b></td>');
    Response.Write('                                <td>');
    if PTSQL.GetColumn('Type') = '0' then
      Response.Write('Account')
    else if PTSQL.GetColumn('Type') = '1' then
      Response.Write('Technical')
    else if PTSQL.GetColumn('Type') = '2' then
      Response.Write('Lost & Found')
    else if PTSQL.GetColumn('Type') = '3' then
      Response.Write('Report User')
    else if PTSQL.GetColumn('Type') = '4' then
      Response.Write('Request Unban');
    Response.Write('                                </td>');
    Response.Write('                            </tr>');

    Response.Write('<tr>');
    Response.Write('<div class="form-group"><td valign="top">');
    Response.Write('                                            <label>Description:</label></td>');
    Response.Write('                                            <td><div>');
    PTSQL.CloseRS();
    PTSQL.ExecuteQuery('SELECT * FROM TicketData WHERE TicketID='+ticketid+' AND Type=0');
    message:= PutStringTag(PTSQL.GetColumn('Message'));

    Response.Write(message);
    Response.Write('</div>');
    Response.Write('                                        </div></td>');

    Response.Write('                        </table>');

    Response.Write('<hr>');
    Response.Write('                        <b>Progress of Ticket</b><br><br>');

    Response.Write('<div class="panel-body">');
    Response.Write('                            <ul class="chat">');

    PTSQL.CloseRS();
    PTSQL.ExecuteQuery('SELECT * FROM TicketData WHERE TicketID='+ticketid+' ORDER BY ID ASC');

    repeat
      if PTSQL.GetColumn('Type') = '2' then
      begin
        Response.Write('<li class="left clearfix">');
        Response.Write('                                    <span class="chat-img pull-left">');
        Response.Write('                                        <img src="imgs/staff.png" alt="User Avatar" class="img-circle" />');
        Response.Write('                                    </span>');
        Response.Write('                                    <div class="chat-body clearfix">');
        Response.Write('                                        <div class="header">');
        Response.Write('                                            <strong class="primary-font">');
        Response.Write('fPT Staff');
        Response.Write('                                            </strong>');
        Response.Write('                                            <small class="pull-right text-muted">');
        Response.Write('                                                <i class="fa fa-clock-o fa-fw"></i> ');
        Response.Write(PTSQL.GetColumn('Date'));
        Response.Write('                                            </small>');
        Response.Write('                                        </div>');
        Response.Write('                                        <p>');
        Response.Write(PTSQL.GetColumn('Message'));
        Response.Write('                                        </p>');
        Response.Write('                                    </div>');
        Response.Write('                                </li>');
      end
      else if PTSQL.GetColumn('Type') = 1 then
      begin
        Response.Write('<li class="left clearfix">');
        Response.Write('                                    <span class="chat-img pull-left">');
        Response.Write('                                        <img src="imgs/user.png" alt="User Avatar" class="img-circle" />');
        Response.Write('                                    </span>');
        Response.Write('                                    <div class="chat-body clearfix">');
        Response.Write('                                        <div class="header">');
        Response.Write('                                            <strong class="primary-font">');
        Response.Write(loginpt);
        Response.Write('                                            </strong>');
        Response.Write('                                            <small class="pull-right text-muted">');
        Response.Write('                                                <i class="fa fa-clock-o fa-fw"></i> ');
        Response.Write(PTSQL.GetColumn('Date'));
        Response.Write('                                            </small>');
        Response.Write('                                        </div>');
        Response.Write('                                        <p>');
        Response.Write(PTSQL.GetColumn('Message'));
        Response.Write('                                        </p>');
        Response.Write('                                    </div>');
        Response.Write('                                </li>');
      end;

      PTSQL.NextRow;

    until PTSQL.GetRS.EOF;

    Response.Write('                            </ul>');
    Response.Write('                        </div>');

    if closed <> 1 then begin
      Response.Write('<div class="panel-footer" style="margin-bottom: 100px">');
      Response.Write('                          <form name=sendreply method=post action="?pag=replyticket&ticketid='+ticketid+'">');
      Response.Write('                            <div class="input-group">');
      Response.Write('                                <input name="message" id="btn-input" type="text" class="form-control input-sm" placeholder="Type your message here..." />');
      Response.Write('                                <span class="input-group-btn">');
      Response.Write('                                    <button type="submit" class="btn btn-warning btn-sm" id="btn-chat">');
      Response.Write('                                        Send');
      Response.Write('                                    </button>');
      Response.Write('                                </span>');
      Response.Write('                            </div>');
      Response.Write('</form>');
      Response.Write('                        </div>');
    end;

    Response.Write('<center><a href="?pag=replyticket&ticketid='+ticketid+'&closeticket"><button class="btn btn-default">Close Ticket</button></a></center>');
  end;

  PTSQL.CloseConnection();
  PTSQL.Free();
end;

procedure TGMPanel.OnReplyTicketPageHandle;
var loginpt, ticketid, message, page : string;
    PTSQL : TSQLPT;
    myDateTime : TDateTime;
    num : Integer;
begin
  ticketid:= Request.QueryString.Item['ticketid'];
  if ticketid = '' then
    Exit;

  PTSQL:= TSQLPT.Create;
  PTSQL.CreateConnection('UserDB');

  num:= Request.QueryString.Count;

  if num > 2 then
  begin
    page:= Request.QueryString.Key[3];

    if page = 'closeticket' then
    begin
      PTSQL.ExecuteQuery('UPDATE TicketList SET State=1 WHERE ID='+ticketid+'',true);

      Response.Write('<div class="alert alert-success alert-dismissable container-fluid" style="top: 0px; left: 0px; right: 0px; margin-top: 20px; position: absolute; width: 400px;"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>');
      Response.Write('Ticket has been closed!</div>');

      Response.Write('<META HTTP-EQUIV="refresh" CONTENT="1; URL=?pag=replyticket&ticketid='+ticketid+'">');
    end
    else if page = 'delticket' then
    begin
      PTSQL.ExecuteQuery('DELETE FROM TicketList WHERE ID='+ticketid+'',true);
      PTSQL.ExecuteQuery('DELETE FROM TicketData WHERE TicketID='+ticketid+'',true);

      Response.Write('<div class="alert alert-success alert-dismissable container-fluid" style="top: 0px; left: 0px; right: 0px; margin-top: 20px; position: absolute; width: 400px;"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>');
      Response.Write('Ticket has been deleted!</div>');

      Response.Write('<META HTTP-EQUIV="refresh" CONTENT="1; URL=?pag=ticketlist">');
    end;
  end
  else begin
    IF Request.Form.Count <= 0 then Exit;

    myDateTime := Now();

    loginpt:= Session.Value['loginpt'];
    message:= Request.Form.Item['message'];

    PTSQL.ExecuteQuery('INSERT INTO TicketData (TicketID,Message,Type,Date) VALUES ('+ticketid+','+QuotedStr(message)+',2,'+QuotedStr(FormatDateTime('c', myDateTime))+')',True);

    Response.Write('<div class="alert alert-success alert-dismissable container-fluid" style="top: 0px; left: 0px; right: 0px; margin-top: 20px; position: absolute; width: 400px;"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>');
    Response.Write('Reply has been sent!</div>');

    Response.Write('<META HTTP-EQUIV="refresh" CONTENT="1; URL=?pag=replyticket&ticketid='+ticketid+'">');
  end;

  PTSQL.CloseConnection();
  PTSQL.Free();
end;

procedure TGMPanel.OnAddNoticePage;
begin
Response.Write('<script type="text/javascript" src="js/nicEdit.js"></script>');
Response.Write('<script type="text/javascript">');
Response.Write('	bkLib.onDomLoaded(function() { nicEditors.allTextAreas() });');
Response.Write('</script>');
Response.Write('<h1 class="page-header">Add Notice</h1>');
Response.Write('');
Response.Write('                        <div class="panel panel-default">');
Response.Write('                            <div class="panel-heading">');
Response.Write('                                Notice');
Response.Write('                            </div>');
Response.Write('                            <div class="panel-body">');
Response.Write('                                 <form name=addnotice method=post action="?pag=addnotice">');
Response.Write('                                    <div class="form-group">');
Response.Write('                                        <label>Title</label>');
Response.Write('                                        <input name="title" class="form-control">');
Response.Write('                                    </div>');
Response.Write('                                    <div class="form-group">');
Response.Write('                                        <label>Message</label>');
Response.Write('                                        <textarea name="message" class="form-control" rows="6"></textarea>');
Response.Write('                                    </div>');
Response.Write('                                    <div class="form-group">');
Response.Write('                                        <label>Type</label>');
Response.Write('                                        <select class="form-control" name="type">');
Response.Write('                                            <option value="0">Notice</option>');
Response.Write('                                            <option value="1">Event</option>');
Response.Write('                                            <option value="2">Patch Log</option>');
Response.Write('                                            <option value="3">Maintenance</option>');
Response.Write('                                        </select>');
Response.Write('                                    </div>');
Response.Write('                                    <button type="submit" class="btn btn-default">Add Notice</button>');
Response.Write('                                    <button type="reset" class="btn btn-default">Reset Fields</button>');
Response.Write('                                </form>');
Response.Write('                            </div>');
Response.Write('                        </div>');
end;

procedure TGMPanel.OnAddNoticePageHandle;
var PTSQL : TSQLPT;
    title, message, typen : string;
begin
  IF Request.Form.Count <= 0 then Exit;

  title:= Request.Form.Item['title'];
  message:= Request.Form.Item['message'];
  typen:= Request.Form.Item['type'];

  PTSQL:= TSQLPT.Create;
  PTSQL.CreateConnection('WebDB');

  PTSQL.ExecuteQuery('INSERT INTO LatestNews (Title,Message,Date,Type) VALUES ('+QuotedStr(title)+','+QuotedStr(message)+','+QuotedStr(FormatDateTime('c', date))+','+typen+')',True);

  Response.Write('<div class="alert alert-success alert-dismissable container-fluid" style="top: 0px; left: 0px; right: 0px; margin-top: 20px; position: absolute; width: 400px;"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>');
  Response.Write('Notice Added!</div>');

  PTSQL.CloseConnection;
  PTSQL.Free;

end;

procedure TGMPanel.OnListAllNoticesPage;
var PTSQL : TSQLPT;
    num : Integer;
    typenew : string;
begin
  PTSQL:= TSQLPT.Create;
  PTSQL.CreateConnection('WebDB');

  PTSQL.ExecuteQuery('SELECT * FROM LatestNews ORDER BY ID DESC');

  Response.Write('<h1 class="page-header">Notices</h1>');
  Response.Write('<div class="panel panel-default">');
  Response.Write('                        <div class="panel-heading">');
  Response.Write('                            List News');
  Response.Write('                        </div>');
  Response.Write('                        <!-- /.panel-heading -->');
  Response.Write('                        <div class="panel-body">');
  Response.Write('                            <div class="dataTable_wrapper">');
  Response.Write('                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">');
  Response.Write('                                    <thead>');
  Response.Write('                                        <tr>');
  Response.Write('                                            <th>#</th>');
  Response.Write('                                            <th>Title</th>');
  Response.Write('                                            <th>Type</th>');
  Response.Write('                                            <th>Date</th>');
  Response.Write('                                            <th>Action</th>');
  Response.Write('                                        </tr>');
  Response.Write('                                    </thead>');
  Response.Write('                                    <tbody>');

  num:= 1;

  if PTSQL.RecordCount > 0 then begin
    repeat
      if PTSQL.GetColumn('Type') = 0 then
        typenew:= 'Notice'
      else if PTSQL.GetColumn('Type') = 1 then
        typenew:= 'Event'
      else if PTSQL.GetColumn('Type') = 2 then
        typenew:= 'Patch'
      else
        typenew:= 'Maintenance';

      Response.Write('      <tr>');
      Response.Write('        <td>');
      Response.Write(num);
      Response.Write('        </td>');
      Response.Write('        <td>');
      Response.Write(PTSQL.GetColumn('Title'));
      Response.Write('        </td>');
      Response.Write('        <td>');
      Response.Write(typenew);
      Response.Write('        </td>');
      Response.Write('        <td>');
      Response.Write(PTSQL.GetColumn('Date'));
      Response.Write('        </td>');
      Response.Write('        <td>');
      Response.Write('<a title="Edit Notice" href="?pag=editnotice&id='+VarToStr(PTSQL.GetColumn('ID'))+'"><i class="fa fa-edit fa-fw"></i></a>');
      Response.Write('<a title="Delete Notice" href="?pag=delnotice&id='+VarToStr(PTSQL.GetColumn('ID'))+'"><i style="cursor: pointer" class="fa fa-times-circle fa-fw"></i></a>');
      Response.Write('        </td>');
      Response.Write('      </tr>');

      num:= num + 1;

      //Next row
      PTSQL.NextRow;

    until PTSQL.GetRS.EOF;
  end;

  PTSQL.CloseConnection();
  PTSQL.Free;
end;

procedure TGMPanel.OnListAllNoticesPageHandle;
var pag, noticeid, title, message, typen : string;
    PTSQL : TSQLPT;
begin
  pag:= Request.QueryString.Item['pag'];
  noticeid:= Request.QueryString.Item['id'];

  PTSQL:= TSQLPT.Create;
  PTSQL.CreateConnection('WebDB');

  if pag = 'delnotice' then begin
    PTSQL.ExecuteQuery('DELETE FROM LatestNews WHERE ID='+noticeid+'',true);

    Response.Write('<div class="alert alert-success alert-dismissable container-fluid" style="top: 0px; left: 0px; right: 0px; margin-top: 20px; position: absolute; width: 400px;"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>');
    Response.Write('The notice was deleted!</div>');

    Response.Write('<META HTTP-EQUIV="refresh" CONTENT="1; URL=?pag=listnotices">');
  end
  else if pag = 'editnotice' then begin
    PTSQL.ExecuteQuery('SELECT * FROM LatestNews WHERE ID='+noticeid+'');

    Response.Write('<script type="text/javascript" src="js/nicEdit.js"></script>');
    Response.Write('<script type="text/javascript">');
    Response.Write('	bkLib.onDomLoaded(function() { nicEditors.allTextAreas() });');
    Response.Write('</script>');

    Response.Write('<h1 class="page-header">Edit Notice</h1>');

    Response.Write('                        <div class="panel panel-default">');
    Response.Write('                            <div class="panel-heading">');
    Response.Write('                                Notice');
    Response.Write('                            </div>');
    Response.Write('                            <div class="panel-body">');
    Response.Write('                                 <form name=addnotice method=post action="?pag=editnotice&id='+VarToStr(PTSQL.GetColumn('ID'))+'">');
    Response.Write('                                    <div class="form-group">');
    Response.Write('                                        <label>Title</label>');
    Response.Write('                                        <input name="title" class="form-control" value="'+VarToStr(PTSQL.GetColumn('Title'))+'">');
    Response.Write('                                    </div>');
    Response.Write('                                    <div class="form-group">');
    Response.Write('                                        <label>Message</label>');
    Response.Write('                                        <textarea name="message" class="form-control" rows="6">'+VarToStr(PTSQL.GetColumn('Message'))+'</textarea>');
    Response.Write('                                    </div>');
    Response.Write('                                    <div class="form-group">');
    Response.Write('                                        <label>Type</label>');
    Response.Write('                                        <select class="form-control" name="type">');
    if PTSQL.GetColumn('Type') = 0 then
      Response.Write('                                            <option value="0" selected>Notice</option>')
    else
      Response.Write('                                            <option value="0">Notice</option>');
      
    if PTSQL.GetColumn('Type') = 1 then
      Response.Write('                                            <option value="1" selected>Event</option>')
    else
      Response.Write('                                            <option value="1">Event</option>');

    if PTSQL.GetColumn('Type') = 2 then
      Response.Write('                                            <option value="2" selected>Patch Log</option>')
    else
      Response.Write('                                            <option value="2">Patch Log</option>');

    if PTSQL.GetColumn('Type') = 3 then
      Response.Write('                                            <option value="3" selected>Maintenance</option>')
    else
      Response.Write('                                            <option value="3">Maintenance</option>');

    Response.Write('                                        </select>');
    Response.Write('                                    </div>');
    Response.Write('                                    <button type="submit" class="btn btn-default">Save Notice</button>');
    Response.Write('                                </form>');
    Response.Write('                            </div>');
    Response.Write('                        </div>');

    PTSQL.CloseRS();

    IF Request.Form.Count <= 0 then Exit;

    title:= Request.Form.Item['title'];
    message:= Request.Form.Item['message'];
    typen:= Request.Form.Item['type'];

    PTSQL.ExecuteQuery('UPDATE LatestNews SET Title='+QuotedStr(title)+',Message='+QuotedStr(message)+',Type='+typen+' WHERE ID='+noticeid+'',true);

    Response.Write('<div class="alert alert-success alert-dismissable container-fluid" style="top: 0px; left: 0px; right: 0px; margin-top: 20px; position: absolute; width: 400px;"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>');
    Response.Write('The notice was edited!</div>');

    Response.Write('<META HTTP-EQUIV="refresh" CONTENT="1; URL=?pag=listnotices">');
  end;

  PTSQL.CloseConnection;
  PTSQL.Free;

end;

procedure TGMPanel.OnViewUsersOnline;
var PTSQL : TSQLPT;
    num, jobcode : Integer;
    Result : string;
begin
  Response.Write('<h1 class="page-header">Users Online</h1>');

  PTSQL:= TSQLPT.Create;
  PTSQL.CreateConnection('UserDB');

  PTSQL.ExecuteQuery('SELECT * FROM CharacterInfo WHERE IsOnline=1');

  if PTSQL.RecordCount > 0 then
  begin
      Response.Write('<div class="table-responsive">');
      Response.Write('                                <table class="table table-hover">');
      Response.Write('                                    <thead>');
      Response.Write('                                        <tr>');
      Response.Write('                                            <th>#</th>');
      Response.Write('                                            <th>Account</th>');
      Response.Write('                                            <th>Character Name</th>');
      Response.Write('                                            <th>Level</th>');
      Response.Write('                                            <th>Class</th>');
      Response.Write('                                            <th>Action</th>');
      Response.Write('                                        </tr>');
      Response.Write('                                    </thead>');
      Response.Write('                                    <tbody>');

      num:= 1;

      repeat
        jobcode:= StrToInt(PTSQL.GetColumn('JobCode'));

        case jobcode of
          1:
            Result:= 'Fighter';
          2:
            Result:= 'Mechanician';
          3:
            Result:= 'Archer';
          4:
            Result:= 'Pikeman';
          5:
            Result:= 'Atalanta';
          6:
            Result:= 'Knight';
          7:
            Result:= 'Magician';
          8:
            Result:= 'Priestess';
          9:
            Result:= 'Assassin';
          10:
            Result:= 'Shaman';
        end;

        Response.Write('      <tr>');
        Response.Write('        <td>');
        Response.Write(num);
        Response.Write('        </td>');
        Response.Write('        <td>');
        Response.Write(PTSQL.GetColumn('UserID'));
        Response.Write('        </td>');
        Response.Write('        <td>');
        Response.Write(PTSQL.GetColumn('Name'));
        Response.Write('        </td>');
        Response.Write('        <td>');
        Response.Write(PTSQL.GetColumn('Level'));
        Response.Write('        </td>');
        Response.Write('        <td>');
        Response.Write(result);
        Response.Write('        </td>');
        Response.Write('<td>');
        Response.Write('<a title="Edit Account" href="?pag=edituser&account='+PTSQL.GetColumn('UserID')+'"><i class="fa fa-edit fa-fw"></i></a>');
        Response.Write('</td>');
        Response.Write('      </tr>');

        num:= num + 1;

        //Next row
        PTSQL.NextRow;
      until PTSQL.GetRS.EOF;

    Response.Write('</tbody>');
    Response.Write('                                </table>');
    Response.Write('                            </div>');
  end;

  PTSQL.CloseConnection();
  PTSQL.Free;
end;

procedure TGMPanel.OnSetMaintenancePage;
begin
  Response.Write('                        <h1 class="page-header">Next Maintenance</h1>');
  Response.Write('');
  Response.Write('                        <div class="panel panel-default">');
  Response.Write('                            <div class="panel-heading">');
  Response.Write('                                Set Maintenance');
  Response.Write('                            </div>');
  Response.Write('                            <div class="panel-body">');
  Response.Write('                                <form name=setmaint method=post action="?pag=nextmaint">');
  Response.Write('                                    <div class="form-group">');
  Response.Write('                                        <label>Maintenance Date:</label>');
  Response.Write('                                        <input name="date" class="form-control">');
  Response.Write('                                    </div>');
  Response.Write('                                    <button type="submit" class="btn btn-default">Save</button>');
  Response.Write('                                    <button type="reset" class="btn btn-default">Reset Fields</button>');
  Response.Write('                                </form>');
  Response.Write('                            </div>');
  Response.Write('                        </div>  ');
end;

procedure TGMPanel.OnSetMaintenancePageHandle;
var PTSQL : TSQLPT;
    datemaint : string;
begin
  IF Request.Form.Count <= 0 then Exit;

  datemaint:= Request.Form.Item['date'];

  PTSQL:= TSQLPT.Create;
  PTSQL.CreateConnection('WebDB');

  PTSQL.ExecuteQuery('INSERT INTO NextMaintenance (Message) VALUES ('+QuotedStr(datemaint)+')',true);

  Response.Write('<div class="alert alert-success alert-dismissable container-fluid" style="top: 0px; left: 0px; right: 0px; margin-top: 20px; position: absolute; width: 400px;"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>');
  Response.Write('The next maintenance was setted!</div>');

  PTSQL.CloseConnection;
  PTSQL.Free;
  
end;

procedure TGMPanel.OnCharacterPage;
var PTSQL: TSQLPT;
    result : string;
    jobcode : Integer;
begin
  PTSQL:= TSQLPT.Create;
  PTSQL.CreateConnection('UserDB');

  PTSQL.ExecuteQuery('SELECT * FROM CharacterInfo');

  Response.Write('                        <h1 class="page-header">Character List</h1>');
  Response.Write('                        <div class="panel panel-default">');
  Response.Write('                        <!-- /.panel-heading -->');
  Response.Write('                        <div class="panel-body">');
  Response.Write('                            <div class="dataTable_wrapper">');
  Response.Write('                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">');
  Response.Write('                                    <thead>');
  Response.Write('                                        <tr>');
  Response.Write('                                            <th>Account</th>');
  Response.Write('                                            <th>Character Name</th>');
  Response.Write('                                            <th>Class</th>');
  Response.Write('                                            <th>Level</th>');
  Response.Write('                                            <th>Last Seen Date</th>');
  Response.Write('                                            <th>Status</th>');
  Response.Write('                                            <th>Action</th>');
  Response.Write('                                        </tr>');
  Response.Write('                                    </thead>');
  Response.Write('                                    <tbody>');

 repeat

    jobcode:= StrToInt(PTSQL.GetColumn('JobCode'));

    Result:= 'None';
    case jobcode of
      1:
        Result:= 'Fighter';
      2:
        Result:= 'Mechanician';
      3:
        Result:= 'Archer';
      4:
        Result:= 'Pikeman';
      5:
        Result:= 'Atalanta';
      6:
        Result:= 'Knight';
      7:
        Result:= 'Magician';
      8:
        Result:= 'Priestess';
      9:
        Result:= 'Assassin';
      10:
        Result:= 'Shaman';
    end;

    Response.Write('<tr>');
    Response.Write('<td>'+VarToStr(PTSQL.GetColumn('UserID'))+'</td>');
    Response.Write('<td>'+VarToStr(PTSQL.GetColumn('Name'))+'</td>');
    Response.Write('<td>'+Result+'</td>');
    Response.Write('<td>'+VarToStr(PTSQL.GetColumn('Level'))+'</td>');
    Response.Write('<td>'+VarToStr(PTSQL.GetColumn('LastSeenDate'))+'</td>');

    if PTSQL.GetColumn('IsOnline') = '1' then
      Response.Write('<td>Online</td>')
    else
      Response.Write('<td>Offline</td>');

    Response.Write('<td>');
    Response.Write('<a title="Edit Account" href="?pag=edituser&account='+PTSQL.GetColumn('UserID')+'"><i class="fa fa-edit fa-fw"></i></a>');
    Response.Write('</td>');

    Response.Write('</tr>');

    //Next row
    PTSQL.NextRow;
  until PTSQL.GetRS.EOF;

  PTSQL.CloseConnection();
  PTSQL.Free();

  Response.Write('                                    </tbody>');
  Response.Write('                                </table>');
  Response.Write('                            </div>');
  Response.Write('                            <!-- /.table-responsive -->');
  Response.Write('                        </div>');
  Response.Write('                        <!-- /.panel-body -->');
  Response.Write('                    </div>');
end;

procedure TGMPanel.OnSeeLogsCharacter;
var account, logtype : string;
    PTSQL : TSQLPT;
    num : Integer;
begin

  account:= Request.QueryString.Item['account'];
  if account = '' then
    Exit;

  logtype:= Request.QueryString.Item['type'];

  PTSQL:= TSQLPT.Create;
  PTSQL.CreateConnection('LogDB');

  Response.Write('<div class="panel panel-default">');
  Response.Write('                        <div class="panel-heading">');
  Response.Write('                           Character Logs');
  Response.Write('<div class="pull-right">');
  Response.Write('                                <div class="btn-group">');
  Response.Write('                                    <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">');
  Response.Write('                                        Category');
  Response.Write('                                        <span class="caret"></span>');
  Response.Write('                                    </button>');
  Response.Write('                                    <ul class="dropdown-menu pull-right" role="menu">');
  Response.Write('                                        <li><a href="?pag=seelogsch&type=0&account='+account+'">Character Log</a></li>');
  Response.Write('                                        <li><a href="?pag=seelogsch&type=1&account='+account+'">Cheat Log</a></li>');
  Response.Write('                                        <li><a href="?pag=seelogsch&type=2&account='+account+'">Inventory Log</a></li>');
  Response.Write('                                        <li><a href="?pag=seelogsch&type=3&account='+account+'">Item Log</a></li>');
  Response.Write('                                    </ul>');
  Response.Write('                                </div>');
  Response.Write('                            </div>');
  Response.Write('                        </div>');
  Response.Write('                        <!-- /.panel-heading -->');
  Response.Write('                        <div class="panel-body">');
  Response.Write('                            <div class="dataTable_wrapper">');

  if logtype = '0' then
  begin
      PTSQL.ExecuteQuery('SELECT TOP 1000 * FROM CharacterLog WHERE Description LIKE '+QuotedStr('%'+account+'%')+' ORDER BY ID DESC');

      if PTSQL.RecordCount > 0 then begin
        Response.Write('                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">');
        Response.Write('                                    <thead>');
        Response.Write('                                        <tr>');
        Response.Write('                                            <th>#</th>');
        Response.Write('                                            <th>IP</th>');
        Response.Write('                                            <th>Description</th>');
        Response.Write('                                            <th>Date</th>');
        Response.Write('                                        </tr>');
        Response.Write('                                    </thead>');
        Response.Write('                                    <tbody>');

        num:= 1;

        repeat
          Response.Write('                                        <tr class="odd gradeX">');
          Response.Write('                                            <td width="5%">'+IntToStr(num)+'</td>');
          Response.Write('                                            <td width="13%">'+VarToStr(PTSQL.GetColumn('IP'))+'</td>');
          Response.Write('                                            <td>'+VarToStr(PTSQL.GetColumn('Description'))+'</td>');
          Response.Write('                                            <td class="center" width="13%">'+VarToStr(PTSQL.GetColumn('Date'))+'</td>');
          Response.Write('                                        </tr>');

          num:= num + 1;
          PTSQL.NextRow;
        until PTSQL.GetRS.EOF;

        Response.Write('                                    </tbody>');
        Response.Write('                                </table>');
      end;
  end
  else if logtype = '1' then
  begin
      PTSQL.ExecuteQuery('SELECT TOP 1000 * FROM CheatLog WHERE Description LIKE '+QuotedStr('%'+account+'%')+' ORDER BY ID DESC');

      if PTSQL.RecordCount > 0 then begin
        Response.Write('                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">');
        Response.Write('                                    <thead>');
        Response.Write('                                        <tr>');
        Response.Write('                                            <th>#</th>');
        Response.Write('                                            <th>IP</th>');
        Response.Write('                                            <th>Action</th>');
        Response.Write('                                            <th>Description</th>');
        Response.Write('                                            <th>Date</th>');
        Response.Write('                                        </tr>');
        Response.Write('                                    </thead>');
        Response.Write('                                    <tbody>');

        num:= 1;

        repeat
          Response.Write('                                        <tr class="odd gradeX">');
          Response.Write('                                            <td width="5%">'+IntToStr(num)+'</td>');
          if PTSQL.GetColumn('Action') = 0 then
             Response.Write('                                            <td width="6%">Warn.</td>')
          else if PTSQL.GetColumn('Action') = 1 then
             Response.Write('                                            <td width="6%">DC</td>')
          else
            Response.Write('                                            <td width="6%">Ban</td>');
          Response.Write('                                            <td width="13%">'+VarToStr(PTSQL.GetColumn('IP'))+'</td>');
          Response.Write('                                            <td>'+VarToStr(PTSQL.GetColumn('Description'))+'</td>');
          Response.Write('                                            <td class="center" width="13%">'+VarToStr(PTSQL.GetColumn('Date'))+'</td>');
          Response.Write('                                        </tr>');

          num:= num + 1;
          PTSQL.NextRow;
        until PTSQL.GetRS.EOF;

        Response.Write('                                    </tbody>');
        Response.Write('                                </table>');
      end;
  end
  else if logtype = '2' then
  begin
      PTSQL.ExecuteQuery('SELECT TOP 1000 * FROM InventoryItemLog WHERE CharName='+QuotedStr(account)+' ORDER BY ID DESC');

      if PTSQL.RecordCount > 0 then begin
        Response.Write('                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">');
        Response.Write('                                    <thead>');
        Response.Write('                                        <tr>');
        Response.Write('                                            <th>#</th>');
        Response.Write('                                            <th>Action</th>');
        Response.Write('                                            <th>Item Name</th>');
        Response.Write('                                            <th>Code</th>');
        Response.Write('                                            <th>Date</th>');
        Response.Write('                                        </tr>');
        Response.Write('                                    </thead>');
        Response.Write('                                    <tbody>');

        num:= 1;

        repeat
          Response.Write('                                        <tr class="odd gradeX">');
          Response.Write('                                            <td width="5%">'+IntToStr(num)+'</td>');
          Response.Write('                                            <td width="10%">'+VarToStr(PTSQL.GetColumn('Action'))+'</td>');
          Response.Write('                                            <td width="20%">'+VarToStr(PTSQL.GetColumn('ItemName'))+'</td>');
          Response.Write('                                            <td>@'+VarToStr(PTSQL.GetColumn('Code1'))+'@'+VarToStr(PTSQL.GetColumn('Code2'))+'</td>');
          Response.Write('                                            <td class="center" width="13%">'+VarToStr(PTSQL.GetColumn('Date'))+'</td>');
          Response.Write('                                        </tr>');

          num:= num + 1;
          PTSQL.NextRow;
        until PTSQL.GetRS.EOF;

        Response.Write('                                    </tbody>');
        Response.Write('                                </table>');
      end;
  end
  else if logtype = '3' then
  begin
      PTSQL.ExecuteQuery('SELECT TOP 1000 * FROM ItemLog WHERE Description LIKE '+QuotedStr('%'+account+'%')+' ORDER BY ID DESC');

      if PTSQL.RecordCount > 0 then begin
        Response.Write('                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">');
        Response.Write('                                    <thead>');
        Response.Write('                                        <tr>');
        Response.Write('                                            <th>#</th>');
        Response.Write('                                            <th>IP</th>');
        Response.Write('                                            <th>Description</th>');
        Response.Write('                                            <th>Code</th>');
        Response.Write('                                            <th>Date</th>');
        Response.Write('                                        </tr>');
        Response.Write('                                    </thead>');
        Response.Write('                                    <tbody>');

        num:= 1;

        repeat
          Response.Write('                                        <tr class="odd gradeX">');
          Response.Write('                                            <td width="5%">'+IntToStr(num)+'</td>');
          Response.Write('                                            <td width="13%">'+VarToStr(PTSQL.GetColumn('IP'))+'</td>');
          Response.Write('                                            <td>'+VarToStr(PTSQL.GetColumn('Description'))+'</td>');
          Response.Write('                                            <td>@'+VarToStr(PTSQL.GetColumn('Code1'))+'@'+VarToStr(PTSQL.GetColumn('Code2'))+'</td>');
          Response.Write('                                            <td class="center" width="13%">'+VarToStr(PTSQL.GetColumn('Date'))+'</td>');
          Response.Write('                                        </tr>');

          num:= num + 1;
          PTSQL.NextRow;
        until PTSQL.GetRS.EOF;

        Response.Write('                                    </tbody>');
        Response.Write('                                </table>');
      end;
  end;

  Response.Write('                            </div>');
  Response.Write('                            <!-- /.table-responsive -->');
  Response.Write('                        </div>');
  Response.Write('                        <!-- /.panel-body -->');
  Response.Write('                    </div>');

  PTSQL.CloseConnection;
  PTSQL.Free;
end;

initialization
  TAutoObjectFactory.Create(ComServer, TGMPanel, Class_GMPanel,
    ciMultiInstance, tmBoth);
end.
