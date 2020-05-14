unit feffects;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ComCtrls{, uxtheme, darkmodeclasses};

type

  { Tfreffect }

  Tfreffect = class(TForm)
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button2: TButton;
    Button20: TButton;
    Button21: TButton;
    Button22: TButton;
    Button23: TButton;
    Button24: TButton;
    Button25: TButton;
    Button26: TButton;
    Button27: TButton;
    Button28: TButton;
    Button29: TButton;
    Button3: TButton;
    Button30: TButton;
    Button31: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    TrackBar1: TTrackBar;
    TrackBar2: TTrackBar;
    TrackBar3: TTrackBar;
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure Button25Click(Sender: TObject);
    procedure Button26Click(Sender: TObject);
    procedure Button27Click(Sender: TObject);
    procedure Button28Click(Sender: TObject);
    procedure Button29Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button30Click(Sender: TObject);
    procedure Button31Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  freffect: Tfreffect;

implementation

uses fmain;

{$R *.lfm}

{ Tfreffect }

procedure Tfreffect.Button1Click(Sender: TObject);
begin
  filterimagen(1);
end;

procedure Tfreffect.Button20Click(Sender: TObject);
begin
  filterimagen(8);
end;

procedure Tfreffect.Button21Click(Sender: TObject);
begin
  filterimagen(11);
end;

procedure Tfreffect.Button22Click(Sender: TObject);
begin
  filterimagen(12);
end;

procedure Tfreffect.Button23Click(Sender: TObject);
begin
  filterimagen(9);
end;

procedure Tfreffect.Button24Click(Sender: TObject);
begin
  filterimagen(10);
end;

procedure Tfreffect.Button25Click(Sender: TObject);
begin
  filterimagen(16);
end;

procedure Tfreffect.Button26Click(Sender: TObject);
begin
  filterimagen(21,-10);
end;

procedure Tfreffect.Button27Click(Sender: TObject);
begin
  filterimagen(21,10);
end;

procedure Tfreffect.Button28Click(Sender: TObject);
begin
  filterimagen(22,-10);
end;

procedure Tfreffect.Button29Click(Sender: TObject);
begin
  filterimagen(22,10);
end;

procedure Tfreffect.Button10Click(Sender: TObject);
begin
  efectimagen(8);
end;

procedure Tfreffect.Button11Click(Sender: TObject);
begin
  filterimagen(15);
end;

procedure Tfreffect.Button12Click(Sender: TObject);
begin
  filterimagen(14);
end;

procedure Tfreffect.Button13Click(Sender: TObject);
begin
  filterimagen(13);
end;

procedure Tfreffect.Button14Click(Sender: TObject);
begin
  filterimagen(2);
end;

procedure Tfreffect.Button15Click(Sender: TObject);
begin
  filterimagen(3);
end;

procedure Tfreffect.Button16Click(Sender: TObject);
begin
  filterimagen(4);
end;

procedure Tfreffect.Button17Click(Sender: TObject);
begin
  filterimagen(5);
end;

procedure Tfreffect.Button18Click(Sender: TObject);
begin
  filterimagen(6);
end;

procedure Tfreffect.Button19Click(Sender: TObject);
begin
  filterimagen(7);
end;

procedure Tfreffect.Button2Click(Sender: TObject);
begin
  efectimagen(12,freffect.TrackBar1.Position);
end;

procedure Tfreffect.Button30Click(Sender: TObject);
begin
  filterimagen(23,0.8);
end;

procedure Tfreffect.Button31Click(Sender: TObject);
begin
  filterimagen(23,1.2);
end;

procedure Tfreffect.Button3Click(Sender: TObject);
begin
  efectimagen(13,freffect.TrackBar2.Position);
end;

procedure Tfreffect.Button4Click(Sender: TObject);
begin
  efectimagen(14,freffect.TrackBar3.Position);
end;

procedure Tfreffect.Button5Click(Sender: TObject);
begin
  if Assigned(flist) and (flist.Count>0) then
    loadpicture(carpeta+flist[ifile]);
end;

procedure Tfreffect.Button6Click(Sender: TObject);
begin
  efectimagen(5);
end;

procedure Tfreffect.Button7Click(Sender: TObject);
begin
  efectimagen(6);
end;

procedure Tfreffect.Button8Click(Sender: TObject);
begin
  efectimagen(7);
end;

procedure Tfreffect.Button9Click(Sender: TObject);
begin
  efectimagen(9);
end;

procedure Tfreffect.FormActivate(Sender: TObject);
var
  i:integer;
begin
  for i:=0 to freffect.ControlCount-1 do
    freffect.Controls[i].Enabled:=not frmain.Image1.Picture.Bitmap.Empty;
end;

procedure Tfreffect.FormCreate(Sender: TObject);
//var
  //i,x:integer;
begin
  {AllowDarkModeForApp(true);
  AllowDarkModeForWindow(freffect.Handle,true);
  UxTheme.SetWindowTheme(freffect.Handle,'DarkMode_Explorer',nil);
  for i:=0 to freffect.ControlCount-1 do
  begin
    case freffect.Controls[i].ToString of
      'TButton':UxTheme.SetWindowTheme((freffect.Controls[i] as TButton).Handle,'DarkMode_Explorer',nil);
      'TToolBar':UxTheme.SetWindowTheme((freffect.Controls[i] as TToolBar).Handle,'DarkMode_Explorer',nil);
      'TStatusBar':UxTheme.SetWindowTheme((freffect.Controls[i] as TStatusBar).Handle,'DarkMode_Explorer',nil);
      //'TShellTreeView':UxTheme.SetWindowTheme((frmain.Controls[i] as TShellTreeView).Handle,'DarkMode_Explorer',nil);
      //'TSplitter':UxTheme.SetWindowTheme((freffect.Controls[i] as TSplitter).Handle,'DarkMode_Explorer',nil);
      'TScrollBox':UxTheme.SetWindowTheme((freffect.Controls[i] as TScrollBox).Handle,'DarkMode_Explorer',nil);
      'TTrackBar':UxTheme.SetWindowTheme((freffect.Controls[i] as TTrackBar).Handle,'DarkMode_Explorer',nil);

      'TGroupBox':
        begin
          UxTheme.SetWindowTheme((freffect.Controls[i] as TGroupBox).Handle,'DarkMode_Explorer',nil);
          for x:=0 to (freffect.Controls[i] as TGroupBox).ControlCount-1 do
          begin
            case (freffect.Controls[i] as TGroupBox).Controls[x].ToString of
              'TButton': UxTheme.SetWindowTheme(((freffect.Controls[i] as TGroupBox).Controls[x] as TButton).Handle,'DarkMode_Explorer',nil);
              'TLabel': ;
              else
                ShowMessage((freffect.Controls[i] as TGroupBox).Controls[x].ToString);
            end;
          end;
        end;
      else
        ShowMessage(freffect.Controls[i].ToString);
    end;
  end;}
end;


end.

