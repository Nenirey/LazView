unit print;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ButtonPanel, Spin;

type

  { Tfrprint }

  Tfrprint = class(TForm)
    btnpPrinter: TButtonPanel;
    cbPrinter: TComboBox;
    cbSheel: TComboBox;
    lblCopys: TLabel;
    lblSheel: TLabel;
    lblprint: TLabel;
    rbVertical: TRadioButton;
    rbHorizontal: TRadioButton;
    speCopys: TSpinEdit;
    procedure CloseButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
  private

  public
    var
      accept:boolean;
  end;

var
  frprint: Tfrprint;
implementation

{$R *.lfm}

{ Tfrprint }

procedure Tfrprint.CloseButtonClick(Sender: TObject);
begin
  accept:=false;
end;

procedure Tfrprint.FormShow(Sender: TObject);
begin
  accept:=false;
end;

procedure Tfrprint.OKButtonClick(Sender: TObject);
begin
  accept:=true;
end;

end.

