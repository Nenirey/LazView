unit fmain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, ComCtrls,
  StdCtrls, Menus, ExtDlgs, LazFileUtils, FileUtil, IntfGraphics,
  types, LCLType, PairSplitter, ShellCtrls, FPImage, Unit2, Unit3, Unit4, Unit5, Unit6,
  LazUTF8{$IFDEF WINDOWS}, Registry, Windows, Windirs{$ENDIF},
  BGRABitmapTypes, BGRABitmap, BGRAThumbnail, BGRAAnimatedGif,
  DateUtils, Math, ImgSize, BGRAGifFormat;

type

  { Tfrmain }

  Tfrmain = class(TForm)
    Image1: TImage;
    ImageList1: TImageList;
    Label1: TLabel;
    Label2: TLabel;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    mnufileopen: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    MenuItem24: TMenuItem;
    MenuItem25: TMenuItem;
    MenuItem26: TMenuItem;
    MenuItem27: TMenuItem;
    MenuItem28: TMenuItem;
    MenuItem29: TMenuItem;
    MenuItem3: TMenuItem;
    mnuShowThumbs: TMenuItem;
    MenuItem31: TMenuItem;
    MenuItem32: TMenuItem;
    MenuItem33: TMenuItem;
    MenuItem34: TMenuItem;
    MenuItem35: TMenuItem;
    MenuItem36: TMenuItem;
    MenuItem37: TMenuItem;
    MenuItem38: TMenuItem;
    MenuItem39: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem40: TMenuItem;
    MenuItem41: TMenuItem;
    MenuItem42: TMenuItem;
    MenuItem43: TMenuItem;
    MenuItem44: TMenuItem;
    MenuItem45: TMenuItem;
    MenuItem46: TMenuItem;
    MenuItem47: TMenuItem;
    MenuItem48: TMenuItem;
    MenuItem49: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem50: TMenuItem;
    MenuItem51: TMenuItem;
    MenuItem52: TMenuItem;
    MenuItem53: TMenuItem;
    MenuItem54: TMenuItem;
    MenuItem55: TMenuItem;
    MenuItem56: TMenuItem;
    MenuItem57: TMenuItem;
    MenuItem58: TMenuItem;
    MenuItem59: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem60: TMenuItem;
    MenuItem61: TMenuItem;
    MenuItem62: TMenuItem;
    MenuItem63: TMenuItem;
    MenuItem64: TMenuItem;
    MenuItem65: TMenuItem;
    MenuItem66: TMenuItem;
    MenuItem67: TMenuItem;
    MenuItem68: TMenuItem;
    MenuItem69: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    OpenPictureDialog1: TOpenPictureDialog;
    psVertical: TPairSplitter;
    pssImagen: TPairSplitterSide;
    pssThumbs: TPairSplitterSide;
    PopupMenu1: TPopupMenu;
    SavePictureDialog1: TSavePictureDialog;
    ScrollBox1: TScrollBox;
    sboxthumb: TScrollBox;
    Shape1: TShape;
    ShellTreeView1: TShellTreeView;
    Splitter1: TSplitter;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    Timer2: TTimer;
    Timer3: TTimer;
    Timer4: TTimer;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    tbShowTreeView: TToolButton;
    tbShowThumbs: TToolButton;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    ToolButton2: TToolButton;
    ToolButton20: TToolButton;
    ToolButton21: TToolButton;
    ToolButton22: TToolButton;
    ToolButton23: TToolButton;
    ToolButton24: TToolButton;
    ToolButton25: TToolButton;
    ToolButton26: TToolButton;
    ToolButton27: TToolButton;
    ToolButton3: TToolButton;
    tbFlipHorizontal: TToolButton;
    tbFlipVertical: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: char);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormWindowStateChange(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image1DblClick(Sender: TObject);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1Resize(Sender: TObject);
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem13Click(Sender: TObject);
    procedure MenuItem14Click(Sender: TObject);
    procedure MenuItem16Click(Sender: TObject);
    procedure MenuItem17Click(Sender: TObject);
    procedure MenuItem20Click(Sender: TObject);
    procedure MenuItem21Click(Sender: TObject);
    procedure MenuItem22Click(Sender: TObject);
    procedure MenuItem23Click(Sender: TObject);
    procedure MenuItem24Click(Sender: TObject);
    procedure MenuItem25Click(Sender: TObject);
    procedure MenuItem27Click(Sender: TObject);
    procedure MenuItem28Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure mnuShowThumbsClick(Sender: TObject);
    procedure MenuItem31Click(Sender: TObject);
    procedure MenuItem33Click(Sender: TObject);
    procedure MenuItem34Click(Sender: TObject);
    procedure MenuItem36Click(Sender: TObject);
    procedure MenuItem37Click(Sender: TObject);
    procedure MenuItem39Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem40Click(Sender: TObject);
    procedure MenuItem41Click(Sender: TObject);
    procedure MenuItem43Click(Sender: TObject);
    procedure MenuItem44Click(Sender: TObject);
    procedure MenuItem46Click(Sender: TObject);
    procedure MenuItem49Click(Sender: TObject);
    procedure MenuItem50Click(Sender: TObject);
    procedure MenuItem51Click(Sender: TObject);
    procedure MenuItem52Click(Sender: TObject);
    procedure MenuItem53Click(Sender: TObject);
    procedure MenuItem54Click(Sender: TObject);
    procedure MenuItem55Click(Sender: TObject);
    procedure MenuItem56Click(Sender: TObject);
    procedure MenuItem57Click(Sender: TObject);
    procedure MenuItem58Click(Sender: TObject);
    procedure MenuItem59Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem61Click(Sender: TObject);
    procedure MenuItem62Click(Sender: TObject);
    procedure MenuItem64Click(Sender: TObject);
    procedure MenuItem65Click(Sender: TObject);
    procedure MenuItem66Click(Sender: TObject);
    procedure MenuItem67Click(Sender: TObject);
    procedure MenuItem68Click(Sender: TObject);
    procedure MenuItem69Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure MenuItem9Click(Sender: TObject);
    procedure PairSplitter2Resize(Sender: TObject);
    procedure PairSplitterSide2Resize(Sender: TObject);
    procedure PairSplitterSide3Resize(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure ScrollBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ScrollBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ScrollBox1MouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure ScrollBox1Paint(Sender: TObject);
    procedure sboxthumbMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sboxthumbMouseLeave(Sender: TObject);
    procedure sboxthumbMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sboxthumbMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ShellTreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure ShellTreeView1Click(Sender: TObject);
    procedure ShellTreeView1Expanded(Sender: TObject; Node: TTreeNode);
    procedure ShellTreeView1SelectionChanged(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure ToolBar1Click(Sender: TObject);
    procedure ToolBar1MouseLeave(Sender: TObject);
    procedure ToolBar1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ToolButton10Click(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
    procedure ToolButton12Click(Sender: TObject);
    procedure ToolButton13Click(Sender: TObject);
    procedure ToolButton14Click(Sender: TObject);
    procedure ToolButton15Click(Sender: TObject);
    procedure tbShowTreeViewClick(Sender: TObject);
    procedure ToolButton18Click(Sender: TObject);
    procedure ToolButton19Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton20Click(Sender: TObject);
    procedure ToolButton21Click(Sender: TObject);
    procedure ToolButton24Click(Sender: TObject);
    procedure ToolButton26Click(Sender: TObject);
    procedure ToolButton27Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure tbFlipHorizontalClick(Sender: TObject);
    procedure tbFlipVerticalClick(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }

  end;

type tthumbimage = class(Extctrls.TImage)
  procedure thumbclick(Sender:TObject);
  procedure thumbmousedown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  procedure thumbmousemove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
  procedure thumbmouseup(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  procedure thumbmouseleave(Sender: TObject);
end;

type
  thumbsthread = class (TThread)
  private
   done:boolean;
   thumb:Graphics.TBitMap;
   thumbindex:integer;
   iname:string;
   thumbpath:string;
   procedure createallimages;
   procedure refreshthumbs;
   procedure showthumbs;
  protected
   procedure Execute; override;
  public
   Constructor Create(CreateSuspended:Boolean);
   procedure stop;
end;

Const
  mosaicsize=10;

var
  frmain: Tfrmain;
  full,ifgif,startdraw,startselect,compactmode:boolean;
  flist:TStringList;
  nfile,ifile,ndir,idir:LongInt;
  carpeta:string;
  fwidth,fheight,fxpos,fypos,imgx,imgy:longint;
  aleatorio:boolean=false;
  ththumbs:thumbsthread;
  showthumbs:boolean=false;
  thumbsize:integer=64;
  hidetoolbardelay:integer=5;
  modethumb:boolean;//when the image is too large and prefere this for performance
  folderchange:boolean=true;
  starting:boolean=true;
  BGRAgif:TBGRAAnimatedGif;
  scrollchange:boolean=true;
  mosaic:Graphics.TBitmap;
  mosaicmousedown:boolean=false;
  mosaicscrollposition:integer;
  mosaicmouseposition:integer;
  title:string;
  ifallthumbs:boolean;
  realimgwidth,realimgheight:LongInt;
  inprocessanim:boolean;
  function UTF16LongName(const FileName: String): UnicodeString;
  procedure filterimagen(filter:integer);
  procedure efectimagen(efect:integer;nivel:integer=5000);
  procedure loadpicture(fimagen:string;restorezoom:boolean=true;scrollthumbs:boolean=true;realimage:boolean=false);
implementation

{$R *.lfm}

{ Tfrmain }

function UTF16LongName(const FileName: String): UnicodeString;
var
  Temp: PWideChar;
begin
  if Pos('\\', FileName) = 0 then
    Result := '\\?\' + UTF8Decode(FileName)
  else begin
    Result := '\\?\UNC\' + UTF8Decode(Copy(FileName, 3, MaxInt));
  end;
  Temp := Pointer(Result) + 4;
  while Temp^ <> #0 do
  begin
    if Temp^ = '/' then Temp^:= '\';
      Inc(Temp);
  end;
  if ((Temp - 1)^ = DriveSeparator) then Result:= Result + '\';
end;

procedure scrollanim;
var
  center,i:integer;
begin
  inprocessanim:=true;
  i:=frmain.sboxthumb.HorzScrollBar.Position;
  center:=(frmain.sboxthumb.Components[ifile] as TControl).Left-Round(frmain.pssThumbs.Width/2)+Round(thumbsize/2)+1;
  if i<center then
  begin
    //ShowMessage('Left');
    if (center-i)>200 then
      i:=center;
    while i<center do
    begin
      {$IFDEF WINDOWS}
      sleep(1);
      {$ELSE}
      sleep(10);
      {$ENDIF}
      if (center-i)>100 then
        i:=i+50
      else
      begin
        if (center-i)>20 then
          i:=i+10
        else
          i:=i+1;
      end;
      frmain.sboxthumb.HorzScrollBar.Position:=i;
      Application.ProcessMessages;
    end;
  end;

  if i>center then
  begin
    //ShowMessage('Right');
    if i>(center+200) then
      i:=center;
    while  i>center do
    begin
      {$IFDEF WINDOWS}
      sleep(1);
      {$ELSE}
      sleep(10);
      {$ENDIF}
      if i>(center+100) then
        i:=i-50
      else
      begin
        if i>(center+20) then
          i:=i-10
        else
          i:=i-1;
      end;
      frmain.sboxthumb.HorzScrollBar.Position:=i;
      Application.ProcessMessages;
    end;
  end;
  frmain.sboxthumb.HorzScrollBar.Position:=(frmain.sboxthumb.Components[ifile] as TControl).Left-Round(frmain.pssThumbs.Width/2)+Round(thumbsize/2)+1;
  inprocessanim:=false;
end;

procedure rendermosaic;
var
   x,y,xm,ym:integer;
   xt,yt:boolean;
begin
  xt:=false;
  yt:=false;
  mosaic.Width:=Screen.Width;
  mosaic.Height:=Screen.Height;
  mosaic.Canvas.Brush.Color:=clGray;
  mosaic.Canvas.Pen.Color:=clWhite;
  xm:=Round(mosaic.Width/mosaicsize);
  ym:=Round(mosaic.Height/mosaicsize);
  for y:=0 to ym do
  begin
    //ShowMessage('Vertical draw');
    yt:=not yt;
    for x:=0 to xm do
    begin
      //ShowMessage('Horizontal draw');
      if x=0 then
        xt:=not yt;
      xt:=not xt;
      if xt then
      begin
        mosaic.Canvas.Brush.Color:=clWhite;
        mosaic.Canvas.Pen.Color:=clWhite;
      end
      else
      begin
        mosaic.Canvas.Brush.Color:=clGray;
        mosaic.Canvas.Pen.Color:=clGray;
      end;
      mosaic.Canvas.Rectangle(x*mosaicsize,y*mosaicsize,x*mosaicsize+mosaicsize,y*mosaicsize+mosaicsize);
      //frmain.ScrollBox1.Canvas.Draw(0,0,mosaic);
    end;
  end;
  frmain.ScrollBox1.Canvas.Draw(0,0,mosaic);
end;

procedure realmode;
begin
  //frmain.MenuItem58.Checked:=true;
  if Assigned(flist) and frmain.Image1.Visible and modethumb then
  begin
    loadpicture(carpeta+flist[ifile],true,true,true);
  end;
end;

function zoomfactor(RealWidth:integer;RealHeight:integer;ActualWidth:integer;ActualHeight:integer):string;
var
  widthpercent,heightpercent,totalpercent:integer;
begin
  widthpercent:=Round((ActualWidth/RealWidth)*100);
  heightpercent:=Round((ActualHeight/RealHeight)*100);
  totalpercent:=Round((widthpercent+heightpercent) div 2);
  result:=inttostr(totalpercent);
end;

procedure calculateaspectwidth(actualwidth:integer;actualheight:integer;newheight:integer;var outwidth:integer);
begin
  outwidth:=newheight*actualwidth div actualheight;
end;

procedure calculateaspectheight(actualwidth:integer;actualheight:integer;newwidth:integer;var outheight:integer);
begin
  outheight:=newwidth*actualheight div actualwidth;
end;

function prettytime(ms:integer):string;
begin
  if ms>=60000 then
    result:=floattostr(RoundTo((ms / 1000) / 60,-2))+' min';
  if ms>=1000 then
    result:=floattostr(RoundTo(ms / 1000,-2))+' seg';
  if ms<1000 then
    result:=inttostr(ms)+' ms';
end;

procedure resizeto(w:integer;h:integer);
var
   tmpbitmap:BGRABitmap.TBGRABitmap;
   i:integer;
   tmpgif:TBGRAAnimatedGif;
begin
  realmode;
  if ifgif then
  begin
    tmpgif:=TBGRAAnimatedGif.Create;
    tmpgif.SetSize(w,h);
    for i:=0 to BGRAGif.Count-1 do
    begin
      tmpbitmap:=BGRABitmap.TBGRABitmap.Create(w,h);
      BGRAGif.CurrentImage:=i;
      tmpbitmap.Canvas.CopyRect(Types.Rect(0,0,w,h),BGRAGif.Bitmap.Canvas,Types.Rect(0,0,BGRAGif.Width,BGRAGif.Height));
      tmpgif.InsertFrame(i,tmpbitmap,0,0,BGRAGif.FrameDelayMs[i],BGRAGif.FrameDisposeMode[i],BGRAGif.FrameHasLocalPalette[i]);
      tmpbitmap.Destroy;
    end;
    BGRAGif.SetSize(w,h);
    BGRAGif:=tmpgif;
  end
  else
  begin
    tmpbitmap:=BGRABitmap.TBGRABitmap.Create(w,h);
    tmpbitmap.Canvas.CopyRect(Types.Rect(0,0,w,h),frmain.Image1.Picture.Bitmap.Canvas,Types.Rect(0,0,frmain.Image1.Picture.Bitmap.Width,frmain.Image1.Picture.Bitmap.Height));
    frmain.Image1.Picture.Bitmap.Assign(tmpbitmap);
    tmpbitmap.Destroy;
  end;
  realimgwidth:=w;
  realimgheight:=h;
  frmain.StatusBar1.Panels.Items[1].Text:='Resolucion:'+inttostr(w)+'x'+inttostr(h)+' '+zoomfactor(w,h,frmain.Image1.Width,frmain.Image1.Height)+'%';
end;

procedure setwallpaper(style:string;mosaic:string='0');
{$IFDEF WINDOWS}
 var
    registro:TRegistry;
    wallstr:string;
    aw,ah,nw,nh:integer;
    wallp:Graphics.TBitmap;
{$ENDIF}
begin
  realmode;
  {$IFDEF WINDOWS}
    wallstr:=LazFileUtils.GetAppConfigDirUTF8(false)+'Wallpaper.bmp';
    SysUtils.ForceDirectories(LazFileUtils.GetAppConfigDirUTF8(false));
    case style of
    '1':
      begin
        aw:=frmain.Image1.Picture.Bitmap.Width;
        ah:=frmain.Image1.Picture.Bitmap.Height;
        if (aw-Screen.Width)<=(ah-Screen.Height) then
        begin
          calculateaspectwidth(aw,ah,Screen.Height,nw);
          nh:=Screen.Height;
        end
        else
        begin
          nw:=Screen.Width;
          calculateaspectheight(aw,ah,Screen.Width,nh);
        end;

        wallp:=Graphics.TBitmap.Create;
        wallp.Width:=nw;
        wallp.Height:=nh;
        if frmain.Image1.Visible then
          wallp.Canvas.CopyRect(Types.Rect(0,0,nw,nh),frmain.Image1.Picture.Bitmap.Canvas,Types.Rect(0,0,frmain.Image1.Picture.Bitmap.Width,frmain.Image1.Picture.Bitmap.Height));
        wallp.SaveToFile(wallstr);
        wallp.Destroy;
      end;
      else
      begin
        if frmain.Image1.Visible then
          frmain.Image1.Picture.Bitmap.SaveToFile(wallstr);
      end;
    end;
    wallstr:=GetAppConfigDir(false)+'Wallpaper.bmp';
    registro:=TRegistry.Create;
    registro.RootKey:=HKEY_CURRENT_USER;
    registro.OpenKey('Control Panel\Desktop',false);
    registro.WriteString('ConvertedWallpaper',wallstr);
    registro.WriteString('OriginalWallpaper',wallstr);
    registro.WriteString('Wallpaper',wallstr);
    if mosaic<>'1' then
      registro.WriteString('WallpaperStyle',style);
    registro.WriteString('TileWallpaper',mosaic);
    registro.CloseKey;
    registro.Free;
    //SystemParametersInfoA(SPI_SETDESKWALLPAPER,NULL,nil,SPIF_SENDCHANGE);
    ExecuteProcess('Rundll32.exe','user32.dll UpdatePerUserSystemParameters ,1, true');
    {$ENDIF}
end;

procedure refreshthumbs;
begin
  frmain.sboxthumb.Visible:=false;
  frmain.sboxthumb.DestroyComponents;
  frmain.sboxthumb.Visible:=true;
end;

procedure zoomnormal();
var
   x:integer;
begin
  for x:=0 to 2 do
  begin
    frmain.Image1.Width:=10;
    frmain.Image1.Height:=10;
    frmain.Image1.Top:=0;
    frmain.Image1.Left:=0;
    frmain.ScrollBox1.AutoScroll:=false;
    frmain.ScrollBox1.Enabled:=true;
    frmain.Image1.AutoSize:=true;
    frmain.Image1.AutoSize:=false;
    frmain.Image1.Stretch:=false;
    frmain.Image1.Align:=alClient;
    frmain.Image1.Anchors:=[akTop,akLeft,akRight,akBottom];
    frmain.Image1.Show;
    frmain.Image1.Cursor:=crDefault;
  end;
end;

procedure zoomstrech();
var
   x:integer;
begin
  for x:=0 to 2 do
  begin
    frmain.Image1.Width:=10;
    frmain.Image1.Height:=10;
    frmain.Image1.Top:=0;
    frmain.Image1.Left:=0;
    frmain.ScrollBox1.AutoScroll:=false;
    frmain.ScrollBox1.Enabled:=true;
    frmain.Image1.AutoSize:=true;
    frmain.Image1.AutoSize:=false;
    frmain.Image1.Stretch:=true;
    frmain.Image1.Align:=alClient;
    frmain.Image1.Anchors:=[akTop,akLeft,akRight,akBottom];
    frmain.Image1.Show;
    frmain.Image1.Cursor:=crDefault;
  end;
end;

procedure zoomoriginal();
begin
  realmode;
  frmain.Image1.Align:=alNone;
  //frmain.ScrollBox1.AutoScroll:=true;
  frmain.ScrollBox1.Enabled:=true;
  frmain.Image1.Stretch:=true;
  frmain.Image1.AutoSize:=true;
  frmain.Image1.Width:=frmain.Image1.Picture.BitMap.Width;
  frmain.Image1.Height:=frmain.Image1.Picture.BitMap.Height;
  frmain.Image1.Cursor:=crSizeAll;
  frmain.StatusBar1.Panels.Items[1].Text:='Resolucion:'+inttostr(frmain.Image1.Picture.Width)+'x'+inttostr(frmain.Image1.Picture.Height)+' '+zoomfactor(frmain.Image1.Picture.Width,frmain.Image1.Picture.Height,frmain.Image1.Width,frmain.Image1.Height)+'%';
end;

procedure zoomin(raton:boolean=false);
var
   lwidth,lheight{,lx,ly}:integer;
begin
  realmode;
  //lx:=Mouse.CursorPos.x;
  //ly:=Mouse.CursorPos.y;
  lwidth:=frmain.Image1.Width;
  lheight:=frmain.Image1.Height;
  if frmain.Image1.Align = alClient then
  begin
    //frmain.ScrollBox1.AutoScroll:=true;
    frmain.ScrollBox1.Enabled:=true;
    frmain.Image1.Stretch:=true;
    frmain.Image1.AutoSize:=false;
    frmain.Image1.Align:=alNone;
    frmain.Image1.Width:=lwidth;
    frmain.Image1.Height:=lheight;
  end;
  frmain.Image1.Width:=frmain.Image1.Width+20;
  frmain.Image1.Height:=frmain.Image1.Height+20;
  if raton then
  begin
    //frmain.Image1.Top:=ly-frmain.Image1.Height-20;
    //frmain.Image1.Left:=ly+frmain.Image1.Width-20;
  end;
  frmain.Image1.Cursor:=crSizeAll;
  frmain.StatusBar1.Panels.Items[1].Text:='Resolucion:'+inttostr(frmain.Image1.Picture.Width)+'x'+inttostr(frmain.Image1.Picture.Height)+' '+zoomfactor(frmain.Image1.Picture.Width,frmain.Image1.Picture.Height,frmain.Image1.Width,frmain.Image1.Height)+'%';
end;

procedure zoomout(raton:boolean=false);
var
   lwidth,lheight:integer;
begin
  realmode;
  lwidth:=frmain.Image1.Width;
  lheight:=frmain.Image1.Height;
  if frmain.Image1.Align = alClient then
  begin
    //frmain.ScrollBox1.AutoScroll:=true;
    frmain.ScrollBox1.Enabled:=true;
    frmain.Image1.Stretch:=true;
    frmain.Image1.AutoSize:=false;
    frmain.Image1.Align:=alNone;
    frmain.Image1.Width:=lwidth;
    frmain.Image1.Height:=lheight;
  end;
  frmain.Image1.Width:=frmain.Image1.Width-20;
  frmain.Image1.Height:=frmain.Image1.Height-20;
  frmain.Image1.Cursor:=crSizeAll;
  frmain.StatusBar1.Panels.Items[1].Text:='Resolucion:'+inttostr(frmain.Image1.Picture.Width)+'x'+inttostr(frmain.Image1.Picture.Height)+' '+zoomfactor(frmain.Image1.Picture.Width,frmain.Image1.Picture.Height,frmain.Image1.Width,frmain.Image1.Height)+'%';
end;

procedure loadpicture(fimagen:string;restorezoom:boolean=true;scrollthumbs:boolean=true;realimage:boolean=false);
var
   ebitmap:Graphics.TBitmap;
   th,tw:integer;
   iw,ih:word;
   streamimage:TFileStream;
   starttime:TDateTime;
   bgcolor:TBGRAPixel;
   BGRAImage:BGRABitmap.TBGRABitmap;
   wimagen:UnicodeString;
begin
  {$IFDEF WINDOWS}
  wimagen:=UTF16LongName(fimagen);
  {$ELSE}
  wimagen:=fimagen;
  {$ENDIF}
  starttime:=Now();
  try
    frmain.Caption:='LazView '+fimagen;
    frmain.Label1.Caption:=inttostr(ifile+1)+'/'+inttostr(nfile)+'  '+fimagen;
    frmain.Label2.Caption:=inttostr(ifile+1)+'/'+inttostr(nfile)+'  '+fimagen;
    frmain.StatusBar1.Panels.Items[0].Text:=inttostr(ifile+1)+'/'+inttostr(nfile);
    frmain.StatusBar1.Panels.Items[3].Text:=' Tamaño:'+FloatTostr(Round(FileSize(wimagen)/1024))+'Kb';
    if restorezoom and (frmain.ToolButton24.Down=false) then
      zoomnormal()
    else
      zoomstrech();
    if UpperCase(ExtractFileExt(wimagen)) = '.GIF' then
    begin
      ifgif:=true;
      frmain.Image1.Picture.Clear;
      frmain.ToolButton19.Enabled:=true;
      frmain.ToolButton20.Enabled:=true;
      frmain.ToolButton21.Enabled:=true;
      frmain.ToolButton26.Enabled:=true;
      frmain.ToolButton27.Enabled:=true;
    end
    else
    begin
      ifgif:=false;
      frmain.Timer3.Enabled:=false;
      frmain.ToolButton19.Enabled:=false;
      frmain.ToolButton20.Enabled:=false;
      frmain.ToolButton21.Enabled:=false;
      frmain.ToolButton26.Enabled:=false;
      frmain.ToolButton27.Enabled:=false;
      frmain.StatusBar1.Panels[2].Text:='';
    end;
    case UpperCase(ExtractFileExt(fimagen)) of
      '.GIF':
      begin
        BGRAgif:=TBGRAAnimatedGif.Create(wimagen);
        frmain.Timer3Timer(nil);
        if BGRAGif.Count>1 then
          frmain.Timer3.Enabled:=true
        else
          frmain.Timer3.Enabled:=false;

        frmain.StatusBar1.Panels.Items[1].Text:='Resolucion:'+inttostr(frmain.Image1.Picture.Width)+'x'+inttostr(frmain.Image1.Picture.Height)+' '+zoomfactor(frmain.Image1.Picture.Width,frmain.Image1.Picture.Height,frmain.Image1.Width,frmain.Image1.Height)+'%';
        modethumb:=false;
        realimgwidth:=frmain.Image1.Picture.Width;
        realimgheight:=frmain.Image1.Picture.Height;
      end;
      '.JPG','.JPEG','.JPE','.JFIF','.BMP','.PNG','.XPM','.PBM','.PPM','.ICNS','.CUR','.TIF','.TIFF':
      begin
        streamimage:=TFileStream.Create(wimagen,fmOpenRead or fmShareDenyNone);
        bgcolor.alpha:=255;
        bgcolor.blue:=0;
        bgcolor.green:=0;
        bgcolor.red:=0;
        if frmain.MenuItem58.Checked or realimage then
        begin
          frmain.Image1.Picture.LoadFromStream(streamimage);
          frmain.StatusBar1.Panels.Items[1].Text:='Resolucion:'+inttostr(frmain.Image1.Picture.Width)+'x'+inttostr(frmain.Image1.Picture.Height)+' '+zoomfactor(frmain.Image1.Picture.Width,frmain.Image1.Picture.Height,frmain.Image1.Width,frmain.Image1.Height)+'%';
          modethumb:=false;
          realimgwidth:=frmain.Image1.Picture.Width;
          realimgheight:=frmain.Image1.Picture.Height;
        end
        else
        begin
          case LowerCase(ExtractFileExt(fimagen)) of
          '.jpg','.jpe','.jpeg':ImgSize.GetJPGSize(streamimage,iw,ih);
          '.png','.pne':ImgSize.GetPNGSize(streamimage,iw,ih);
          '.bmp':ImgSize.GetBMPSize(streamimage,iw,ih);
          else
          begin
            iw:=0;
            ih:=0;
          end;
          end;
          streamimage.Position:=0;
          if ((iw>Screen.Width) or (ih>Screen.Height)) then
          begin
            if (iw-frmain.pssImagen.Width)<=(ih-frmain.pssImagen.Height) then
            begin
              th:=frmain.pssImagen.Height;
              calculateaspectwidth(iw,ih,frmain.Image1.Height,tw);
            end
            else
            begin
              tw:=frmain.pssImagen.Width;
              calculateaspectheight(iw,ih,frmain.Image1.Width,th);
            end;
            frmain.Image1.Picture.Bitmap.Assign(GetStreamThumbnail(streamimage,tw,th, bgcolor, false));
            frmain.StatusBar1.Panels.Items[1].Text:='*Resolucion:'+inttostr(iw)+'x'+inttostr(ih)+' '+zoomfactor(iw,ih,frmain.Image1.Width,frmain.Image1.Height)+'%';
            modethumb:=true;
            realimgwidth:=iw;
            realimgheight:=ih;
          end
          else
          begin
            frmain.Image1.Picture.LoadFromStream(streamimage);
            frmain.StatusBar1.Panels.Items[1].Text:='Resolucion:'+inttostr(frmain.Image1.Picture.Width)+'x'+inttostr(frmain.Image1.Picture.Height)+' '+zoomfactor(frmain.Image1.Picture.Width,frmain.Image1.Picture.Height,frmain.Image1.Width,frmain.Image1.Height)+'%';
            modethumb:=false;
            realimgwidth:=frmain.Image1.Picture.Width;
            realimgheight:=frmain.Image1.Picture.Height;
          end;
        end;
        streamimage.Destroy;
      end;
      '.ICO':
      begin
        frmain.Image1.Picture.LoadFromFile(wimagen);
        frmain.StatusBar1.Panels.Items[1].Text:='Resolucion:'+inttostr(frmain.Image1.Picture.Width)+'x'+inttostr(frmain.Image1.Picture.Height)+' '+zoomfactor(frmain.Image1.Picture.Width,frmain.Image1.Picture.Height,frmain.Image1.Width,frmain.Image1.Height)+'%';
        modethumb:=false;
        realimgwidth:=frmain.Image1.Picture.Width;
        realimgheight:=frmain.Image1.Picture.Height;
      end;
      '.PCX','.TGA','.PSD','.XWD':
      begin
        BGRAImage:=BGRABitmap.TBGRABitmap.Create(wimagen);
        frmain.Image1.Picture.Assign(BGRAImage);
        frmain.StatusBar1.Panels.Items[1].Text:='Resolucion:'+inttostr(frmain.Image1.Picture.Width)+'x'+inttostr(frmain.Image1.Picture.Height)+' '+zoomfactor(frmain.Image1.Picture.Width,frmain.Image1.Picture.Height,frmain.Image1.Width,frmain.Image1.Height)+'%';
        modethumb:=false;
        realimgwidth:=frmain.Image1.Picture.Width;
        realimgheight:=frmain.Image1.Picture.Height;
        BGRAImage.Destroy;
      end;
      else/////Try to load as Image
      begin
        streamimage:=TFileStream.Create(wimagen,fmOpenRead or fmShareDenyNone);
        frmain.Image1.Picture.LoadFromStream(streamimage);
        frmain.StatusBar1.Panels.Items[1].Text:='Resolucion:'+inttostr(frmain.Image1.Picture.Width)+'x'+inttostr(frmain.Image1.Picture.Height)+' '+zoomfactor(frmain.Image1.Picture.Width,frmain.Image1.Picture.Height,frmain.Image1.Width,frmain.Image1.Height)+'%';
        modethumb:=false;
        realimgwidth:=frmain.Image1.Picture.Width;
        realimgheight:=frmain.Image1.Picture.Height;
        streamimage.Destroy;
      end;
    end;
    frmain.StatusBar1.Panels.Items[4].Text:='Tiempo:'+prettytime(MilliSecondsBetween(Now,starttime));

    ////////****Update buttons and menus****////////////////
    frmain.tbFlipHorizontal.Enabled:=true;
    frmain.tbFlipVertical.Enabled:=true;
    frmain.ToolButton6.Enabled:=true;
    frmain.ToolButton7.Enabled:=true;
    frmain.ToolButton9.Enabled:=true;
    frmain.ToolButton10.Enabled:=true;
    frmain.ToolButton11.Enabled:=true;
    frmain.ToolButton14.Enabled:=true;
    frmain.ToolButton15.Enabled:=true;
    frmain.MenuItem6.Enabled:=true;
    frmain.MenuItem7.Enabled:=true;
    frmain.MenuItem8.Enabled:=true;
    frmain.MenuItem9.Enabled:=true;
    frmain.MenuItem16.Enabled:=true;
    frmain.MenuItem14.Enabled:=true;
    frmain.MenuItem7.Enabled:=true;
    frmain.MenuItem8.Enabled:=true;
    frmain.MenuItem14.Enabled:=true;
    frmain.MenuItem15.Enabled:=true;
    frmain.MenuItem31.Enabled:=true;
    /////
  except on e:Exception do
    begin
      frmain.Timer3.Enabled:=false;
      frmain.Image1.Visible:=true;
      ebitmap:=Graphics.TBitmap.Create;
      ebitmap.Width:=frmain.Image1.Width;
      ebitmap.Height:=frmain.Image1.Height;
      ebitmap.Canvas.Brush.Color:=clWhite;
      ebitmap.Canvas.Pen.Color:=clRed;
      ebitmap.Canvas.Font.Size:=12;
      ebitmap.Canvas.Font.Color:=clRed;
      th:=ebitmap.Canvas.TextHeight('Error al cargar la imagen:'+e.ToString);
      tw:=ebitmap.Canvas.TextWidth('Error al cargar la imagen:'+e.ToString);
      ebitmap.Canvas.TextOut(Round((frmain.Image1.Width-tw)/2),Round((frmain.Image1.Height-th)/2),'Error al cargar la imagen:'+e.ToString);
      frmain.Image1.Picture.Bitmap.Assign(ebitmap);
      ebitmap.Destroy;
      /////////*****Update buttons and menus****///////////////////
      frmain.tbFlipHorizontal.Enabled:=false;
      frmain.tbFlipVertical.Enabled:=false;
      frmain.ToolButton6.Enabled:=false;
      frmain.ToolButton7.Enabled:=false;
      frmain.ToolButton9.Enabled:=false;
      frmain.ToolButton10.Enabled:=false;
      frmain.ToolButton11.Enabled:=false;
      frmain.ToolButton14.Enabled:=false;
      frmain.ToolButton15.Enabled:=false;
      frmain.ToolButton19.Enabled:=false;
      frmain.ToolButton20.Enabled:=false;
      frmain.ToolButton21.Enabled:=false;
      frmain.StatusBar1.Panels[2].Text:='';
      frmain.MenuItem6.Enabled:=false;
      frmain.MenuItem7.Enabled:=false;
      frmain.MenuItem8.Enabled:=false;
      frmain.MenuItem9.Enabled:=false;
      frmain.MenuItem16.Enabled:=false;
      frmain.MenuItem14.Enabled:=false;
      frmain.MenuItem7.Enabled:=false;
      frmain.MenuItem8.Enabled:=false;
      frmain.MenuItem14.Enabled:=true;
      frmain.MenuItem15.Enabled:=false;
      frmain.MenuItem31.Enabled:=false;
      //////////////
    end;
  end;
  if frmain.mnuShowThumbs.Checked then
  begin
    if scrollthumbs and (frmain.sboxthumb.ComponentCount>ifile) then
    begin
      //frmain.sboxthumb.ScrollInView((frmain.sboxthumb.Components[ifile] as TControl));
      //frmain.sboxthumb.HorzScrollBar.Position:=ifile*(thumbsize+1);
      //frmain.sboxthumb.HorzScrollBar.Position:=(frmain.sboxthumb.Components[ifile] as TControl).Left-Round(frmain.Width/2)+Round(thumbsize/2)+1;
      if inprocessanim=false then
        scrollanim;
    end;
  end;
  //if frmain.ToolButton24.Down then
    //zoomstrech();
end;

procedure fullsc();
begin
  frmain.pssThumbs.OnResize:=nil;
  if full = false then
  begin
    fwidth:=frmain.Width;
    fheight:=frmain.Height;
    fxpos:=frmain.Top;
    fypos:=frmain.Left;
    frmain.BorderStyle:=bsNone;
    frmain.ToolBar1.Align:=alNone;
    frmain.psVertical.Align:=alClient;
    frmain.StatusBar1.Visible:=false;
    frmain.Color:=clBlack;
    frmain.FormStyle:=fsStayOnTop;
    frmain.Label1.Visible:=true;
    frmain.Label2.Visible:=true;
    frmain.MainMenu1.Items.Visible:=false;
    frmain.Splitter1.Left:=0-frmain.Splitter1.Width;
    frmain.psVertical.Position:=frmain.psVertical.Height-thumbsize-18;
    frmain.WindowState:=wsFullScreen;
    frmain.Timer2.Enabled:=true;
    full:=true;
    if frmain.mnuShowThumbs.Checked then
      frmain.ToolBar1.Top:=frmain.pssThumbs.Top-frmain.ToolBar1.Height
    else
      frmain.ToolBar1.Top:=screen.Height-frmain.ToolBar1.Height;
    frmain.ToolBar1.Left:=Round((screen.Width-frmain.ToolBar1.Width)/2);
  end
  else
  begin
    frmain.Timer2.Enabled:=false;
    frmain.Width:=fwidth;
    frmain.Height:=fheight;
    frmain.WindowState:=wsNormal;
    frmain.BorderStyle:=bsSizeable;
    frmain.ToolBar1.Align:=alTop;
    if frmain.MenuItem61.Checked then
      frmain.ToolBar1.Visible:=true;
    frmain.Top:=fxpos;
    frmain.Left:=fypos;
    frmain.Width:=fwidth;
    frmain.Height:=fheight;
    frmain.Color:=clDefault;
    frmain.FormStyle:=fsNormal;
    frmain.Label1.Visible:=false;
    frmain.Label2.Visible:=false;
    try
      frmain.MainMenu1.Items.Visible:=true;
    except on e:exception do

    end;
    if frmain.MenuItem59.Checked then
      frmain.Splitter1.Left:=200;
    full:=false;
    frmain.psVertical.Align:=alNone;
    frmain.psVertical.Anchors:=[akTop, akLeft, akRight, akBottom];
    frmain.psVertical.AnchorSideLeft.Control:=frmain.Splitter1;
    frmain.psVertical.AnchorSideLeft.Side:=asrBottom;
    if frmain.MenuItem62.Checked then
    begin
      frmain.StatusBar1.Visible:=true;
      frmain.psVertical.AnchorSideBottom.Control:=frmain.StatusBar1;
    end
    else
    begin
      frmain.psVertical.AnchorSideBottom.Control:=frmain;
      frmain.psVertical.AnchorSideBottom.Side:=asrBottom;
    end;

    if frmain.MenuItem61.Checked=false then
    begin
      frmain.ToolBar1.Visible:=false;
      frmain.psVertical.AnchorSideTop.Control:=frmain;
      frmain.psVertical.AnchorSideTop.Side:=asrTop;
      frmain.Splitter1.AnchorSideTop.Control:=frmain;
      frmain.Splitter1.AnchorSideTop.Side:=asrTop;
    end
    else
    begin
      frmain.ToolBar1.Visible:=true;
      frmain.psVertical.AnchorSideTop.Control:=frmain.ToolBar1;
      frmain.psVertical.AnchorSideTop.Side:=asrBottom;
      frmain.Splitter1.AnchorSideTop.Control:=frmain.ToolBar1;
      frmain.Splitter1.AnchorSideTop.Side:=asrBottom;
    end;

    if frmain.MenuItem62.Checked then
    begin
      frmain.Splitter1.AnchorSideBottom.Control:=frmain.StatusBar1;
      frmain.Splitter1.AnchorSideBottom.Side:=asrTop;
    end
    else
    begin
      frmain.Splitter1.AnchorSideBottom.Control:=frmain;
      frmain.Splitter1.AnchorSideBottom.Side:=asrBottom;
    end;

    frmain.psVertical.AnchorSideRight.Control:=frmain;
    frmain.psVertical.AnchorSideRight.Side:=asrBottom;

    if frmain.mnuShowThumbs.Checked then
      frmain.psVertical.Position:=frmain.psVertical.Height-thumbsize-18
    else
      frmain.psVertical.Position:=frmain.psVertical.Height;
  end;
  frmain.pssThumbs.OnResize:=@frmain.PairSplitterSide2Resize;
end;

procedure osd();
begin
  if frmain.Label1.Visible then
  begin
    frmain.Label1.Visible:=false;
    frmain.Label2.Visible:=false;
  end
  else
  begin
    frmain.Label1.Visible:=true;
    frmain.Label2.Visible:=true;
  end;
end;

procedure nextfile();
begin
  if nfile > 0 then
  begin
    if ifile+1 < nfile then
      Inc(ifile)
    else
      ifile:=0;
    try
      loadpicture(carpeta+flist[ifile]);
    except
      on E:Exception do frmain.StatusBar1.SimpleText:=inttostr(ifile+1)+'/'+inttostr(nfile)+' Formato no soportado!!!';
    end;
  end;
end;
procedure prevfile();
begin
  if nfile > 0 then
  begin
    if ifile > 0 then
      ifile:=ifile-1
    else
      ifile:=nfile-1;
    try
      loadpicture(carpeta+flist[ifile]);
    except
      on E:Exception do frmain.StatusBar1.SimpleText:=inttostr(ifile+1)+'/'+inttostr(nfile)+' Formato no soportado!!!';
    end;
  end;
end;

procedure filterimagen(filter:integer);
/////////Filter 1:Grayscale
/////////       2:Plane
/////////       3:Contour
/////////       4:Cylinder
/////////       5:Emboss
/////////       6:EmbossHighlight
/////////       7:Normalize
/////////       8:Sphere
/////////       9:Twirl
/////////      10:Pixelate
/////////      11:Median
/////////      12:Zoom3
/////////      13:Negative
/////////      14:Sharpen
/////////      15:Smooth
/////////      16:TestFilter
/////////      17:RotateCW
/////////      18:RotateCCW
/////////      19:HorizontalFlip
/////////      20:VerticalFlip
var
   bmp:TBGRACustomBitmap;
   title:string;
   tmpgif:TBGRAAnimatedGif;
   tmpbitmap:BGRABitmap.TBGRABitmap;
   i:integer;
   imgrect:TRect;
   imgpoint:TPoint;
begin
  realmode;
  title:=frmain.Caption;
  frmain.Caption:='Aplicando efecto espere...';
  imgrect.Left:=0;
  imgrect.Top:=0;
  if ifgif and (BGRAGif.Count>1) then
  begin
    tmpgif:=TBGRAAnimatedGif.Create;
    tmpgif.SetSize(BGRAGif.Width,BGRAGif.Height);
    imgrect.Bottom:=BGRAGif.Height;
    imgrect.Right:=BGRAGif.Width;
    imgpoint:=TPoint.Create(Round(BGRAGif.Width/2),Round(BGRAGif.Height/2));
    for i:=0 to BGRAGif.Count-1 do
    begin
      tmpbitmap:=BGRABitmap.TBGRABitmap.Create(BGRAGif.Width,BGRAGif.Height);
      BGRAGif.CurrentImage:=i;
      tmpbitmap.Canvas.CopyRect(Types.Rect(0,0,BGRAGif.Width,BGRAGif.Height),BGRAGif.Bitmap.Canvas,Types.Rect(0,0,BGRAGif.Width,BGRAGif.Height));
      case filter of
      1:tmpbitmap.Assign(tmpbitmap.FilterGrayscale);
      2:tmpbitmap.Assign(tmpbitmap.FilterPlane);
      3:tmpbitmap.Assign(tmpbitmap.FilterContour);
      4:tmpbitmap.Assign(tmpbitmap.FilterCylinder);
      5:tmpbitmap.Assign(tmpbitmap.FilterEmboss(5));
      6:tmpbitmap.Assign(tmpbitmap.FilterEmbossHighLight(true));
      7:tmpbitmap.Assign(tmpbitmap.FilterNormalize);
      8:tmpbitmap.Assign(tmpbitmap.FilterSphere);
      9:tmpbitmap.Assign(tmpbitmap.FilterTwirl(imgrect,imgpoint,Round(frmain.Image1.Picture.Bitmap.Width/4)));
      10:tmpbitmap.Assign(tmpbitmap.FilterPixelate(5,false));
      11:tmpbitmap.Assign(tmpbitmap.FilterMedian(moMediumSmooth));
      12:begin
           tmpgif.SetSize(BGRAGif.Width*3,BGRAGif.Height*3);
           tmpbitmap.Assign(tmpbitmap.FilterSmartZoom3(moMediumSmooth));
         end;
      13:tmpbitmap.Negative;
      14:tmpbitmap.Assign(tmpbitmap.FilterSharpen);
      15:tmpbitmap.Assign(tmpbitmap.FilterSmooth);
      16:tmpbitmap.Assign(tmpbitmap.FilterBlurMotion(50,0,false));
      17:begin
           tmpgif.SetSize(BGRAGif.Height,BGRAGif.Width);
           tmpbitmap.Assign(tmpbitmap.RotateCW);
        end;
      18:begin
           tmpgif.SetSize(BGRAGif.Height,BGRAGif.Width);
           tmpbitmap.Assign(tmpbitmap.RotateCCW);
        end;
      19:tmpbitmap.HorizontalFlip;
      20:tmpbitmap.VerticalFlip;
      end;
      tmpgif.InsertFrame(i,tmpbitmap,0,0,BGRAGif.FrameDelayMs[i],BGRAGif.FrameDisposeMode[i],BGRAGif.FrameHasLocalPalette[i]);
    end;
    tmpbitmap.Destroy;
    BGRAGif.SetSize(BGRAGif.Width,BGRAGif.Height);
    BGRAGif:=tmpgif;
  end
  else
  begin
    if frmain.Image1.Visible then
    begin
     imgrect.Bottom:=frmain.Image1.Picture.Bitmap.Height;
     imgrect.Right:=frmain.Image1.Picture.Bitmap.Width;
     imgpoint:=TPoint.Create(Round(frmain.Image1.Picture.Bitmap.Width/2),Round(frmain.Image1.Picture.Bitmap.Height/2));
     case filter of
     1:bmp:=BGRABitMap.TBGRABitmap.Create(frmain.Image1.Picture.Bitmap).FilterGrayscale;
     2:bmp:=BGRABitMap.TBGRABitmap.Create(frmain.Image1.Picture.Bitmap).FilterPlane;
     3:bmp:=BGRABitMap.TBGRABitmap.Create(frmain.Image1.Picture.Bitmap).FilterContour;
     4:bmp:=BGRABitMap.TBGRABitmap.Create(frmain.Image1.Picture.Bitmap).FilterCylinder;
     5:bmp:=BGRABitMap.TBGRABitmap.Create(frmain.Image1.Picture.Bitmap).FilterEmboss(5);
     6:bmp:=BGRABitMap.TBGRABitmap.Create(frmain.Image1.Picture.Bitmap).FilterEmbossHighLight(true);
     7:bmp:=BGRABitMap.TBGRABitmap.Create(frmain.Image1.Picture.Bitmap).FilterNormalize;
     8:bmp:=BGRABitMap.TBGRABitmap.Create(frmain.Image1.Picture.Bitmap).FilterSphere;
     9:bmp:=BGRABitMap.TBGRABitmap.Create(frmain.Image1.Picture.Bitmap).FilterTwirl(imgrect,imgpoint,Round(frmain.Image1.Picture.Bitmap.Width/4));
     10:bmp:=BGRABitMap.TBGRABitmap.Create(frmain.Image1.Picture.Bitmap).FilterPixelate(5,false);
     11:bmp:=BGRABitMap.TBGRABitmap.Create(frmain.Image1.Picture.Bitmap).FilterMedian(moMediumSmooth);
     12:bmp:=BGRABitMap.TBGRABitmap.Create(frmain.Image1.Picture.Bitmap).FilterSmartZoom3(moMediumSmooth);
     13:begin
          bmp:=BGRABitMap.TBGRABitmap.Create(frmain.Image1.Picture.Bitmap);
          bmp.Negative;
        end;
     14:bmp:=BGRABitMap.TBGRABitmap.Create(frmain.Image1.Picture.Bitmap).FilterSharpen;
     15:bmp:=BGRABitMap.TBGRABitmap.Create(frmain.Image1.Picture.Bitmap).FilterSmooth;
     16:bmp:=BGRABitMap.TBGRABitmap.Create(frmain.Image1.Picture.Bitmap).FilterBlurMotion(50,0,false);
     17:bmp:=BGRABitMap.TBGRABitmap.Create(frmain.Image1.Picture.Bitmap).RotateCW;
     18:bmp:=BGRABitMap.TBGRABitmap.Create(frmain.Image1.Picture.Bitmap).RotateCCW;
     19:begin
          bmp:=BGRABitMap.TBGRABitmap.Create(frmain.Image1.Picture.Bitmap);
          bmp.HorizontalFlip;
        end;
     20:begin
          bmp:=BGRABitMap.TBGRABitmap.Create(frmain.Image1.Picture.Bitmap);
          bmp.VerticalFlip;
        end;
     end;
    end;
    frmain.Image1.Picture.Bitmap.Assign(bmp);
    bmp.Free;
  end;
  frmain.Caption:=title;
end;

procedure efectimagen(efect:integer;nivel:integer=5000);
////////efect 1:Flip Horizontal
////////      2:Flip Vertical
////////      3:Flip Left
////////      4:Flip Right
///////       5:BGR Color
///////       6:RBG Color
///////       7:GRB Color
///////       8:BRG Color
///////       9:GBR Color
///////       10:Bright+
///////       11:Bright-
///////       12:GrayAndRed
///////       13:GrayAndGreen
///////       14:GrayAndBlue
///////       15:QuitRed
///////       16:QuitGreen
///////       17:QuitBlue
///////       18:Noise
///////       19:Tv
var
   imagen:TLazIntfImage=nil;
   imagen2:TLazIntfImage=nil;
   xpix,ypix,ancho,alto,i,ramnum:integer;
   tmpgif:TBGRAAnimatedGif;
   tmpbitmap:BGRABitmap.TBGRABitmap;
   redbrig,greenbrig,bluebrig:word;
   inzone:boolean;
begin
  realmode;
  title:=frmain.Caption;
  frmain.Caption:='Aplicando efecto porfavor espere...';
  if ifgif and (BGRAGif.Count>1) then
  begin
    tmpgif:=TBGRAAnimatedGif.Create;
    case efect of
    1,2,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19:tmpgif.SetSize(BGRAGif.Width,BGRAGif.Height);
    3,4:tmpgif.SetSize(BGRAGif.Height,BGRAGif.Width);
    end;
    ancho:=BGRAGif.Width-1;
    alto:=BGRAGif.Height-1;
    for i:=0 to BGRAGif.Count-1 do
    begin
      case efect of
      1,2,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19:tmpbitmap:=BGRABitmap.TBGRABitmap.Create(BGRAGif.Width,BGRAGif.Height);
      3,4:tmpbitmap:=BGRABitmap.TBGRABitmap.Create(BGRAGif.Height,BGRAGif.Width);
      end;
      BGRAGif.CurrentImage:=i;
      for ypix:=0 to alto  do
      begin
        for xpix:=0 to ancho do
        begin
          case efect of
          1:tmpbitmap.Colors[ancho-xpix,ypix]:=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix];
          2:tmpbitmap.Colors[xpix,alto-ypix]:=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix];
          3:tmpbitmap.Colors[ypix,ancho-xpix]:=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix];
          4:tmpbitmap.Colors[alto-ypix,xpix]:=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix];
          5:tmpbitmap.Colors[xpix,ypix]:=FPColor(BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].alpha);
          6:tmpbitmap.Colors[xpix,ypix]:=FPColor(BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].alpha);
          7:tmpbitmap.Colors[xpix,ypix]:=FPColor(BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].alpha);
          8:tmpbitmap.Colors[xpix,ypix]:=FPColor(BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].alpha);
          9:tmpbitmap.Colors[xpix,ypix]:=FPColor(BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].alpha);
          10:begin
             if frmain.Shape1.Visible then
             begin
              if (xpix>frmain.Shape1.BaseBounds.Left) and (xpix<frmain.Shape1.BaseBounds.Right) and (ypix>frmain.Shape1.BaseBounds.Top) and (ypix<frmain.Shape1.BaseBounds.Bottom) then
                inzone:=true
              else
                inzone:=false;
             end
             else
               inzone:=true;
             if (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red<60900) and inzone then
               redbrig:=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red*138 shr 7
             else
               redbrig:=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red;

             if (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green<60900) and inzone then
               greenbrig:=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green*138 shr 7
             else
               greenbrig:=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green;

             if (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue<60900) and inzone then
               bluebrig:=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue*138 shr 7
             else
               bluebrig:=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue;

             tmpbitmap.Colors[xpix,ypix]:=FPColor(redbrig,greenbrig,bluebrig,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].alpha);
           end;
          11:begin
               redbrig:=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red*118 shr 7;
               greenbrig:=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green*118 shr 7;
               bluebrig:=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue*118 shr 7;
               tmpbitmap.Colors[xpix,ypix]:=FPColor(redbrig,greenbrig,bluebrig,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].alpha);
             end;
          12:begin
               if (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red-BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green>nivel) and (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red-BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue>nivel) and (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red>nivel) then
               begin
                 tmpbitmap.Colors[xpix,ypix]:=FPColor(BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].alpha);
               end
               else
               begin
                 if (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red>=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue) and (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red>=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green) then
                 begin
                   tmpbitmap.Colors[xpix,ypix]:=FPColor(BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].alpha);
                 end;
                 if (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green>=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue) and (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green>=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red) then
                 begin
                   tmpbitmap.Colors[xpix,ypix]:=FPColor(BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].alpha);
                 end;
                 if (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue>=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red) and (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue>=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green) then
                 begin
                   tmpbitmap.Colors[xpix,ypix]:=FPColor(BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].alpha);
                 end;
               end;
             end;
          13:begin
               if (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green-BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red>nivel) and (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green-BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue>nivel) and (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green>nivel) then
               begin
                 tmpbitmap.Colors[xpix,ypix]:=FPColor(BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].alpha);
               end
               else
               begin
                 if (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red>=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue) and (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red>=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green) then
                 begin
                   tmpbitmap.Colors[xpix,ypix]:=FPColor(BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].alpha);
                 end;
                 if (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green>=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue) and (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green>=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red) then
                 begin
                   tmpbitmap.Colors[xpix,ypix]:=FPColor(BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].alpha);
                 end;
                 if (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue>=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red) and (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue>=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green) then
                 begin
                   tmpbitmap.Colors[xpix,ypix]:=FPColor(BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].alpha);
                 end;
               end;
             end;
          14:begin
               if (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue-BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red>nivel) and (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue-BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green>nivel) and (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue>nivel) then
               begin
                 tmpbitmap.Colors[xpix,ypix]:=FPColor(BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].alpha);
               end
               else
               begin
                 if (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red>=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue) and (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red>=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green) then
                 begin
                   tmpbitmap.Colors[xpix,ypix]:=FPColor(BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].alpha);
                 end;
                 if (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green>=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue) and (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green>=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red) then
                 begin
                   tmpbitmap.Colors[xpix,ypix]:=FPColor(BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].alpha);
                 end;
                 if (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue>=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red) and (BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue>=BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green) then
                 begin
                   tmpbitmap.Colors[xpix,ypix]:=FPColor(BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].alpha);
                 end;
               end;
             end;
        15:begin
             tmpbitmap.Colors[xpix,ypix]:=FPColor(0,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].alpha);
           end;
        16:begin
             tmpbitmap.Colors[xpix,ypix]:=FPColor(BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red,0,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].alpha);
           end;
        17:begin
             tmpbitmap.Colors[xpix,ypix]:=FPColor(BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green,0,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].alpha);
           end;
        18:begin
             ramnum:=Round(Random(3));
             case ramnum of
             0:tmpbitmap.Colors[xpix,ypix]:=FPColor(BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].alpha);
             1:tmpbitmap.Colors[xpix,ypix]:=FPColor(BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].alpha);
             2:tmpbitmap.Colors[xpix,ypix]:=FPColor(BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].alpha);
             end;
           end;
        19:begin
             if odd(ypix) then
               tmpbitmap.Colors[xpix,ypix]:=FPColor(BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].red,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].green,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].blue,BGRAGif.Bitmap.Canvas.Colors[xpix,ypix].alpha);
           end;
          end;
        end;
      end;
      tmpgif.InsertFrame(i,tmpbitmap,0,0,BGRAGif.FrameDelayMs[i],BGRAGif.FrameDisposeMode[i],BGRAGif.FrameHasLocalPalette[i]);
    end;
    tmpbitmap.Destroy;
    BGRAGif.SetSize(BGRAGif.Width,BGRAGif.Height);
    BGRAGif:=tmpgif;
  end
  else
  begin
    imagen:=TLazIntfImage.Create(0,0);
    imagen2:=frmain.Image1.Picture.Bitmap.CreateIntfImage;
    imagen.DataDescription:=imagen2.DataDescription;
    ancho:=frmain.Image1.Picture.Bitmap.Width-1;
    alto:=frmain.Image1.Picture.Bitmap.Height-1;
    case efect of
    1,2,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19:imagen.SetSize(ancho+1,alto+1);
    3,4:imagen.SetSize(alto+1,ancho+1);
    end;
    for ypix:=0 to alto  do
    begin
      for xpix:=0 to ancho do
      begin
        case efect of
        1:imagen.Colors[ancho-xpix,ypix]:=imagen2.Colors[xpix,ypix];
        2:imagen.Colors[xpix,alto-ypix]:=imagen2.Colors[xpix,ypix];
        3:imagen.Colors[ypix,ancho-xpix]:=imagen2.Colors[xpix,ypix];
        4:imagen.Colors[alto-ypix,xpix]:=imagen2.Colors[xpix,ypix];
        5:imagen.Colors[xpix,ypix]:=FPColor(imagen2.Colors[xpix,ypix].blue,imagen2.Colors[xpix,ypix].green,imagen2.Colors[xpix,ypix].red,imagen2.Colors[xpix,ypix].alpha);
        6:imagen.Colors[xpix,ypix]:=FPColor(imagen2.Colors[xpix,ypix].red,imagen2.Colors[xpix,ypix].blue,imagen2.Colors[xpix,ypix].green,imagen2.Colors[xpix,ypix].alpha);
        7:imagen.Colors[xpix,ypix]:=FPColor(imagen2.Colors[xpix,ypix].green,imagen2.Colors[xpix,ypix].red,imagen2.Colors[xpix,ypix].blue,imagen2.Colors[xpix,ypix].alpha);
        8:imagen.Colors[xpix,ypix]:=FPColor(imagen2.Colors[xpix,ypix].blue,imagen2.Colors[xpix,ypix].red,imagen2.Colors[xpix,ypix].green,imagen2.Colors[xpix,ypix].alpha);
        9:imagen.Colors[xpix,ypix]:=FPColor(imagen2.Colors[xpix,ypix].green,imagen2.Colors[xpix,ypix].blue,imagen2.Colors[xpix,ypix].red,imagen2.Colors[xpix,ypix].alpha);
        10:begin
             if frmain.Shape1.Visible then
             begin
              if (xpix>frmain.Shape1.BaseBounds.Left) and (xpix<frmain.Shape1.BaseBounds.Right) and (ypix>frmain.Shape1.BaseBounds.Top) and (ypix<frmain.Shape1.BaseBounds.Bottom) then
                inzone:=true
              else
                inzone:=false;
             end
             else
               inzone:=true;
             if (imagen2.Colors[xpix,ypix].red<60900) and inzone then
               redbrig:=imagen2.Colors[xpix,ypix].red*138 shr 7
             else
               redbrig:=imagen2.Colors[xpix,ypix].red;

             if (imagen2.Colors[xpix,ypix].green<60900) and inzone then
               greenbrig:=imagen2.Colors[xpix,ypix].green*138 shr 7
             else
               greenbrig:=imagen2.Colors[xpix,ypix].green;

             if (imagen2.Colors[xpix,ypix].blue<60900) and inzone then
               bluebrig:=imagen2.Colors[xpix,ypix].blue*138 shr 7
             else
               bluebrig:=imagen2.Colors[xpix,ypix].blue;

             imagen.Colors[xpix,ypix]:=FPColor(redbrig,greenbrig,bluebrig,imagen2.Colors[xpix,ypix].alpha);
           end;
        11:begin
             redbrig:=imagen2.Colors[xpix,ypix].red*118 shr 7;
             greenbrig:=imagen2.Colors[xpix,ypix].green*118 shr 7;
             bluebrig:=imagen2.Colors[xpix,ypix].blue*118 shr 7;
             imagen.Colors[xpix,ypix]:=FPColor(redbrig,greenbrig,bluebrig,imagen2.Colors[xpix,ypix].alpha);
           end;
        12:begin
             if (imagen2.Colors[xpix,ypix].red-imagen2.Colors[xpix,ypix].green>nivel) and (imagen2.Colors[xpix,ypix].red-imagen2.Colors[xpix,ypix].blue>nivel) and (imagen2.Colors[xpix,ypix].red>nivel) then
             begin
               imagen.Colors[xpix,ypix]:=FPColor(imagen2.Colors[xpix,ypix].red,imagen2.Colors[xpix,ypix].green,imagen2.Colors[xpix,ypix].blue,imagen2.Colors[xpix,ypix].alpha);
             end
             else
             begin
               if (imagen2.Colors[xpix,ypix].red>=imagen2.Colors[xpix,ypix].blue) and (imagen2.Colors[xpix,ypix].red>=imagen2.Colors[xpix,ypix].green) then
               begin
                 imagen.Colors[xpix,ypix]:=FPColor(imagen2.Colors[xpix,ypix].red,imagen2.Colors[xpix,ypix].red,imagen2.Colors[xpix,ypix].red,imagen2.Colors[xpix,ypix].alpha);
               end;
               if (imagen2.Colors[xpix,ypix].green>=imagen2.Colors[xpix,ypix].blue) and (imagen2.Colors[xpix,ypix].green>=imagen2.Colors[xpix,ypix].red) then
               begin
                 imagen.Colors[xpix,ypix]:=FPColor(imagen2.Colors[xpix,ypix].green,imagen2.Colors[xpix,ypix].green,imagen2.Colors[xpix,ypix].green,imagen2.Colors[xpix,ypix].alpha);
               end;
               if (imagen2.Colors[xpix,ypix].blue>=imagen2.Colors[xpix,ypix].red) and (imagen2.Colors[xpix,ypix].blue>=imagen2.Colors[xpix,ypix].green) then
               begin
                 imagen.Colors[xpix,ypix]:=FPColor(imagen2.Colors[xpix,ypix].blue,imagen2.Colors[xpix,ypix].blue,imagen2.Colors[xpix,ypix].blue,imagen2.Colors[xpix,ypix].alpha);
               end;
             end;
           end;
        13:begin
             if (imagen2.Colors[xpix,ypix].green-imagen2.Colors[xpix,ypix].red>nivel) and (imagen2.Colors[xpix,ypix].green-imagen2.Colors[xpix,ypix].blue>nivel) and (imagen2.Colors[xpix,ypix].green>nivel) then
             begin
               imagen.Colors[xpix,ypix]:=FPColor(imagen2.Colors[xpix,ypix].red,imagen2.Colors[xpix,ypix].green,imagen2.Colors[xpix,ypix].blue,imagen2.Colors[xpix,ypix].alpha);
             end
             else
             begin
               if (imagen2.Colors[xpix,ypix].red>=imagen2.Colors[xpix,ypix].blue) and (imagen2.Colors[xpix,ypix].red>=imagen2.Colors[xpix,ypix].green) then
               begin
                 imagen.Colors[xpix,ypix]:=FPColor(imagen2.Colors[xpix,ypix].red,imagen2.Colors[xpix,ypix].red,imagen2.Colors[xpix,ypix].red,imagen2.Colors[xpix,ypix].alpha);
               end;
               if (imagen2.Colors[xpix,ypix].green>=imagen2.Colors[xpix,ypix].blue) and (imagen2.Colors[xpix,ypix].green>=imagen2.Colors[xpix,ypix].red) then
               begin
                 imagen.Colors[xpix,ypix]:=FPColor(imagen2.Colors[xpix,ypix].green,imagen2.Colors[xpix,ypix].green,imagen2.Colors[xpix,ypix].green,imagen2.Colors[xpix,ypix].alpha);
               end;
               if (imagen2.Colors[xpix,ypix].blue>=imagen2.Colors[xpix,ypix].red) and (imagen2.Colors[xpix,ypix].blue>=imagen2.Colors[xpix,ypix].green) then
               begin
                 imagen.Colors[xpix,ypix]:=FPColor(imagen2.Colors[xpix,ypix].blue,imagen2.Colors[xpix,ypix].blue,imagen2.Colors[xpix,ypix].blue,imagen2.Colors[xpix,ypix].alpha);
               end;
             end;
           end;
        14:begin
             if (imagen2.Colors[xpix,ypix].blue-imagen2.Colors[xpix,ypix].red>nivel) and (imagen2.Colors[xpix,ypix].blue-imagen2.Colors[xpix,ypix].green>nivel) and (imagen2.Colors[xpix,ypix].blue>nivel) then
             begin
               imagen.Colors[xpix,ypix]:=FPColor(imagen2.Colors[xpix,ypix].red,imagen2.Colors[xpix,ypix].green,imagen2.Colors[xpix,ypix].blue,imagen2.Colors[xpix,ypix].alpha);
             end
             else
             begin
               if (imagen2.Colors[xpix,ypix].red>=imagen2.Colors[xpix,ypix].blue) and (imagen2.Colors[xpix,ypix].red>=imagen2.Colors[xpix,ypix].green) then
               begin
                 imagen.Colors[xpix,ypix]:=FPColor(imagen2.Colors[xpix,ypix].red,imagen2.Colors[xpix,ypix].red,imagen2.Colors[xpix,ypix].red,imagen2.Colors[xpix,ypix].alpha);
               end;
               if (imagen2.Colors[xpix,ypix].green>=imagen2.Colors[xpix,ypix].blue) and (imagen2.Colors[xpix,ypix].green>=imagen2.Colors[xpix,ypix].red) then
               begin
                 imagen.Colors[xpix,ypix]:=FPColor(imagen2.Colors[xpix,ypix].green,imagen2.Colors[xpix,ypix].green,imagen2.Colors[xpix,ypix].green,imagen2.Colors[xpix,ypix].alpha);
               end;
               if (imagen2.Colors[xpix,ypix].blue>=imagen2.Colors[xpix,ypix].red) and (imagen2.Colors[xpix,ypix].blue>=imagen2.Colors[xpix,ypix].green) then
               begin
                 imagen.Colors[xpix,ypix]:=FPColor(imagen2.Colors[xpix,ypix].blue,imagen2.Colors[xpix,ypix].blue,imagen2.Colors[xpix,ypix].blue,imagen2.Colors[xpix,ypix].alpha);
               end;
             end;
           end;
        15:begin
             imagen.Colors[xpix,ypix]:=FPColor(0,imagen2.Colors[xpix,ypix].green,imagen2.Colors[xpix,ypix].blue,imagen2.Colors[xpix,ypix].alpha);
           end;
        16:begin
             imagen.Colors[xpix,ypix]:=FPColor(imagen2.Colors[xpix,ypix].red,0,imagen2.Colors[xpix,ypix].blue,imagen2.Colors[xpix,ypix].alpha);
           end;
        17:begin
             imagen.Colors[xpix,ypix]:=FPColor(imagen2.Colors[xpix,ypix].red,imagen2.Colors[xpix,ypix].green,0,imagen2.Colors[xpix,ypix].alpha);
           end;
        18:begin
             ramnum:=Round(Random(3));
             case ramnum of
             0:imagen.Colors[xpix,ypix]:=FPColor(imagen2.Colors[xpix,ypix].red,imagen2.Colors[xpix,ypix].green,imagen2.Colors[xpix,ypix].blue,imagen2.Colors[xpix,ypix].alpha);
             1:imagen.Colors[xpix,ypix]:=FPColor(imagen2.Colors[xpix,ypix].blue,imagen2.Colors[xpix,ypix].green,imagen2.Colors[xpix,ypix].red,imagen2.Colors[xpix,ypix].alpha);
             2:imagen.Colors[xpix,ypix]:=FPColor(imagen2.Colors[xpix,ypix].green,imagen2.Colors[xpix,ypix].blue,imagen2.Colors[xpix,ypix].red,imagen2.Colors[xpix,ypix].alpha);
             end;
           end;
        19:begin
             if odd(ypix) then
               imagen.Colors[xpix,ypix]:=FPColor(imagen2.Colors[xpix,ypix].red,imagen2.Colors[xpix,ypix].green,imagen2.Colors[xpix,ypix].blue,imagen2.Colors[xpix,ypix].alpha);
           end;
        end;
      end;
    end;
    frmain.Image1.Picture.Bitmap.LoadFromIntfImage(imagen);
    frmain.Image1.AntialiasingMode:=amOn;
    imagen.Destroy;
    imagen2.Destroy;
  end;
  frmain.Caption:=title;
