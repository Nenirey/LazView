unit fquality;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ComCtrls,
  ButtonPanel, StdCtrls;

type

  { Tfrquality }

  Tfrquality = class(TForm)
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
  frquality: Tfrquality;

implementation

{$R *.lfm}

{ Tfrquality }

procedure Tfrquality.TrackBar1Change(Sender: TObject);
begin
  frquality.Label1.Caption:=inttostr(frquality.TrackBar1.Position);
end;

end.

