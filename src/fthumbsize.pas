unit fthumbsize;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ButtonPanel,
  Spin, StdCtrls;

type

  { Tfrthumbsize }

  Tfrthumbsize = class(TForm)
    ButtonPanel1: TButtonPanel;
    Label1: TLabel;
    SpinEdit1: TSpinEdit;
  private

  public

  end;

var
  frthumbsize: Tfrthumbsize;

implementation

{$R *.lfm}

end.