end;

procedure loadfiles(place:string;fname:string);
var
   nombre:String;
   finfo:TSearchRec;
   contador:LongInt;
   flisttmp:TStringList;
   nfiletmp:integer;
   wplace:UnicodeString;
begin
  {$IFDEF WINDOWS}
  wplace:=UTF16LongName(place);
  {$ELSE}
  wplace:=place;
  {$ENDIF}
  full:=false;
  fwidth:=frmain.Width;
  fheight:=frmain.Height;
  fxpos:=frmain.Top;
  fypos:=frmain.Left;
  nombre:=fname;
  contador:=0;
  nfiletmp:=0;
  flisttmp:=TStringList.Create;
  if FindFirst(wplace+'*',faAnyFile,finfo)=0 then
  begin
    repeat
      Inc(contador);
      with finfo do
      begin
        if (Attr and faDirectory)<>faDirectory then
        begin
          case UpperCase(ExtractFileExt(Name)) of
            '.JPG','.JPEG','.JPE','.JFIF','.BMP','.GIF','.PNG','.ICO','.XPM','.PBM','.PPM','.ICNS','.CUR','.TIF','.TIFF','.PCX','.TGA','.PSD','.XWD':
            begin
              flisttmp.Add(Name);
              Inc(nfiletmp);
            end;
            else
            begin
              ///Add the file name and the same files width this extencion to try to view
              if ((Name=fname) or (UpperCase(ExtractFileExt(Name))=UpperCase(ExtractFileExt(fname)))) and (fname<>'') then
              begin
                flisttmp.Add(Name);
                Inc(nfiletmp);
              end;
            end;
          end;
        end;
      end;
    until FindNextUTF8(finfo)<>0 ;
  end;
  SysUtils.FindClose(finfo);
  if nfiletmp>0 then
  begin
    nfile:=nfiletmp;
    if Assigned(flist) then
      flist.Clear
    else
      flist:=TStringList.Create;
    flist.Assign(flisttmp);

    carpeta:=place;

    if nombre <> '' then
    begin
      ifile:=flist.IndexOf(nombre);
      if starting=false then
        loadpicture(place+nombre);
    end
    else
    begin
      ifile:=0;
      if (ifile<flist.Count) {and (starting=false)} then
        loadpicture(place+flist[ifile]);
    end;

    starting:=false;
    if (frmain.mnuShowThumbs.Checked) then
    begin
      refreshthumbs;
      ththumbs:=thumbsthread.Create(true);
      ththumbs.thumbpath:=place;
      ththumbs.Start;
    end;
  end;
  flisttmp.Destroy;
