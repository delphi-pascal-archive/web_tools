unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OleCtrls, AgentObjects_TLB, ExtCtrls, ComCtrls, ToolWin, StdCtrls, Variants,
  Menus, ShellAPI;
const MyTrayIcon = WM_USER + 1;
type
  TForm1 = class(TForm)
    Agent1: TAgent;
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Memo1: TMemo;
    GroupBox1: TGroupBox;
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    ListBox1: TListBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Button3: TButton;
    Button2: TButton;
    Edit3: TEdit;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    MainMenu1: TMainMenu;
    A1: TMenuItem;
    New: TMenuItem;
    Save: TMenuItem;
    Exit: TMenuItem;
    N5: TMenuItem;
    zap: TMenuItem;
    pause: TMenuItem;
    priview: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    Memo2: TMemo;
    SaveDialog1: TSaveDialog;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Agent1Click(Sender: TObject; const CharacterID: WideString;
      Button, Shift, x, y: Smallint);
    procedure FormDestroy(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure NewClick(Sender: TObject);
    procedure zapClick(Sender: TObject);
    procedure ExitClick(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure priviewClick(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure pauseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
  private
    { Private declarations }
   Req: IAgentCtlRequest;
   Character: IAgentCtlCharacterEx;
   AnimationNames: IAgentCtlAnimationNames;
   procedure AgentAnimationEnum;
   procedure TrIcon(var a: TMessage); message MyTrayIcon;
  public
  X,Y: Integer;
  rec:Boolean;
  put:String;
{ Public declarations }
  end;
var
  Form1: TForm1;
  NID: TNotifyIconData;

implementation

{$R *.DFM}

uses ActiveX;

procedure TForm1.TrIcon(var a: TMessage);
var P: TPoint;
begin
case a.lParam of
WM_LBUTTONDBLCLK:
begin
SetForegroundWindow(Handle);
end;
WM_RBUTTONDOWN:
begin
GetCursorPos(P);
PopupMenu1.Popup(P.X, P.Y);
end;
end;
end;


procedure TForm1.FormCreate(Sender: TObject);
begin
with NID do
begin
cbSize := SizeOf(TNotifyIconData);
Wnd := Handle;
uId := 1;
uFlags := NIF_ICON or NIF_MESSAGE or NIF_TIP;
uCallbackMessage := MyTrayIcon;
hIcon := Application.Icon.Handle;
szTip := 'Web Tools';
end;
Shell_NotifyIcon(NIM_ADD, @NID);
Agent1.Characters.Load('Char', 'merlin.acs');
 Character := Agent1.Characters.Character('Char') as IAgentCtlCharacterEx;
 AgentAnimationEnum;
 Form1.Button6.Click;
 Memo1.Lines.Add(Character.Description);
 Memo1.Lines.Add('Version ' + Character.Get_Version);
 Form1.Save.Enabled:=false;
 Form1.zap.Enabled:=False;
 Form1.pause.Enabled:=false;
 Form1.priview.Enabled:=False;
end;

procedure TForm1.ToolButton1Click(Sender: TObject);
begin
 Req := Character.Show(0);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
X := StrToInt(Edit1.Text);
Y := StrToInt(Edit2.Text);
Character.MoveTo(X,Y,1);
if rec=true then
Form1.Memo2.Lines.Add('Char.MoveTo '+IntToStr(X)+','+IntToStr(Y));
end;

procedure TForm1.AgentAnimationEnum;
var
AEnum: IEnumVariant;
Fetch: Cardinal;
V: OleVariant;
begin
 AnimationNames := Character.AnimationNames;
 AEnum := AnimationNames.Enum as IEnumVariant;
 AEnum.Reset;
 ListBox1.Items.Clear;
Repeat
 AEnum.Next(1,V,Fetch);
  If VarToStr(V) <> EmptyStr Then
   ListBox1.Items.Add(V);
until Fetch=0;

end;

procedure TForm1.ListBox1Click(Sender: TObject);
begin
ListBox1.Hint := ListBox1.Items[Listbox1.ItemIndex];
Req := Character.Play(WideString(ListBox1.Items[Listbox1.ItemIndex]));
if rec=True Then
 begin
 Form1.Memo2.Lines.Add('Char.Play "'+ListBox1.Hint+'"');
 end;
end;

procedure TForm1.Agent1Click(Sender: TObject;
  const CharacterID: WideString; Button, Shift, x, y: Smallint);
begin
try
 Character.Stop(Req);
finally
 Req := Character.Play('RestPose');
end;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
Agent1.Characters.Unload('Char');
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
Character.Play('Think');
Character.Think('"'+Form1.Edit3.Text+'"');
if rec=true then
begin
Form1.Memo2.Lines.Add('Char.Play "Think"');
Form1.Memo2.Lines.Add('Char.Think "'+Form1.Edit3.Text+'"');
end;
Form1.Edit3.Clear;
end;

procedure TForm1.ToolButton4Click(Sender: TObject);
begin
 Character.Hide(0);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
ToolButton1Click(Sender);
end;


procedure TForm1.Button4Click(Sender: TObject);
begin
Req := Character.Show(0);
if rec=true then
Form1.Memo2.Lines.Add('Char.Show');
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
Req := Character.Hide(0);
if rec=true then
Form1.Memo2.Lines.Add('Char.Hide');
end;

procedure TForm1.Button6Click(Sender: TObject);
var
 PanelPos : TPoint;
 Pos      : TPoint;
 X,Y      : Integer;
begin
 PanelPos.x := Form1.Panel1.Left;
 PanelPos.Y := Form1.Panel1.Top;
 Pos := ClientToScreen(PanelPos);
 X := Pos.X+Form1.Panel1.Width DIV 2  - Character.Width DIV 2;
 Y := Pos.y+Form1.Panel1.Height DIV 2 - Character.Height DIV 2;
 Character.MoveTo(X,Y,1);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
Character.Speak(Form1.Edit3.Text,'');
if rec=true then
Form1.Memo2.Lines.Add('Char.Speak "'+ Form1.Edit3.Text+'"');
Form1.Edit3.Clear;
end;

procedure TForm1.NewClick(Sender: TObject);
begin
Form1.Save.Enabled:=true;
Form1.zap.Enabled:=true;
form1.Memo2.Clear;
form1.Memo2.Lines.Add('<html>');
form1.Memo2.Lines.Add('<script language="VBScript">');
form1.Memo2.Lines.Add('Set Agent = CreateObject("Agent.Control.2")');
form1.Memo2.Lines.Add('If IsObject(Agent) Then');
form1.Memo2.Lines.Add('agent.Connected = True');
form1.Memo2.Lines.Add('Agent.Characters.Load "Default"');
form1.Memo2.Lines.Add('Set Char = Agent.Characters("Default")');
form1.Memo2.Lines.Add('If IsObject(Char) Then');
form1.Memo2.Lines.Add('Char.Show');
end;

procedure TForm1.zapClick(Sender: TObject);
begin
rec:=true;
Form1.zap.Enabled:=false;
Form1.pause.Enabled:=true;
end;



procedure TForm1.ExitClick(Sender: TObject);
begin
Form1.Close;
end;

procedure TForm1.SaveClick(Sender: TObject);
begin
form1.Memo2.Lines.Add('End If');
form1.Memo2.Lines.Add('End If');
form1.Memo2.Lines.Add('</script>');
form1.Memo2.Lines.Add('</html>');
If form1.SaveDialog1.Execute=true then
Form1.Memo2.Lines.SaveToFile(Form1.SaveDialog1.FileName);
Form1.Save.Enabled:=false;
Form1.zap.Enabled:=False;
Form1.pause.Enabled:=false;
Form1.priview.Enabled:=true;
put:=Form1.SaveDialog1.FileName;
end;

procedure TForm1.N12Click(Sender: TObject);
begin
ShowMessage('Программист: Гребенников Александр'+ #13+'e-mail: AleksPRO001@mail.ru');
end;

procedure TForm1.priviewClick(Sender: TObject);
begin
ShellExecute(handle,'open',PChar(put),nil,nil, SW_SHOWNORMAL);
end;

procedure TForm1.N11Click(Sender: TObject);
begin
ShellExecute(handle, nil,PChar('about.txt'),nil,nil, SW_SHOWNORMAL);
end;

procedure TForm1.pauseClick(Sender: TObject);
begin
rec:=false;
Form1.zap.Enabled:=True;
Form1.pause.Enabled:=False;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Shell_NotifyIcon(NIM_DELETE, @NID);
end;

procedure TForm1.N1Click(Sender: TObject);
begin
form1.Visible:=True;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
form1.Visible:=false;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
rec:=true;
Form1.zap.Enabled:=false;
Form1.pause.Enabled:=true;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
rec:=false;
Form1.zap.Enabled:=True;
Form1.pause.Enabled:=False;
end;

end.
