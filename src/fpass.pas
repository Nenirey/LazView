unit fpass;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ButtonPanel, StdCtrls;

type

  { Tfrpass }

  Tfrpass = class(TForm)
    ButtonPanel1: TButtonPanel;
    edtPass: TEdit;
    Label1: TLabel;
  private

  public

  end;

var
  frpass: Tfrpass;

implementation

{$R *.lfm}

end.