end;
procedure Tfrmain.FormCreate(Sender: TObject);
var
   i:integer;
   ruta:string;
begin
  frmain.Image1.Width:=frmain.ScrollBox1.Width;
  frmain.Image1.Height:=frmain.ScrollBox1.Height;
  ruta:=ExtractFilePath(Application.Params[1]);
  if Application.Params[1] <> '' then
  begin
    loadfiles(ruta,ExtractFileName(Application.Params[1]));
    if DirectoryExists(ruta) then
      frmain.ShellTreeView1.Path:=ruta;
  end;
  frmain.ShellTreeView1.Items.AddFirst(nil,'Mis documentos').StateIndex:=29;
  frmain.ShellTreeView1.Items.AddFirst(nil,'Mis imágenes').StateIndex:=27;
  frmain.ShellTreeView1.Items.AddFirst(nil,'Escritorio').StateIndex:=28;
  for i:=3 to frmain.ShellTreeView1.Items.Count-1 do
  begin
    frmain.ShellTreeView1.Items[i].StateIndex:=16;
  end;
  frmain.ShellTreeView1.OnSelectionChanged:=@ShellTreeView1SelectionChanged;
  if frmain.MenuItem59.Checked then
    frmain.Splitter1.Left:=200
  else
    frmain.Splitter1.Left:=0-frmain.Splitter1.Width;
