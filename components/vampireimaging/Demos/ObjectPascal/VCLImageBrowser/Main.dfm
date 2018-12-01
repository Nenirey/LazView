object MainForm: TMainForm
  Left = 167
  Top = 103
  Caption = 'VCL Image Browser - Vampyre Imaging Library Demo'
  ClientHeight = 791
  ClientWidth = 1026
  Color = clWhite
  Font.Charset = EASTEUROPE_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 249
    Top = 0
    Height = 791
  end
  object LeftPanel: TPanel
    Left = 0
    Top = 0
    Width = 249
    Height = 791
    Align = alLeft
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 0
    object Tree: TShellTreeView
      Left = 0
      Top = 0
      Width = 249
      Height = 791
      ObjectTypes = [otFolders, otNonFolders, otHidden]
      Root = 'rfMyComputer'
      UseShellImages = True
      Align = alClient
      AutoRefresh = False
      Indent = 19
      ParentColor = False
      RightClickSelect = True
      ShowRoot = False
      TabOrder = 0
      OnKeyDown = TreeKeyDown
      OnChange = TreeChange
    end
  end
  object RightPanel: TPanel
    Left = 252
    Top = 0
    Width = 774
    Height = 791
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    Constraints.MinHeight = 300
    Constraints.MinWidth = 400
    TabOrder = 1
    object InfoPanel: TPanel
      Left = 0
      Top = 0
      Width = 774
      Height = 97
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 0
      DesignSize = (
        774
        97)
      object LabDataFormat: TLabel
        Left = 136
        Top = 56
        Width = 281
        Height = 13
        AutoSize = False
      end
      object LabFileFormat: TLabel
        Left = 136
        Top = 40
        Width = 281
        Height = 13
        AutoSize = False
      end
      object LabDim: TLabel
        Left = 136
        Top = 24
        Width = 281
        Height = 13
        AutoSize = False
      end
      object LabFileName: TLabel
        Left = 136
        Top = 8
        Width = 281
        Height = 13
        AutoSize = False
      end
      object Label3: TLabel
        Left = 8
        Top = 56
        Width = 82
        Height = 13
        Caption = 'Data format:'
      end
      object Label2: TLabel
        Left = 8
        Top = 40
        Width = 76
        Height = 13
        Caption = 'File format:'
      end
      object Label1: TLabel
        Left = 8
        Top = 24
        Width = 79
        Height = 13
        Caption = 'Dimensions:'
      end
      object Lab1: TLabel
        Left = 8
        Top = 8
        Width = 85
        Height = 13
        Caption = 'Selected file:'
      end
      object Label4: TLabel
        Left = 8
        Top = 72
        Width = 112
        Height = 13
        Caption = 'Active subimage:'
      end
      object LabActImage: TLabel
        Left = 136
        Top = 72
        Width = 281
        Height = 13
        AutoSize = False
      end
      object BtnPrev: TSpeedButton
        Left = 232
        Top = 69
        Width = 23
        Height = 22
        Hint = 'Previous subimage'
        Glyph.Data = {
          76050000424D7605000000000000360400002800000011000000100000000100
          0800000000004001000000000000000000000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00710000005001
          0000ACCEBE00C023BD00000102000405060008090A000C0D0E00101112001415
          160018191A001C1D1E00202022002424260028282A002C2C2E00303032003434
          360038383A003C3C3E004041410044454600484949004C4D4E00505151005455
          5600585959005C5D5E0070000000910000000000000000BBBE00223401005003
          94000CBBBE007C7D7E008081820018BBBE0088898A008C8D8E0024BBBE009395
          960098999A0030BBBE00A0A1A200A3A5A6003CBBBE00ACADAE00C00000009100
          00000000000050BBBE00BE33010088B6AE005CBBBE0060BBBE00D0D1D20068BB
          BE0000000000DCDDDE0074BBBE00E3E5E600E8E9EA0080BBBE00910000005000
          00008CBBBE004023BD000000000098BBBE000000000000000000A4BBBE000000
          000000000000B0BBBE0000000000000000000000000000000000000000000000
          0000000000001E001F0050010000410000000000000000000000550B13004C72
          BE0000000000C90A89005472BE0000000000690B05005C72BE0000000000DB0A
          72006472BE00120000004100000031000000F8BBBE00E0BBBE00000000000000
          0000D4BBBE00ECBBBE0000000000FF00FF00FFFF0000FFFFFF0031000000D100
          0000333333003333330030000000333333003333330030000000333F33003333
          330030000000338EFF003333330030000000338EEE003333330030000000338E
          EE00FF33330030000000338EEE00EEFF330030000000338EEE00EEEEFF003000
          0000338EEE00EEEE880030000000338EEE00EE88330030000000338EEE008833
          330030000000338EEE003333330030000000338E880033333300300000003388
          3300333333003000000033333300333333003000000033333300333333003000
          0000FFFFFF000F000000D1000000810000002800000011000000100000000100
          040000000000C000000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FF00FF0000FF
          FF00FFFFFF00EE4F00008100000041000000D0BDBE0000000000C1330100C4FC
          BD00D4BDBE00C0300100D4FCBD00B8BDBE000400000000000000000000000000
          000000000000FFFFFF00410000004100000050BEBE00000000003F34010084FC
          BD0000000000C233010094FCBD00E0BDBE00BE330100A4FCBD00ECBDBE00AC30
          0100B4FCBD004023BD004100000041000000E096BE0000000000BF33010074FC
          BD002CBEBE00000000000000000038BEBE000000000000000000030303030303
          0303030303030303030303000000030303030303030303030303030303030300
          0000030303030303030303030303030F03030300000003030303030303030303
          030F0F0E0803030000000303030303030303030F0F0E0E0E0803030000000303
          03030303030F0F0E0E0E0E0E08030300000003030303030F0F0E0E0E0E0E0E0E
          0803030000000303030F0F0E0E0E0E0E0E0E0E0E08030300000003030F08080E
          0E0E0E0E0E0E0E0E080303000000030303030308080E0E0E0E0E0E0E08030300
          00000303030303030308080E0E0E0E0E08030300000003030303030303030308
          080E0E0E080303000000030303030303030303030308080E0803030000000303
          0303030303030303030303080803030000000303030303030303030303030303
          0303030000000303030303030303030303030303030303000000}
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnPrevClick
      end
      object BtnNext: TSpeedButton
        Left = 261
        Top = 69
        Width = 23
        Height = 22
        Hint = 'Next subimage'
        Glyph.Data = {
          76050000424D7605000000000000360400002800000011000000100000000100
          0800000000004001000000000000000000000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000030303030303
          0303030303030303030303000000030303030303030303030303030303030300
          00000303030F030303030303030303030303030000000303080E0F0F03030303
          030303030303030000000303080E0E0E0F0F0303030303030303030000000303
          080E0E0E0E0E0F0F030303030303030000000303080E0E0E0E0E0E0E0F0F0303
          0303030000000303080E0E0E0E0E0E0E0E0E0F0F0303030000000303080E0E0E
          0E0E0E0E0E0E08080F03030000000303080E0E0E0E0E0E0E0808030303030300
          00000303080E0E0E0E0E0808030303030303030000000303080E0E0E08080303
          030303030303030000000303080E080803030303030303030303030000000303
          0808030303030303030303030303030000000303030303030303030303030303
          0303030000000303030303030303030303030303030303000000}
        Layout = blGlyphRight
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnNextClick
      end
      object BtnFirst: TSpeedButton
        Left = 320
        Top = 69
        Width = 23
        Height = 22
        Hint = 'First subimage'
        Glyph.Data = {
          76050000424D7605000000000000360400002800000014000000100000000100
          0800000000004001000000000000000000000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000030303030303
          0303030303030303030303030303030303030303030303030303030303030303
          03030303080F0F03030303030303030303030F0F03030303080E0F0303030303
          030303030F0F0E0F03030303080E0F030303030303030F0F0E0E0E0F03030303
          080E0F03030303030F0F0E0E0E0E0E0F03030303080E0F0303030F0F0E0E0E0E
          0E0E0E0F03030303080E0F03030F0E0E0E0E0E0E0E0E0E0F03030303080E0F03
          08080E0E0E0E0E0E0E0E0E0F03030303080E0F03030308080E0E0E0E0E0E0E0F
          03030303080E0F030303030308080E0E0E0E0E0F03030303080E0F0303030303
          030308080E0E0E0F03030303080E0F03030303030303030308080E0F03030303
          08080F0303030303030303030303080F03030303030303030303030303030303
          0303030303030303030303030303030303030303030303030303}
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnFirstClick
      end
      object BtnLast: TSpeedButton
        Left = 349
        Top = 69
        Width = 23
        Height = 22
        Hint = 'Last subimage'
        Glyph.Data = {
          B6050000424DB605000000000000360400002800000015000000100000000100
          0800000000008001000000000000000000000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000030303030303
          0303030303030303030303030303030000000303030303030303030303030303
          030303030303030000000303030F030303030303030303030303080F0F030300
          00000303080E0F0F03030303030303030303080E0F03030000000303080E0E0E
          0F0F0303030303030303080E0F03030000000303080E0E0E0E0E0F0F03030303
          0303080E0F03030000000303080E0E0E0E0E0E0E0F0F03030303080E0F030300
          00000303080E0E0E0E0E0E0E0E0E0F0F0303080E0F03030000000303080E0E0E
          0E0E0E0E0E0E08080F03080E0F03030000000303080E0E0E0E0E0E0E08080303
          0303080E0F03030000000303080E0E0E0E0E0808030303030303080E0F030300
          00000303080E0E0E08080303030303030303080E0F03030000000303080E0808
          03030303030303030303080E0F03030000000303080803030303030303030303
          030308080F030300000003030303030303030303030303030303030303030300
          0000030303030303030303030303030303030303030303000000}
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnLastClick
      end
      object BtnSave: TButton
        Left = 641
        Top = 3
        Width = 129
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Save Image Copy'
        TabOrder = 0
        OnClick = BtnSaveClick
      end
      object CheckFilter: TCheckBox
        Left = 641
        Top = 39
        Width = 121
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'Bicubic filtering'
        Checked = True
        State = cbChecked
        TabOrder = 1
        OnClick = CheckFilterClick
      end
    end
    object ViewPanel: TPanel
      Left = 0
      Top = 97
      Width = 774
      Height = 694
      Align = alClient
      BevelOuter = bvNone
      Color = 16777126
      TabOrder = 1
      OnResize = ViewPanelResize
      object PaintBox: TPaintBox
        Left = 0
        Top = 0
        Width = 774
        Height = 675
        Align = alClient
        Color = 16773862
        ParentColor = False
        OnPaint = PaintBoxPaint
      end
      object StatusBar: TStatusBar
        Left = 0
        Top = 675
        Width = 774
        Height = 19
        Color = clWhite
        Panels = <>
        SimplePanel = True
      end
    end
  end
  object SaveDialog: TSavePictureDialog
    Left = 104
    Top = 320
  end
end
