unit Unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ComCtrls,
  ButtonPanel, StdCtrls;

type

  { TForm3 }

  TForm3 = class(TForm)
    ButtonPanel1: TButtonPanel;
    Label1: TLabel;
    TrackBar1: TTrackBar;
    procedure TrackBar1Change(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.lfm}

{ TForm3 }

procedure TForm3.TrackBar1Change(Sender: TObject);
begin
  Form3.Label1.Caption:=inttostr(Form3.TrackBar1.Position);
end;

end.

