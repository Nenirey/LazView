unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ButtonPanel, Spin;

type

  { TForm2 }

  TForm2 = class(TForm)
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
  Form2: TForm2;
  okresize:boolean=false;
  psw:Longint=1;
  psh:Longint=1;
implementation
uses Unit1;
{$R *.lfm}

{ TForm2 }


procedure TForm2.SpinEdit1Change(Sender: TObject);
var
  nsh:Longint;
begin
  //psw=ancho actual, psh=alto actual
  psw:=realimgwidth;
  if (Form2.ToggleBox1.State=cbChecked) then
  begin
    Form2.SpinEdit2.OnChange:=nil;
    //nsh=
    nsh:=Form2.SpinEdit1.Value*psh div psw;
    Form2.SpinEdit2.Value:=nsh;
    Form2.SpinEdit2.OnChange:=@Form2.SpinEdit2Change;
  end;
end;


procedure TForm2.SpinEdit2Change(Sender: TObject);
var
  nsh:Longint;
begin
  psh:=realimgheight;
  if (Form2.ToggleBox1.State=cbChecked) then
  begin
    Form2.SpinEdit1.OnChange:=nil;
    nsh:=Form2.SpinEdit2.Value*psw div psh;
    Form2.SpinEdit1.Value:=nsh;
    Form2.SpinEdit1.OnChange:=@Form2.SpinEdit1Change;
  end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  okresize:=false;
  psw:=Form2.SpinEdit1.Value;
  psh:=Form2.SpinEdit2.Value;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  okresize:=false;
  psw:=Form2.SpinEdit1.Value;
  psh:=Form2.SpinEdit2.Value;
end;

procedure TForm2.OKButtonClick(Sender: TObject);
begin
okresize:=true;
Form2.Close;
end;

end.

