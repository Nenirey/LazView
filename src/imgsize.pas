unit ImgSize;

{$mode objfpc}{$H+}

interface

uses Classes;

type
  TBITMAPFILEHEADER = packed record
       bfType : Word;
       bfSize : DWord;
       bfReserved1 : Word;
       bfReserved2 : Word;
       bfOffBits : DWord;
end;

type
  TBITMAPINFOHEADER = record
          biSize : DWORD;
          biWidth : LONGint;
          biHeight : LONGint;
          biPlanes : WORD;
          biBitCount : WORD;
          biCompression : DWORD;
          biSizeImage : DWORD;
          biXPelsPerMeter : LONGint;
          biYPelsPerMeter : LONGint;
          biClrUsed : DWORD;
          biClrImportant : DWORD;
end;

procedure GetJPGSize(var f: TFileStream; var wWidth, wHeight: word);
procedure GetPNGSize(var f: TFileStream; var wWidth, wHeight: word);
procedure GetGIFSize(const sGIFFile: string; var wWidth, wHeight: word);
procedure GetBMPSize(var f: TFileStream; var wWidth, wHeight: word);

implementation

uses SysUtils, FileUtil;

function ReadMWord(f: TFileStream): word;

type
  TMotorolaWord = record
  case byte of
  0: (Value: word);
  1: (Byte1, Byte2: byte);
end;

var
  MW: TMotorolaWord;
begin
  {It would probably be better to just read these two bytes in normally and
  then do a small ASM routine to swap them. But we aren't talking about
  reading entire files, so I doubt the performance gain would be worth the
  trouble.}
  f.Read(MW.Byte2, SizeOf(Byte));
  f.Read(MW.Byte1, SizeOf(Byte));
  Result := MW.Value;
end;

procedure GetJPGSize(var f: TFileStream; var wWidth, wHeight: word);
const
  ValidSig : array[0..1] of byte = ($FF, $D8);
  Parameterless = [$01, $D0, $D1, $D2, $D3, $D4, $D5, $D6, $D7];
var
  Sig: array[0..1] of byte;
  //f: TFileStream;
  x: integer;
  Seg: byte;
  Dummy: array[0..15] of byte;
  Len: word;
  ReadLen: LongInt;
begin
  FillChar(Sig, SizeOf(Sig), #0);
  //f := TFileStream.Create(sFile, fmOpenRead);
  try
    ReadLen := f.Read(Sig[0], SizeOf(Sig));
    for x := Low(Sig) to High(Sig) do
      if Sig[x] <> ValidSig[x] then
        ReadLen := 0;
      if ReadLen > 0 then
      begin
        ReadLen := f.Read(Seg, 1);
        while (Seg = $FF) and (ReadLen > 0) do
        begin
          ReadLen := f.Read(Seg, 1);
          if Seg <> $FF then
          begin
            if (Seg = $C0) or (Seg = $C1) or (Seg = $C2) then
            begin
              ReadLen := f.Read(Dummy[0], 3);  { don't need these bytes }
              wHeight := ReadMWord(f);
              wWidth := ReadMWord(f);
            end
            else
            begin
              if not (Seg in Parameterless) then
              begin
                Len := ReadMWord(f);
                f.Seek(Len - 2, 1);
                f.Read(Seg, 1);
              end
              else
                Seg := $FF;  { Fake it to keep looping. }
            end;
          end;
        end;
      end;
    finally
    //f.Free;
  end;
end;

procedure GetPNGSize(var f: TFileStream; var wWidth, wHeight: word);
type
  TPNGSig = array[0..7] of byte;
const
  ValidSig: TPNGSig = (137, 80, 78, 71, 13, 10, 26, 10);
var
  Sig: TPNGSig;
  //f: tFileStream;
  x: integer;
begin
  FillChar(Sig, SizeOf(Sig), #0);
  //f := TFileStream.Create(sFile, fmOpenRead);
  try
    f.Read(Sig[0], SizeOf(Sig));
    for x := Low(Sig) to High(Sig) do
      if Sig[x] <> ValidSig[x] then
        exit;
      f.Seek(18, 0);
      wWidth := ReadMWord(f);
      f.Seek(22, 0);
      wHeight := ReadMWord(f);
  finally
    //f.Free;
  end;
end;


procedure GetGIFSize(const sGIFFile: string; var wWidth, wHeight: word);
type
  TGIFHeader = record
  Sig: array[0..5] of char;
  ScreenWidth, ScreenHeight: word;
  Flags, Background, Aspect: byte;
end;
  TGIFImageBlock = record
  Left, Top, Width, Height: word;
  Flags: byte;
end;
var
  f: file;
  Header: TGifHeader;
  ImageBlock: TGifImageBlock;
  nResult: integer;
  x: integer;
  c: char;
  DimensionsFound: boolean;
begin
  wWidth  := 0;
  wHeight := 0;
  if sGifFile = '' then
    exit;

  {$I-}

  FileMode := 0;  { read-only }
  AssignFile(f, sGifFile);
  reset(f, 1);
  if IOResult <> 0 then
    {Could not open file}
  exit;
  {Read header and ensure valid file}
  BlockRead(f, Header, SizeOf(TGifHeader), nResult);
  if (nResult <> SizeOf(TGifHeader)) or (IOResult <> 0)
    or (StrLComp('GIF', Header.Sig, 3) <> 0) then
  begin
    {Image file invalid}
    close(f);
    exit;
  end;
  {Skip color map, if there is one}
  if (Header.Flags and $80) > 0 then
  begin
    x := 3 * (1 SHL ((Header.Flags and 7) + 1));
    Seek(f, x);
    if IOResult <> 0 then
    begin
      { Color map thrashed }
      close(f);
      exit;
    end;
  end;
  DimensionsFound := False;
  FillChar(ImageBlock, SizeOf(TGIFImageBlock), #0);
  { Step through blocks }
  BlockRead(f, c, 1, nResult);
  while (not EOF(f)) and (not DimensionsFound) do
  begin
    case c of
    ',':  { Found image }
    begin
      BlockRead(f, ImageBlock, SizeOf(TGIFImageBlock), nResult);
      if nResult <> SizeOf(TGIFImageBlock) then
      begin
        { Invalid image block encountered }
        close(f);
        exit;
      end;
      wWidth := ImageBlock.Width;
      wHeight := ImageBlock.Height;
      DimensionsFound := True;
    end;
    {',' :  { Skip }
    begin
      { NOP }
    end;}
    { nothing else, just ignore }
  end;
  BlockRead(f, c, 1, nResult);
end;
close(f);

{$I+}

end;

procedure GetBMPSize(var f: TFileStream; var wWidth, wHeight: word);
const
  BMP_MAGIC_WORD = ord('M') shl 8 or ord('B');
var
  //f: TFileStream;
  header: TBitmapFileHeader;
  info: TBitmapInfoHeader;
begin
  //f := TFileStream.Create(FileName, fmOpenRead);
  try
    if f.Read(header, sizeof(header)) <> sizeof(header) then Exit;
    if header.bfType <> BMP_MAGIC_WORD then Exit;
    if f.Read(info, sizeof(info)) <> sizeof(info) then Exit;
    wWidth := info.biWidth;
    wHeight := abs(info.biHeight);
  finally
    //f.Free;
  end;
end;

end.