end;

procedure Tfrmain.FormDestroy(Sender: TObject);
begin
  if Assigned(flist) then
    flist.Destroy;
  refreshthumbs;
  if frmain.Image1.Picture.Bitmap.Empty=false then
    frmain.Image1.Picture.Clear;
end;

procedure Tfrmain.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin

end;

procedure Tfrmain.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
  );
begin
 case Key of
  38://Flecha arriba
   begin
     if Shift=[ssAlt] then
       frmain.Image1.Top:=frmain.Image1.Top+20
     else
       prevfile();
   end;
  39,32://Flecha derecha, espacio
   begin
     if Shift=[ssAlt] then
       frmain.Image1.Left:=frmain.Image1.Left-20
     else
       nextfile();
   end;
  40://Flecha abajo
   begin
     if Shift=[ssAlt] then
       frmain.Image1.Top:=frmain.Image1.Top-20
     else
       nextfile();
   end;
  37,8://Flacha izquierda, BackSpace
    begin
      if Shift=[ssAlt] then
        frmain.Image1.Left:=frmain.Image1.Left+20
      else
        prevfile();
    end;
  13,70:
    begin//Enter, F
      fullsc();
    end;
  27,81://Escape, Q
    begin
      Application.Terminate;
    end;
  72://Letra H
    begin
    //if not ifgif then
    //fliphimage();
    end;
  73://Letra i
    begin
      filterimagen(13);
    end;
  86://Letra V
    begin
    //if not ifgif then
    //flipvimage();
    end;
  82://Letra R
    begin
    //if not ifgif then
    //fliprimage();
    end;
  76://Letra L
    begin
    //if not ifgif then
    //fliplimage();
    end;
  107://Tecla +
    begin
      zoomin();
    end;
  109://Tecla -
    begin
      zoomout();
    end;
  111://Tecla /
    begin
      zoomoriginal();
    end;
  79://Tecla O
    begin
      osd();
    end;
  106://Tecla *
    begin
      zoomnormal();
    end;
  34://Page Down
    begin
      dec(idir);
    //loadfiles(carpeta+dlist[idir],'');
    end;
  116://F5
    begin
      if Assigned(flist) then
        loadpicture(carpeta+flist[ifile]);
    end;
  188://Tecla <,
    begin
      //efectbrigthminus(118);
    end;
  190://Tecla >.
    begin
      //efectbrigthplus(138);
    end;
 end;

