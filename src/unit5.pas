unit Unit5;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ButtonPanel;

type

  { TForm5 }

  TForm5 = class(TForm)
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
  Form5: TForm5;
  isgo:boolean=false;

implementation

{$R *.lfm}

{ TForm5 }

procedure TForm5.OKButtonClick(Sender: TObject);
begin
  isgo:=true;
  Form5.Close;
end;

procedure TForm5.CancelButtonClick(Sender: TObject);
begin
  isgo:=false;
  Form5.Close;
end;

procedure TForm5.FormShow(Sender: TObject);
begin
  isgo:=false;
end;

end.

