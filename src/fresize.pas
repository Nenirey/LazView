unit fresize;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, Forms, StdCtrls,
  ButtonPanel, Spin;

type

  { Tfrresize }

  Tfrresize = class(TForm)
    ButtonPanel1: TButtonPanel;
    Label1: TLabel;
    Label2: TLabel;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    ToggleBox1: TToggleBox;
    procedure SpinEdit1Change(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frresize: Tfrresize;
  okresize:boolean=false;
  psw:Longint=1;
  psh:Longint=1;
implementation
uses fmain;
{$R *.lfm}

{ Tfrresize }


procedure Tfrresize.SpinEdit1Change(Sender: TObject);
var
  nsh:Longint;
begin
  //psw=ancho actual, psh=alto actual
  psw:=realimgwidth;
  if (frresize.ToggleBox1.State=cbChecked) then
  begin
    frresize.SpinEdit2.OnChange:=nil;
    //nsh=
    nsh:=frresize.SpinEdit1.Value*psh div psw;
    frresize.SpinEdit2.Value:=nsh;
    frresize.SpinEdit2.OnChange:=@frresize.SpinEdit2Change;
  end;
end;


procedure Tfrresize.SpinEdit2Change(Sender: TObject);
var
  nsh:Longint;
begin
  psh:=realimgheight;
  if (frresize.ToggleBox1.State=cbChecked) then
  begin
    frresize.SpinEdit1.OnChange:=nil;
    nsh:=frresize.SpinEdit2.Value*psw div psh;
    frresize.SpinEdit1.Value:=nsh;
    frresize.SpinEdit1.OnChange:=@frresize.SpinEdit1Change;
  end;
end;

procedure Tfrresize.FormCreate(Sender: TObject);
begin
  okresize:=false;
  psw:=frresize.SpinEdit1.Value;
  psh:=frresize.SpinEdit2.Value;
end;

procedure Tfrresize.FormShow(Sender: TObject);
begin
  okresize:=false;
  psw:=frresize.SpinEdit1.Value;
  psh:=frresize.SpinEdit2.Value;
end;

procedure Tfrresize.OKButtonClick(Sender: TObject);
begin
okresize:=true;
frresize.Close;
end;

end.