end;

procedure Tfrmain.FormKeyPress(Sender: TObject; var Key: char);
begin
  //ShowMessage(Key);
end;

procedure Tfrmain.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if frmain.ToolButton18.Down=false then
  begin
    imgx:=X+frmain.Image1.ClientOrigin.x-frmain.Image1.Left;
    imgy:=Y+frmain.Image1.ClientOrigin.Y-frmain.Image1.Top;
    startdraw:=true;
  end
  else
  begin
    imgx:=X;
    imgy:=Y;
    startselect:=true;
  end;
end;

procedure Tfrmain.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if frmain.Image1.Stretch then
    frmain.Image1.Cursor:=crSizeAll
  else
    frmain.Image1.Cursor:=crDefault;

  hidetoolbardelay:=5;

  if frmain.mnuShowThumbs.Checked then
    frmain.ToolBar1.Top:=frmain.pssThumbs.Top-frmain.ToolBar1.Height
  else
    frmain.ToolBar1.Top:=screen.Height-frmain.ToolBar1.Height;

  frmain.ToolBar1.Left:=Round((screen.Width-frmain.ToolBar1.Width)/2);

  if full and (frmain.ToolBar1.Visible=false) then
    frmain.ToolBar1.Visible:=true;

  if startdraw and (not startselect) then
  begin
    frmain.Image1.Anchors:=[];
    frmain.Image1.Left:=mouse.CursorPos.x-imgx;
    frmain.Image1.Top:=mouse.CursorPos.y-imgy;
  end;
  if startselect then
  begin
    frmain.Shape1.Visible:=true;
    frmain.Shape1.SetBounds(imgx,imgy,X-imgx,Y-imgy);
  end;
