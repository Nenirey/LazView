unit fgoto;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ButtonPanel;

type

  { Tfrgoto }

  Tfrgoto = class(TForm)
    ButtonPanel1: TButtonPanel;
    Edit1: TEdit;
    Label1: TLabel;
    procedure CancelButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frgoto: Tfrgoto;
  isgo:boolean=false;

implementation

{$R *.lfm}

{ Tfrgoto }

procedure Tfrgoto.OKButtonClick(Sender: TObject);
begin
  isgo:=true;
  frgoto.Close;
end;

procedure Tfrgoto.CancelButtonClick(Sender: TObject);
begin
  isgo:=false;
  frgoto.Close;
end;

procedure Tfrgoto.FormShow(Sender: TObject);
begin
  isgo:=false;
end;

end.