end;

procedure Tfrmain.FormMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  if WheelDelta>0 then
    zoomin(true)
  else
    zoomout(true);
end;

procedure Tfrmain.FormResize(Sender: TObject);
begin
  if frmain.mnuShowThumbs.Checked then
    frmain.psVertical.Position:=(frmain.psVertical.Height-thumbsize)-18
  else
    frmain.psVertical.Position:=frmain.psVertical.Height;
end;

procedure Tfrmain.FormShow(Sender: TObject);
begin
  if Assigned(flist) then
  begin
    if (ifile<flist.Count) then
      loadpicture(carpeta+flist[ifile]);
  end;
  frmain.pssThumbs.OnResize:=@frmain.PairSplitterSide2Resize;
end;

procedure Tfrmain.FormWindowStateChange(Sender: TObject);
begin
  if Assigned(flist) and modethumb and frmain.Image1.Visible and (ifgif=false) then
  begin
    if (frmain.MenuItem58.Checked=false) and ((frmain.WindowState=wsMaximized) or (frmain.WindowState=wsNormal) or (frmain.WindowState=wsFullScreen)) then
      loadpicture(carpeta+flist[ifile],false);
  end;
end;

procedure Tfrmain.Image1Click(Sender: TObject);
begin
  if startselect=false then
    frmain.Shape1.Visible:=false;
end;

procedure Tfrmain.Image1DblClick(Sender: TObject);
begin
  fullsc();
end;


procedure Tfrmain.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  startdraw:=false;
  startselect:=false;
  //frmain.Image1.Anchors:=[akTop,akLeft,akRight,akBottom];
end;

procedure Tfrmain.Image1Resize(Sender: TObject);
begin

end;


procedure Tfrmain.MenuItem10Click(Sender: TObject);
begin
  OpenPictureDialog1.InitialDir:=carpeta;
  OpenPictureDialog1.Execute;
  if FileExists(UTF8ToSys(OpenPictureDialog1.FileName)) then
  begin
  //if flist.Count>0 then
  //flist.Clear;
    loadfiles(ExtractFilePath(ExpandFileNameUTF8(OpenPictureDialog1.FileName)),ExtractFileName(OpenPictureDialog1.FileName));
    frmain.ShellTreeView1.OnSelectionChanged:=nil;
    if DirectoryExists(ExtractFilePath(ExpandFileNameUTF8(OpenPictureDialog1.FileName))) then
      frmain.ShellTreeView1.Path:=ExtractFilePath(ExpandFileNameUTF8(OpenPictureDialog1.FileName));
    frmain.ShellTreeView1.OnSelectionChanged:=@ShellTreeView1SelectionChanged;
  end;
end;

procedure Tfrmain.MenuItem13Click(Sender: TObject);
begin
  modethumb:=false;
  if ifgif then
  begin
    frmain.Timer3.Enabled:=false;
    frmain.Image1.Visible:=true;
    frmain.Image1.Picture.Clear;
    frmain.Image1.Picture.LoadFromClipboardFormat(2);
  end
  else
  begin
    frmain.Image1.Picture.Clear;
    frmain.Image1.Picture.LoadFromClipboardFormat(2);
  end;
  frmain.tbFlipHorizontal.Enabled:=true;
  frmain.tbFlipVertical.Enabled:=true;
  frmain.ToolButton6.Enabled:=true;
  frmain.ToolButton7.Enabled:=true;
  frmain.ToolButton9.Enabled:=true;
  frmain.ToolButton10.Enabled:=true;
  frmain.ToolButton11.Enabled:=true;
  frmain.ToolButton14.Enabled:=true;
  frmain.ToolButton15.Enabled:=true;
  frmain.MenuItem6.Enabled:=true;
  frmain.MenuItem7.Enabled:=true;
  frmain.MenuItem8.Enabled:=true;
  frmain.MenuItem9.Enabled:=true;
  frmain.MenuItem16.Enabled:=true;
  frmain.MenuItem14.Enabled:=true;
  frmain.MenuItem7.Enabled:=true;
  frmain.MenuItem8.Enabled:=true;
  frmain.MenuItem14.Enabled:=true;
  frmain.MenuItem15.Enabled:=true;
  frmain.MenuItem31.Enabled:=true;
  ifgif:=false;
  frmain.StatusBar1.Panels.Items[1].Text:='Resolucion:'+inttostr(frmain.Image1.Picture.Width)+'x'+inttostr(frmain.Image1.Picture.Height);
  frmain.Caption:='LazView [Clipboard]';
end;

procedure Tfrmain.MenuItem14Click(Sender: TObject);
var
   recorte:TBGRABitmap;
begin
  if frmain.Shape1.Visible then
  begin
    recorte:=TBGRABitmap.Create(frmain.Shape1.BaseBounds.Width,frmain.Shape1.BaseBounds.Height);
  end
  else
    frmain.Image1.Picture.Bitmap.SaveToClipboardFormat(2);
end;

procedure Tfrmain.MenuItem16Click(Sender: TObject);
var
   confirmar:boolean=true;
   filtroext:string;
   calidadjpg:integer;
   i:integer;
   bgrtmp:TBGRABitmap;
begin
  if Assigned(flist) then
    frmain.SavePictureDialog1.FileName:=flist[ifile]
  else
    frmain.SavePictureDialog1.FileName:='IMAGEN.BMP';
  for i:=1 to 5 do
  begin
    frmain.SavePictureDialog1.FilterIndex:=i;
    //ShowMessage('.'+UpperCase(frmain.SavePictureDialog1.GetFilterExt)+' ---- '+UpperCase(ExtractFileExt(frmain.SavePictureDialog1.FileName)));
    if UpperCase('.'+frmain.SavePictureDialog1.GetFilterExt)=UpperCase(ExtractFileExt(frmain.SavePictureDialog1.FileName)) then
      break;
  end;
  frmain.SavePictureDialog1.Execute;
  filtroext:=StringReplace(frmain.SavePictureDialog1.GetFilterExt,'*','',[rfReplaceAll]);
  if filtroext='.' then
    filtroext:=ExtractFileExt(frmain.SavePictureDialog1.FileName);
  if frmain.SavePictureDialog1.UserChoice={$IFDEF WINDOWS}1{$ELSE}2{$ENDIF} then
  begin
    if FileExists(ExtractFilePath(frmain.SavePictureDialog1.FileName)+pathdelim+ExtractFileName(frmain.SavePictureDialog1.FileName)+'.'+frmain.SavePictureDialog1.GetFilterExt) then
      confirmar:=(Application.MessageBox('Desea reemplazar la imagen?','Confirmar',MB_ICONQUESTION + MB_YESNO)=IDYES)
    else
    begin
      confirmar:=true;
    end;
    if confirmar then
    begin
      case frmain.SavePictureDialog1.FilterIndex of
        1:
        begin
          Form3.ShowModal;
          calidadjpg:=Form3.TrackBar1.Position;
          frmain.Image1.Picture.Jpeg.CompressionQuality:=calidadjpg;
          frmain.Image1.Refresh;
          frmain.Image1.Picture.Jpeg.SaveToFile(ExtractFilePath(frmain.SavePictureDialog1.FileName)+pathdelim+ExtractFileName(frmain.SavePictureDialog1.FileName)+'.'+frmain.SavePictureDialog1.GetFilterExt);
        end;
        2:frmain.Image1.Picture.PNG.SaveToFile(ExtractFilePath(frmain.SavePictureDialog1.FileName)+pathdelim+ExtractFileName(frmain.SavePictureDialog1.FileName)+'.'+frmain.SavePictureDialog1.GetFilterExt);
        3:frmain.Image1.Picture.Bitmap.SaveToFile(ExtractFilePath(frmain.SavePictureDialog1.FileName)+pathdelim+ExtractFileName(frmain.SavePictureDialog1.FileName)+'.'+frmain.SavePictureDialog1.GetFilterExt);
        4:frmain.Image1.Picture.Icon.SaveToFile(ExtractFilePath(frmain.SavePictureDialog1.FileName)+pathdelim+ExtractFileName(frmain.SavePictureDialog1.FileName)+'.'+frmain.SavePictureDialog1.GetFilterExt);
        5:
         begin
           if ifgif then
           begin
             BGRAGif.SaveToFile(ExtractFilePath(frmain.SavePictureDialog1.FileName)+pathdelim+ExtractFileName(frmain.SavePictureDialog1.FileName)+'.'+frmain.SavePictureDialog1.GetFilterExt);
           end
           else
           begin
             BGRAgif:=TBGRAAnimatedGif.Create;
             bgrtmp:=TBGRABitmap.Create(frmain.Image1.Picture.Bitmap);
             BGRAgif.SetSize(bgrtmp.Width,bgrtmp.Height);
             BGRAgif.InsertFrame(0,bgrtmp,0,0,0,dmKeep,true);
             frmain.Image1.Picture.Assign(bgrtmp);
             BGRAGif.SaveToFile(ExtractFilePath(frmain.SavePictureDialog1.FileName)+pathdelim+ExtractFileName(frmain.SavePictureDialog1.FileName)+'.'+frmain.SavePictureDialog1.GetFilterExt);
             bgrtmp.Destroy;
             BGRAGif.Destroy;
           end;
         end
      end;
      ShowMessage('Done!!');
    end;
  end;
end;

procedure Tfrmain.MenuItem17Click(Sender: TObject);
begin
  filterimagen(1);
end;

procedure Tfrmain.MenuItem20Click(Sender: TObject);
begin
  efectimagen(5);
end;

procedure Tfrmain.MenuItem21Click(Sender: TObject);
begin
  efectimagen(6);
end;

procedure Tfrmain.MenuItem22Click(Sender: TObject);
begin
  efectimagen(7);;
end;

procedure Tfrmain.MenuItem23Click(Sender: TObject);
begin
  efectimagen(15);
end;

procedure Tfrmain.MenuItem24Click(Sender: TObject);
begin
  efectimagen(16);
end;

procedure Tfrmain.MenuItem25Click(Sender: TObject);
begin
  efectimagen(17);
end;

procedure Tfrmain.MenuItem27Click(Sender: TObject);
begin
  efectimagen(18);
end;

procedure Tfrmain.MenuItem28Click(Sender: TObject);
begin
  efectimagen(19);
end;

procedure Tfrmain.MenuItem2Click(Sender: TObject);
begin

end;

procedure Tfrmain.mnuShowThumbsClick(Sender: TObject);
begin
  frmain.mnuShowThumbs.Checked:=not frmain.mnuShowThumbs.Checked;
  frmain.tbShowThumbs.Down:=frmain.mnuShowThumbs.Checked;
  showthumbs:=frmain.mnuShowThumbs.Checked;
  if showthumbs=false then
  begin
    frmain.pssThumbs.OnResize:=nil;
    frmain.psVertical.Position:=frmain.psVertical.Height;
    frmain.sboxthumb.Visible:=false;
    frmain.pssThumbs.OnResize:=@frmain.PairSplitterSide2Resize;
    //refreshthumbs;
  end
  else
  begin
    frmain.sboxthumb.Visible:=true;
    frmain.psVertical.Position:=frmain.psVertical.Height-64-18;
    if folderchange then
    begin
      refreshthumbs;
      ththumbs:=thumbsthread.Create(true);
      ththumbs.thumbpath:=carpeta;
      ththumbs.Start;
    end;
  end;
end;

procedure Tfrmain.MenuItem31Click(Sender: TObject);
begin
  frresize.SpinEdit1.Value:=realimgwidth;
  frresize.SpinEdit2.Value:=realimgheight;
  frresize.ShowModal;
  if okresize then
    resizeto(frresize.SpinEdit1.Value,frresize.SpinEdit2.Value);
end;

procedure Tfrmain.MenuItem33Click(Sender: TObject);
begin
  efectimagen(8);
end;

procedure Tfrmain.MenuItem34Click(Sender: TObject);
begin
 efectimagen(9);
end;

procedure Tfrmain.MenuItem36Click(Sender: TObject);
begin
  efectimagen(10);
end;

procedure Tfrmain.MenuItem37Click(Sender: TObject);
begin
  efectimagen(11);
end;

procedure Tfrmain.MenuItem39Click(Sender: TObject);
begin
  efectimagen(12);
end;

procedure Tfrmain.MenuItem3Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure Tfrmain.MenuItem40Click(Sender: TObject);
begin
  efectimagen(13);
end;

procedure Tfrmain.MenuItem41Click(Sender: TObject);
begin
  efectimagen(14);
end;

procedure Tfrmain.MenuItem43Click(Sender: TObject);
begin
  if (full=false) and (compactmode=false) then
  begin
    fwidth:=frmain.Width;
    fheight:=frmain.Height;
    frmain.ToolBar1.Visible:=false;
    frmain.StatusBar1.Visible:=false;
    frmain.psVertical.AnchorSideTop.Control:=frmain;
    frmain.psVertical.AnchorSideTop.Side:=asrTop;
    frmain.Splitter1.AnchorSideTop.Control:=frmain;
    frmain.Splitter1.AnchorSideTop.Side:=asrTop;
    frmain.psVertical.AnchorSideBottom.Control:=frmain;
    frmain.psVertical.AnchorSideBottom.Side:=asrBottom;
    frmain.Splitter1.AnchorSideBottom.Control:=frmain;
    frmain.Splitter1.AnchorSideBottom.Side:=asrBottom;
    frmain.MainMenu1.Items.Visible:=false;
    compactmode:=true;
  end
  else
  begin
    if compactmode then
    begin
      fullsc;
      fullsc;
      compactmode:=false;
    end;
  end;
end;

procedure Tfrmain.MenuItem44Click(Sender: TObject);
begin
   Form5.Edit1.Text:=inttostr(ifile+1);
   Form5.ShowModal;
   if Form5.Edit1.Text<>'' then
   begin
    if (isgo=true) and (strtoint(Form5.Edit1.Text)<=flist.Count) and (strtoint(Form5.Edit1.Text)>0) then
    begin
    ifile:=strtoint(Form5.Edit1.Text)-1;
    loadpicture(carpeta+flist[ifile]);
    end;
   end;
end;

procedure Tfrmain.MenuItem46Click(Sender: TObject);
begin
  if frmain.Image1.AntialiasingMode=amOn then
  begin
    frmain.Image1.AntialiasingMode:=amOff;
    frmain.MenuItem46.Checked:=false;
  end
  else
  begin
    frmain.Image1.AntialiasingMode:=amOn;
    frmain.MenuItem46.Checked:=true;
  end;
end;

procedure Tfrmain.MenuItem49Click(Sender: TObject);
begin
  setwallpaper('2');
end;

procedure Tfrmain.MenuItem50Click(Sender: TObject);
begin
  setwallpaper('0');
end;

procedure Tfrmain.MenuItem51Click(Sender: TObject);
begin
  setwallpaper('','1');
end;

procedure Tfrmain.MenuItem52Click(Sender: TObject);
begin
  setwallpaper('1');
end;

procedure Tfrmain.MenuItem53Click(Sender: TObject);
begin
  frmain.MenuItem64.Checked:=false;
  frmain.MenuItem65.Checked:=false;
  frmain.MenuItem66.Checked:=false;
  frmain.MenuItem53.Checked:=true;
  Form6.ShowModal;
  frmain.psVertical.Position:=frmain.psVertical.Height-Form6.SpinEdit1.Value-18;
end;

procedure Tfrmain.MenuItem54Click(Sender: TObject);
begin
  if frmain.ToolButton24.Down then
  begin
    frmain.ToolButton24.Down:=false;
    frmain.MenuItem24.Checked:=false;
    zoomnormal();
  end
  else
  begin
    frmain.ToolButton24.Down:=true;
    frmain.MenuItem24.Checked:=true;
    zoomstrech();
  end;
end;

procedure Tfrmain.MenuItem55Click(Sender: TObject);
begin
  Form4.Show;
end;

procedure Tfrmain.MenuItem56Click(Sender: TObject);
begin
  filterimagen(13);
end;

procedure Tfrmain.MenuItem57Click(Sender: TObject);
begin
  filterimagen(15);
end;

procedure Tfrmain.MenuItem58Click(Sender: TObject);
begin
  frmain.MenuItem58.Checked:=not frmain.MenuItem58.Checked;
  if Assigned(flist) and frmain.Image1.Visible then
  begin
    loadpicture(carpeta+flist[ifile]);
  end;
end;

procedure Tfrmain.MenuItem59Click(Sender: TObject);
begin
  frmain.MenuItem59.Checked:=not frmain.MenuItem59.Checked;
  frmain.tbShowTreeView.Down:=frmain.MenuItem59.Checked;
  if frmain.MenuItem59.Checked then
    frmain.Splitter1.Left:=200
  else
    frmain.Splitter1.Left:=0-frmain.Splitter1.Width;
  frmain.ShellTreeView1.Visible:=frmain.MenuItem59.Checked;
  if frmain.MenuItem61.Checked=false then
  begin
    frmain.ToolBar1.Visible:=false;
    frmain.Splitter1.AnchorSideTop.Control:=frmain;
    frmain.Splitter1.AnchorSideTop.Side:=asrTop;
  end
  else
  begin
    frmain.ToolBar1.Visible:=true;
    frmain.Splitter1.AnchorSideTop.Control:=frmain.ToolBar1;
    frmain.Splitter1.AnchorSideTop.Side:=asrBottom;
  end;
  if frmain.MenuItem62.Checked then
  begin
    frmain.Splitter1.AnchorSideBottom.Control:=frmain.StatusBar1;
    frmain.Splitter1.AnchorSideBottom.Side:=asrTop;
  end
  else
  begin
    frmain.Splitter1.AnchorSideBottom.Control:=frmain;
    frmain.Splitter1.AnchorSideBottom.Side:=asrBottom;
  end;
end;

procedure Tfrmain.MenuItem5Click(Sender: TObject);
begin
  ShowMessage('Imagen viewer: LazView'+#13#10+'Version: 0.1'+#13#10+'Created by: nenirey@gmail.com'+#13#10+'CopyLeft: 2018');
end;

procedure Tfrmain.MenuItem61Click(Sender: TObject);
begin
  if frmain.ToolBar1.Visible then
  begin
    frmain.ToolBar1.Visible:=false;
    frmain.psVertical.AnchorSideTop.Control:=frmain;
    frmain.psVertical.AnchorSideTop.Side:=asrTop;
    frmain.Splitter1.AnchorSideTop.Control:=frmain;
    frmain.Splitter1.AnchorSideTop.Side:=asrTop;
  end
  else
  begin
    frmain.ToolBar1.Visible:=true;
    frmain.psVertical.AnchorSideTop.Control:=frmain.ToolBar1;
    frmain.psVertical.AnchorSideTop.Side:=asrBottom;
    frmain.Splitter1.AnchorSideTop.Control:=frmain.ToolBar1;
    frmain.Splitter1.AnchorSideTop.Side:=asrBottom;
  end;
  frmain.MenuItem61.Checked:=frmain.ToolBar1.Visible;
end;

procedure Tfrmain.MenuItem62Click(Sender: TObject);
begin
  frmain.StatusBar1.Visible:=not frmain.StatusBar1.Visible;
  frmain.MenuItem62.Checked:=frmain.StatusBar1.Visible;
  if frmain.StatusBar1.Visible then
  begin
    frmain.psVertical.AnchorSideBottom.Control:=frmain.StatusBar1;
    frmain.psVertical.AnchorSideBottom.Side:=asrTop;
  end
  else
  begin
    frmain.psVertical.AnchorSideBottom.Control:=frmain;
    frmain.psVertical.AnchorSideBottom.Side:=asrBottom;
  end;
  if frmain.MenuItem62.Checked then
  begin
    frmain.Splitter1.AnchorSideBottom.Control:=frmain.StatusBar1;
    frmain.Splitter1.AnchorSideBottom.Side:=asrTop;
  end
  else
  begin
    frmain.Splitter1.AnchorSideBottom.Control:=frmain;
    frmain.Splitter1.AnchorSideBottom.Side:=asrBottom;
  end;
end;

procedure Tfrmain.MenuItem64Click(Sender: TObject);
begin
  frmain.MenuItem64.Checked:=true;
  frmain.MenuItem65.Checked:=false;
  frmain.MenuItem66.Checked:=false;
  frmain.MenuItem53.Checked:=false;

  frmain.psVertical.Position:=frmain.psVertical.Height-32-18;
end;

procedure Tfrmain.MenuItem65Click(Sender: TObject);
begin
  frmain.MenuItem64.Checked:=false;
  frmain.MenuItem65.Checked:=true;
  frmain.MenuItem66.Checked:=false;
  frmain.MenuItem53.Checked:=false;
  frmain.psVertical.Position:=frmain.psVertical.Height-64-18;
end;

procedure Tfrmain.MenuItem66Click(Sender: TObject);
begin
  frmain.MenuItem64.Checked:=false;
  frmain.MenuItem65.Checked:=false;
  frmain.MenuItem66.Checked:=true;
  frmain.MenuItem53.Checked:=false;
  frmain.psVertical.Position:=frmain.psVertical.Height-128-18;
end;

procedure Tfrmain.MenuItem67Click(Sender: TObject);
begin
  if frmain.MenuItem67.Checked then
  begin
    mosaic.Clear;
    frmain.ScrollBox1.Repaint;
  end
  else
  begin
    mosaic:=Graphics.TBitmap.Create;
    rendermosaic;
  end;
  frmain.MenuItem67.Checked:=not frmain.MenuItem67.Checked;
  frmain.Image1.Repaint;
end;

procedure Tfrmain.MenuItem68Click(Sender: TObject);
begin
  filterimagen(9);
end;

procedure Tfrmain.MenuItem69Click(Sender: TObject);
begin
  try
    frmain.MainMenu1.Items.Visible:=not frmain.MainMenu1.Items.Visible;
    frmain.MenuItem69.Checked:=frmain.MainMenu1.Items.Visible;
  except on e:exception do

  end;
end;

procedure Tfrmain.MenuItem6Click(Sender: TObject);
begin
  if (realimgwidth>256) or ifgif then
    filterimagen(19)
  else
    efectimagen(1);
end;

procedure Tfrmain.MenuItem7Click(Sender: TObject);
begin
  if (realimgwidth>256) or ifgif then
    filterimagen(20)
  else
    efectimagen(2);
end;

procedure Tfrmain.MenuItem8Click(Sender: TObject);
begin
  if (realimgwidth>256) or ifgif then
    filterimagen(18)
  else
    efectimagen(3);
end;

procedure Tfrmain.MenuItem9Click(Sender: TObject);
begin
  if (realimgwidth>256) or ifgif then
    filterimagen(17)
  else
    efectimagen(4);
end;

procedure Tfrmain.PairSplitter2Resize(Sender: TObject);
begin

end;

procedure Tfrmain.PairSplitterSide2Resize(Sender: TObject);
begin
  thumbsize:=frmain.sboxthumb.Height-18;
  frmain.Timer4.Enabled:=true;
end;

procedure Tfrmain.PairSplitterSide3Resize(Sender: TObject);
begin
  if frmain.Splitter1.Left<>0 then
  begin
    frmain.ShellTreeView1.Visible:=true;
    frmain.MenuItem59.Checked:=true;
  end;
end;

procedure Tfrmain.PopupMenu1Popup(Sender: TObject);
var
   i,s:integer;
   mi:TMenuItem;
   sm:TMenuItem;
begin
 if frmain.PopupMenu1.Items.Count<2 then
 begin
   for i:=0 to frmain.MainMenu1.Items.Count-1 do
   begin
     mi:=TMenuItem.Create(frmain.PopupMenu1);
     mi.Caption:=frmain.MainMenu1.Items[i].Caption;
     frmain.PopupMenu1.Items.Add(mi);
     for s:=0 to frmain.MainMenu1.Items[i].Count-1 do
     begin
       sm:=TMenuItem.Create(frmain.PopupMenu1);
       sm.Caption:=frmain.MainMenu1.Items[i].Items[s].Caption;
       sm.OnClick:=frmain.MainMenu1.Items[i].Items[s].OnClick;
       sm.Checked:=frmain.MainMenu1.Items[i].Items[s].Checked;
       sm.Enabled:=frmain.MainMenu1.Items[i].Items[s].Enabled;
       frmain.PopupMenu1.Items[i].Add(sm);
     end;
   end;
 end;
  for i:=0 to frmain.MainMenu1.Items.Count-1 do
  begin
    for s:=0 to frmain.MainMenu1.Items[i].Count-1 do
    begin
      frmain.PopupMenu1.Items[i].Items[s].Caption:=frmain.MainMenu1.Items[i].Items[s].Caption;
      frmain.PopupMenu1.Items[i].Items[s].Checked:=frmain.MainMenu1.Items[i].Items[s].Checked;
      frmain.PopupMenu1.Items[i].Items[s].Enabled:=frmain.MainMenu1.Items[i].Items[s].Enabled;
    end;
  end;
end;

procedure Tfrmain.ScrollBox1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure Tfrmain.ScrollBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin

end;

procedure Tfrmain.ScrollBox1MouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin

end;

procedure Tfrmain.ScrollBox1Paint(Sender: TObject);
begin
  if frmain.MenuItem67.Checked then
    frmain.ScrollBox1.Canvas.Draw(0,0,mosaic);
end;

procedure Tfrmain.sboxthumbMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  mosaicmousedown:=true;
  mosaicscrollposition:=frmain.sboxthumb.HorzScrollBar.Position;
  mosaicmouseposition:=X;
end;

procedure Tfrmain.sboxthumbMouseLeave(Sender: TObject);
begin
  mosaicmousedown:=false;
end;

procedure Tfrmain.sboxthumbMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if mosaicmousedown then
  begin
    frmain.sboxthumb.HorzScrollBar.Position:=mosaicscrollposition-(X-mosaicmouseposition);
  end;
end;

procedure Tfrmain.sboxthumbMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  mosaicmousedown:=false;
end;

procedure Tfrmain.ShellTreeView1Change(Sender: TObject; Node: TTreeNode);
begin
  if Node.Parent=nil then
  begin
    case Node.Index of
      0:
       begin
         {$IFDEF WINDOWS}
         frmain.ShellTreeView1.Path:=GetWindowsSpecialDir(CSIDL_DESKTOPDIRECTORY);
         {$ENDIF}
       end;
      1:
       begin
         {$IFDEF WINDOWS}
         frmain.ShellTreeView1.Path:=GetWindowsSpecialDir(CSIDL_MYPICTURES);
         {$ENDIF}
       end;
       2:
       begin
         {$IFDEF WINDOWS}
         frmain.ShellTreeView1.Path:=GetWindowsSpecialDir(CSIDL_PERSONAL);
         {$ENDIF}
       end;
    end;
  end;
end;

procedure Tfrmain.ShellTreeView1Click(Sender: TObject);
begin

end;

procedure Tfrmain.ShellTreeView1Expanded(Sender: TObject; Node: TTreeNode);
var
   i:integer;
begin
  for i:=0 to Node.SubTreeCount-2 do
    Node.Items[i].StateIndex:=16;
end;

procedure Tfrmain.ShellTreeView1SelectionChanged(Sender: TObject);
begin
  if DirectoryExists(frmain.ShellTreeView1.Path) then
  begin
    loadfiles(frmain.ShellTreeView1.Path,'');
  end;
end;

procedure Tfrmain.Timer1Timer(Sender: TObject);
begin
  if nfile>0 then
  begin
    if aleatorio then
    begin
      ifile:=Round(Random(nfile-1));
    end
    else
    begin
      if nfile > 0 then
      begin
        if ifile+1 < nfile then
          Inc(ifile)
        else
          ifile:=0;
      end;
    end;
    try
      loadpicture(carpeta+flist[ifile]);
    except
      on E:Exception do frmain.StatusBar1.SimpleText:=inttostr(ifile+1)+'/'+inttostr(nfile)+' Formato no soportado!!!';
    end;
  end;
end;

procedure Tfrmain.Timer2Timer(Sender: TObject);
begin
  if hidetoolbardelay>0 then
    Dec(hidetoolbardelay);
  if full and (hidetoolbardelay=0) then
  begin
    frmain.ToolBar1.Visible:=false;
    frmain.Image1.Cursor:=crNone;
  end;
end;

procedure Tfrmain.Timer3Timer(Sender: TObject);
begin
  if Assigned(BGRAGif) then
  begin
    frmain.Image1.Picture.Bitmap.Assign(BGRAgif.Bitmap);
    frmain.Timer3.Interval:=BGRAgif.FrameDelayMs[BGRAGif.CurrentImage];
    frmain.StatusBar1.Panels[2].Text:='Frame '+inttostr(BGRAGif.CurrentImage+1)+'/'+inttostr(BGRAGif.Count);
  end;
end;

procedure Tfrmain.Timer4Timer(Sender: TObject);
begin
  refreshthumbs;
  ththumbs:=thumbsthread.Create(true);
  ththumbs.thumbpath:=carpeta;
  ththumbs.Start;
  frmain.Timer4.Enabled:=false;
end;

procedure Tfrmain.ToolBar1Click(Sender: TObject);
begin

end;

procedure Tfrmain.ToolBar1MouseLeave(Sender: TObject);
begin
  if full then
    frmain.Timer2.Enabled:=true;
end;

procedure Tfrmain.ToolBar1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  frmain.Timer2.Enabled:=false;
end;

procedure Tfrmain.ToolButton10Click(Sender: TObject);
begin
  zoomout();
end;

procedure Tfrmain.ToolButton11Click(Sender: TObject);
begin
  zoomnormal();
end;

procedure Tfrmain.ToolButton12Click(Sender: TObject);
begin
  frmain.Timer1.Enabled:=not frmain.Timer1.Enabled;
  if frmain.Timer1.Enabled then
    frmain.ToolButton12.ImageIndex:=12
  else
    frmain.ToolButton12.ImageIndex:=13;
end;

procedure Tfrmain.ToolButton13Click(Sender: TObject);
begin
  aleatorio:=not aleatorio;
  frmain.ToolButton13.Down:=aleatorio;
end;

procedure Tfrmain.ToolButton14Click(Sender: TObject);
begin
  zoomoriginal();
end;

procedure Tfrmain.ToolButton15Click(Sender: TObject);
begin
  loadpicture(carpeta+flist[ifile]);
end;

procedure Tfrmain.tbShowTreeViewClick(Sender: TObject);
begin
  frmain.pssThumbs.OnResize:=nil;
  frmain.MenuItem59.Checked:=not frmain.MenuItem59.Checked;
  frmain.tbShowTreeView.Down:=frmain.MenuItem59.Checked;
  if frmain.MenuItem59.Checked then
    frmain.Splitter1.Left:=200
  else
    frmain.Splitter1.Left:=0-frmain.Splitter1.Width;
  frmain.ShellTreeView1.Visible:=frmain.MenuItem59.Checked;
  frmain.pssThumbs.OnResize:=@frmain.PairSplitterSide2Resize;
end;

procedure Tfrmain.ToolButton18Click(Sender: TObject);
begin
  frmain.MenuItem60.Checked:=not frmain.MenuItem60.Checked;
  frmain.ToolButton18.Down:=frmain.MenuItem60.Checked;
  if frmain.MenuItem60.Checked then
    frmain.Image1.Cursor:=crCross
  else
  begin
    if frmain.Image1.Stretch then
      frmain.Image1.Cursor:=crSizeAll
    else
      frmain.Image1.Cursor:=crDefault;
    frmain.Shape1.Hide;
  end;
end;

procedure Tfrmain.ToolButton19Click(Sender: TObject);
begin
  BGRAGif.Pause;
  frmain.Timer3.Enabled:=false;
  if BGRAGif.CurrentImage>0 then
    BGRAGif.CurrentImage:=BGRAGif.CurrentImage-1
  else
    BGRAGif.CurrentImage:=BGRAGif.Count-1;
  frmain.ToolButton21.ImageIndex:=21;
  frmain.Timer3Timer(nil);
end;

procedure Tfrmain.ToolButton1Click(Sender: TObject);
begin
   prevfile();
end;

procedure Tfrmain.ToolButton20Click(Sender: TObject);
begin
  BGRAGif.Pause;
  frmain.Timer3.Enabled:=false;
  if BGRAGif.CurrentImage<BGRAGif.Count-1 then
    BGRAGif.CurrentImage:=BGRAGif.CurrentImage+1
  else
    BGRAGif.CurrentImage:=0;
  frmain.ToolButton21.ImageIndex:=21;
  frmain.Timer3Timer(nil);
end;

procedure Tfrmain.ToolButton21Click(Sender: TObject);
begin
  if BGRAGif.Paused then
  begin
    frmain.ToolButton21.ImageIndex:=21;
    BGRAGif.Resume;
  end
  else
  begin
    frmain.ToolButton21.ImageIndex:=22;
    BGRAGif.Pause;
  end;
  frmain.Timer3.Enabled:=not BGRAGif.Paused;
end;

procedure Tfrmain.ToolButton24Click(Sender: TObject);
begin
  frmain.MenuItem54.Checked:=not frmain.MenuItem54.Checked;
  frmain.ToolButton24.Down:=frmain.MenuItem54.Checked;
  if frmain.ToolButton24.Down then
    zoomstrech()
  else
    zoomnormal();
end;

procedure Tfrmain.ToolButton26Click(Sender: TObject);
var
   i:integer;
begin
  for i:=0 to BGRAGif.Count-1 do
    BGRAGif.FrameDelayMs[i]:=BGRAGif.FrameDelayMs[i]+10;
end;

procedure Tfrmain.ToolButton27Click(Sender: TObject);
  var
   i:integer;
begin
  for i:=0 to BGRAGif.Count-1 do
  begin
    if BGRAGif.FrameDelayMs[i]>10 then
      BGRAGif.FrameDelayMs[i]:=BGRAGif.FrameDelayMs[i]-9;
    if BGRAGif.FrameDelayMs[i]>1 then
      BGRAGif.FrameDelayMs[i]:=BGRAGif.FrameDelayMs[i]-1;
  end
end;

procedure Tfrmain.ToolButton2Click(Sender: TObject);
begin
   nextfile();
end;

procedure Tfrmain.ToolButton3Click(Sender: TObject);
begin
  fullsc();
end;

procedure Tfrmain.tbFlipHorizontalClick(Sender: TObject);
begin
 filterimagen(19);
  //efectimagen(1);
end;

procedure Tfrmain.tbFlipVerticalClick(Sender: TObject);
begin
  if (realimgwidth>256) or ifgif then
    filterimagen(20)
  else
    efectimagen(2);
end;

procedure Tfrmain.ToolButton6Click(Sender: TObject);
begin
  if (realimgwidth>256) or ifgif then
    filterimagen(18)
  else
    efectimagen(3);
end;

procedure Tfrmain.ToolButton7Click(Sender: TObject);
begin
  if (realimgwidth>256) or ifgif then
    filterimagen(17)
  else
    efectimagen(4);
end;

procedure Tfrmain.ToolButton8Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure Tfrmain.ToolButton9Click(Sender: TObject);
begin
  zoomin();
end;

Constructor thumbsthread.Create(CreateSuspended:Boolean);
begin
  FreeOnTerminate:=True;
  inherited Create(CreateSuspended);
  done:=false;
end;

procedure thumbsthread.refreshthumbs;
var
   i:integer;
begin
  while frmain.sboxthumb.ControlCount>flist.Count do
  begin
    frmain.sboxthumb.DestroyComponents;
  end;
  for i:=0 to frmain.sboxthumb.ControlCount-1 do
  begin
    (frmain.sboxthumb.Controls[i] as TImage).Picture.Clear;
    (frmain.sboxthumb.Controls[i] as TImage).Hint:=flist[i];
    (frmain.sboxthumb.Controls[i] as TImage).Tag:=i;
  end;
end;

procedure thumbsthread.showthumbs;
var
   thumbtmp:TPicture;
   streamimage:TFileStream;
   bgcolor:TBGRAPixel;
   th,tw:integer;
   wthumb:UnicodeString;
begin
  wthumb:=UTF16LongName(carpeta+iname);
  {$IFDEF WINDOWS}
  wthumb:=UTF16LongName(carpeta+iname);
  {$ELSE}
  wthumb:=carpeta+iname;
  {$ENDIF}
  bgcolor.alpha:=255;
  bgcolor.blue:=0;
  bgcolor.green:=0;
  bgcolor.red:=0;
  //if carpeta=thumbpath then
  //begin
    try
    thumb:=Graphics.TBitMap.Create;
    thumb.Width:=thumbsize;
    thumb.Height:=thumbsize;
    thumbtmp:=TPicture.Create();
    streamimage:=TFileStream.Create(wthumb,fmOpenRead or fmShareDenyNone);
    thumbtmp.Bitmap.Assign(GetStreamThumbnail(streamimage,thumbsize,thumbsize, bgcolor, false));
    streamimage.Free;
    thumb.Canvas.Rectangle(0,0,thumbsize,thumbsize);
    thumb.Canvas.CopyRect(Types.Rect(2,2,thumbsize-2,thumbsize-2),thumbtmp.Bitmap.Canvas,Types.Rect(0,0,thumbtmp.Bitmap.Width,thumbtmp.Bitmap.Height));
    thumbtmp.Destroy;
    {ShowMessage('Imagen #: '+inttostr(thumbindex)+#13+
    'Left: '+inttostr((frmain.sboxthumb.Controls[thumbindex] as TImage).Left)+#13+
    'Scroll: '+inttostr(frmain.sboxthumb.HorzScrollBar.Position)+#13+
    'Scroll+Form width: '+inttostr(frmain.sboxthumb.HorzScrollBar.Position+frmain.Width));}
    (frmain.sboxthumb.Controls[thumbindex] as TImage).Picture.Bitmap.Assign(thumb);
    //This is wrong but is workin for linux and windows
    {$IFDEF LINUX}
    Application.ProcessMessages;
    {$ENDIF}
    except on e:exception do
    begin
      thumb.Width:=thumbsize;
      thumb.Height:=thumbsize;
      thumb.Canvas.Brush.Color:=clWhite;
      thumb.Canvas.Pen.Color:=clRed;
      thumb.Canvas.Font.Size:=12;
      thumb.Canvas.Font.Color:=clRed;
      th:=thumb.Canvas.TextHeight('Error:'+e.ToString);
      tw:=thumb.Canvas.TextWidth('Error:'+e.ToString);
      thumb.Canvas.TextOut(Round((thumbsize-tw)/2),Round((thumbsize-th)/2),'Error:'+e.ToString);
      (frmain.sboxthumb.Controls[thumbindex] as TImage).Picture.Bitmap.Assign(thumb);
    end;
    end;
  //end;
end;

procedure thumbsthread.createallimages;
var
   i:longint;
   thumbimages:tthumbimage;
   mayor:longint;
begin
  if ifallthumbs=false then
  begin
    if flist.Count>=frmain.sboxthumb.ControlCount  then
      mayor:=flist.Count
    else
      mayor:=frmain.sboxthumb.ControlCount;
    for i:=0 to mayor-1 do
    begin
      if i>frmain.sboxthumb.ControlCount-1 then
      begin
        thumbimages:=tthumbimage.Create(frmain.sboxthumb);
        thumbimages.Width:=frmain.sboxthumb.Height-18;
        thumbimages.Height:=frmain.sboxthumb.Height-18;
        thumbimages.Left:=(frmain.sboxthumb.Height+1)*i;
        thumbimages.Stretch:=true;
        thumbimages.Center:=true;
        thumbimages.AutoSize:=false;
        thumbimages.Hint:=flist[i];
        thumbimages.ShowHint:=true;
        thumbimages.Tag:=i;
        //thumbimages.AnchorSideTop.Control:=frmain.sboxthumb;
        //thumbimages.AnchorSideTop.Side:=asrTop;
        //thumbimages.AnchorSideBottom.Control:=frmain.pssThumbs;
        //thumbimages.Anchors:=[akBottom,akTop];
        thumbimages.OnClick:=@thumbimages.thumbclick;
        thumbimages.OnMouseDown:=@thumbimages.thumbmousedown;
        thumbimages.OnMouseLeave:=@thumbimages.thumbmouseleave;
        thumbimages.OnMouseMove:=@thumbimages.thumbmousemove;
        thumbimages.OnMouseUp:=@thumbimages.thumbmouseup;
        thumbimages.Show;
        frmain.sboxthumb.InsertControl(thumbimages);
      end;
    end;
    //frmain.pssThumbs.OnResize:=nil;
    //This is for force update the scrollbar
    frmain.sboxthumb.Visible:=false;
    frmain.sboxthumb.Visible:=true;
    frmain.sboxthumb.AutoSize:=true;
    //frmain.sboxthumb.ScrollInView((frmain.sboxthumb.Components[ifile] as TControl));
    //frmain.sboxthumb.HorzScrollBar.Position:=(frmain.sboxthumb.Components[ifile] as TControl).Left-Round(frmain.Width/2)+Round(thumbsize/2)+1;
    if inprocessanim=false then
      scrollanim;
  end;
  ifallthumbs:=true;
end;

procedure thumbsthread.Execute;
var
   i,n,minv,maxv,icenter:longint;
begin
  if starting then///gift time to load the current image
    sleep(1000);
  ifallthumbs:=false;
  //Synchronize(@refreshthumbs);
  Synchronize(@createallimages);
  folderchange:=false;
  for i:=0 to flist.Count-1 do
  begin
    if carpeta=thumbpath then
    begin
      //try
        if i<flist.Count then
        begin
          if frmain.sboxthumb.HorzScrollBar.ScrollPos<>0 then
          begin
            //*** This is for update first the visible thumbs ***//
            ///// Determine the first visible thumb
            try
              icenter:=frmain.sboxthumb.ControlAtPos(Types.Point(Round(frmain.sboxthumb.Width/2),Round(frmain.sboxthumb.Height/2)),[capfAllowDisabled]).Tag;
            except on e:exception do
              icenter:=frmain.sboxthumb.ControlCount-1;
            end;
            for n:=icenter downto 0 do
            begin
              if frmain.sboxthumb.Controls[n].Left>=frmain.sboxthumb.HorzScrollBar.Position then
                minv:=n
              else
                break;
            end;
            if minv>0 then
              minv:=minv-1;

            ///// Determine the last visible thumb
            for n:=icenter to frmain.sboxthumb.ControlCount-1 do
            begin
             if frmain.sboxthumb.Controls[n].Left>(frmain.sboxthumb.HorzScrollBar.Position+frmain.width) then
             begin
                maxv:=n;
                break;
             end;
            end;
            if maxv>frmain.sboxthumb.ControlCount-1 then
              maxv:=frmain.sboxthumb.ControlCount-1;
            ////////Update the visible thumbs
            //frmain.Caption:='minv:'+inttostr(minv)+'maxv:'+inttostr(maxv);
            for n:=minv to maxv do
            begin
              if (frmain.sboxthumb.Controls[n] as TImage).Picture.Bitmap.Empty then
              begin
                iname:=flist[n];
                thumbindex:=(frmain.sboxthumb.Controls[n] as TImage).Tag;
                {$IFDEF LINUX}
                Synchronize(@showthumbs);
                {$ELSE}
                showthumbs;
                {$ENDIF}
              end;
            end;
          end;


          if (frmain.sboxthumb.Controls[i] as TImage).Picture.Bitmap.Empty then
          begin
            iname:=flist[i];
            thumbindex:=(frmain.sboxthumb.Controls[i] as TImage).Tag;
            {$IFDEF LINUX}
            Synchronize(@showthumbs);
            {$ELSE}
            showthumbs;
            {$ENDIF}
          end;
        end;
      //except on e:exception do
      //begin

      //end;
      //end;
    end
    else
      break;
  end;
  //self.Destroy;
end;

procedure tthumbimage.thumbclick(Sender:TObject);
begin
  ifile:=self.Tag;
  loadpicture(carpeta+flist[self.Tag],true,false);
end;

procedure tthumbimage.thumbmousedown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  mosaicmousedown:=true;
  mosaicscrollposition:=frmain.sboxthumb.HorzScrollBar.Position;
  mosaicmouseposition:=Mouse.CursorPos.x;
end;

procedure tthumbimage.thumbmouseleave(Sender: TObject);
begin
  mosaicmousedown:=false;
end;

procedure tthumbimage.thumbmousemove(Sender: TObject; Shift: TShiftState; X,  Y: Integer);
begin
  if mosaicmousedown then
  begin
    frmain.sboxthumb.HorzScrollBar.Position:=mosaicscrollposition-(X-mosaicmouseposition);
  end;
end;

procedure tthumbimage.thumbmouseup(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  mosaicmousedown:=false;
end;

procedure thumbsthread.stop;
begin
 if Assigned(thumb) then
   thumb.Destroy;
 self.Destroy;
end;

end.

