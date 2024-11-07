object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Cadastro cliente'
  ClientHeight = 522
  ClientWidth = 818
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 818
    Height = 73
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 332
      Height = 71
      Align = alLeft
      Caption = 'Cadastro de clientes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -35
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitHeight = 47
    end
    object Button1: TButton
      Left = 400
      Top = 7
      Width = 75
      Height = 50
      Caption = 'Novo'
      TabOrder = 0
    end
    object Button2: TButton
      Left = 592
      Top = 7
      Width = 75
      Height = 50
      Caption = 'Cancelar'
      TabOrder = 1
    end
    object Button3: TButton
      Left = 495
      Top = 7
      Width = 75
      Height = 50
      Caption = 'Salvar'
      TabOrder = 2
    end
    object Button4: TButton
      Left = 688
      Top = 7
      Width = 75
      Height = 50
      Caption = 'Excluir'
      TabOrder = 3
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 73
    Width = 818
    Height = 449
    ActivePage = TabSheet4
    Align = alClient
    TabOrder = 1
    ExplicitLeft = -8
    ExplicitTop = 78
    object TabSheet1: TTabSheet
      Caption = 'Dados Pessoais'
      object Label2: TLabel
        Left = 3
        Top = 24
        Width = 96
        Height = 15
        Caption = 'C'#243'digo do Cliente'
      end
      object Label3: TLabel
        Left = 3
        Top = 96
        Width = 88
        Height = 15
        Caption = 'Nome do cliente'
      end
      object Label4: TLabel
        Left = 296
        Top = 24
        Width = 78
        Height = 15
        Caption = 'Tipo do cliente'
      end
      object Label5: TLabel
        Left = 491
        Top = 24
        Width = 15
        Height = 15
        Caption = 'RG'
      end
      object Label6: TLabel
        Left = 656
        Top = 24
        Width = 97
        Height = 15
        Caption = 'Data de Expedi'#231#227'o'
      end
      object Label7: TLabel
        Left = 287
        Top = 176
        Width = 31
        Height = 15
        Caption = 'Bairro'
      end
      object Label8: TLabel
        Left = 3
        Top = 248
        Width = 37
        Height = 15
        Caption = 'Cidade'
      end
      object Label9: TLabel
        Left = 3
        Top = 176
        Width = 49
        Height = 15
        Caption = 'Endere'#231'o'
      end
      object Label10: TLabel
        Left = 142
        Top = 248
        Width = 14
        Height = 15
        Caption = 'UF'
      end
      object Label11: TLabel
        Left = 283
        Top = 248
        Width = 21
        Height = 15
        Caption = 'CEP'
      end
      object Label12: TLabel
        Left = 491
        Top = 96
        Width = 44
        Height = 16
        Caption = 'Telefone'
      end
      object Label13: TLabel
        Left = 656
        Top = 96
        Width = 37
        Height = 15
        Caption = 'Celular'
      end
      object Label14: TLabel
        Left = 491
        Top = 168
        Width = 29
        Height = 15
        Caption = 'Email'
      end
      object Edit1: TEdit
        Left = 3
        Top = 56
        Width = 238
        Height = 23
        Hint = 'Digite o c'#243'digo de cliente'
        NumbersOnly = True
        TabOrder = 0
      end
      object Edit2: TEdit
        Left = 3
        Top = 128
        Width = 438
        Height = 23
        TabOrder = 1
      end
      object ComboBox1: TComboBox
        Left = 296
        Top = 56
        Width = 145
        Height = 23
        Style = csDropDownList
        TabOrder = 2
        Items.Strings = (
          'Pessoa F'#237'sica'
          'Pessoa Jur'#237'dica')
      end
      object Edit3: TEdit
        Left = 491
        Top = 56
        Width = 121
        Height = 23
        NumbersOnly = True
        TabOrder = 3
      end
      object Edit4: TEdit
        Left = 656
        Top = 56
        Width = 121
        Height = 23
        TabOrder = 4
      end
      object Edit5: TEdit
        Left = 3
        Top = 197
        Width = 278
        Height = 23
        TabOrder = 5
      end
      object Edit6: TEdit
        Left = 3
        Top = 269
        Width = 121
        Height = 23
        TabOrder = 6
      end
      object Edit7: TEdit
        Left = 287
        Top = 197
        Width = 154
        Height = 23
        TabOrder = 7
      end
      object Edit8: TEdit
        Left = 142
        Top = 269
        Width = 121
        Height = 23
        TabOrder = 8
      end
      object Edit9: TEdit
        Left = 283
        Top = 269
        Width = 120
        Height = 23
        NumbersOnly = True
        TabOrder = 9
      end
      object Edit10: TEdit
        Left = 491
        Top = 118
        Width = 121
        Height = 23
        NumbersOnly = True
        TabOrder = 10
      end
      object Edit11: TEdit
        Left = 657
        Top = 117
        Width = 120
        Height = 23
        NumbersOnly = True
        TabOrder = 11
      end
      object Edit12: TEdit
        Left = 491
        Top = 197
        Width = 286
        Height = 23
        TabOrder = 12
      end
      object CheckBox1: TCheckBox
        Left = 491
        Top = 248
        Width = 97
        Height = 17
        Caption = 'Cliente Negativado'
        TabOrder = 13
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Dados do C'#244'njugue '
      ImageIndex = 1
      object Label18: TLabel
        Left = 24
        Top = 24
        Width = 33
        Height = 15
        Caption = 'Nome'
      end
      object Label19: TLabel
        Left = 24
        Top = 88
        Width = 107
        Height = 15
        Caption = 'Data de Nascimento'
      end
      object Label20: TLabel
        Left = 350
        Top = 24
        Width = 21
        Height = 15
        Caption = 'CPF'
      end
      object Edit16: TEdit
        Left = 24
        Top = 109
        Width = 225
        Height = 23
        TabOrder = 0
      end
      object Edit17: TEdit
        Left = 350
        Top = 45
        Width = 200
        Height = 23
        NumbersOnly = True
        TabOrder = 1
      end
      object Edit18: TEdit
        Left = 24
        Top = 45
        Width = 305
        Height = 23
        TabOrder = 2
      end
      object GroupBox1: TGroupBox
        Left = 294
        Top = 88
        Width = 329
        Height = 177
        Caption = 'Contato'
        TabOrder = 3
        object Label15: TLabel
          Left = 24
          Top = 24
          Width = 44
          Height = 15
          Caption = 'Telefone'
        end
        object Label16: TLabel
          Left = 200
          Top = 21
          Width = 56
          Height = 15
          Caption = 'Operadora'
        end
        object Label17: TLabel
          Left = 24
          Top = 90
          Width = 29
          Height = 15
          Caption = 'Email'
        end
        object Edit13: TEdit
          Left = 24
          Top = 45
          Width = 121
          Height = 23
          TabOrder = 0
        end
        object Edit15: TEdit
          Left = 24
          Top = 111
          Width = 281
          Height = 23
          TabOrder = 1
        end
        object ComboBox2: TComboBox
          Left = 200
          Top = 42
          Width = 113
          Height = 23
          TabOrder = 2
          Items.Strings = (
            'Vivo'
            'Tim'
            'Claro'
            'Oi')
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Dados do Trabalho'
      ImageIndex = 2
      object Label21: TLabel
        Left = 24
        Top = 27
        Width = 52
        Height = 15
        Caption = 'Profoss'#227'o'
      end
      object Label22: TLabel
        Left = 24
        Top = 96
        Width = 45
        Height = 15
        Caption = 'Empresa'
      end
      object Label23: TLabel
        Left = 24
        Top = 232
        Width = 108
        Height = 15
        Caption = 'Telefone de Trabalho'
      end
      object Label24: TLabel
        Left = 24
        Top = 163
        Width = 113
        Height = 15
        Caption = 'Endere'#231'o de Trabalho'
      end
      object Label25: TLabel
        Left = 320
        Top = 232
        Width = 101
        Height = 15
        Caption = 'Celular de Trabalho'
      end
      object Edit14: TEdit
        Left = 320
        Top = 253
        Width = 225
        Height = 23
        NumbersOnly = True
        TabOrder = 0
      end
      object Edit19: TEdit
        Left = 24
        Top = 253
        Width = 265
        Height = 23
        NumbersOnly = True
        TabOrder = 1
      end
      object Edit20: TEdit
        Left = 24
        Top = 184
        Width = 521
        Height = 23
        TabOrder = 2
      end
      object Edit21: TEdit
        Left = 24
        Top = 117
        Width = 521
        Height = 23
        TabOrder = 3
      end
      object Edit22: TEdit
        Left = 24
        Top = 48
        Width = 521
        Height = 23
        TabOrder = 4
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'An'#225'lise de Cr'#233'ditos'
      ImageIndex = 3
      object Label26: TLabel
        Left = 32
        Top = 24
        Width = 92
        Height = 15
        Caption = 'Sal'#225'rio do Cliente'
      end
      object Label27: TLabel
        Left = 352
        Top = 24
        Width = 62
        Height = 15
        Caption = 'Observa'#231#227'o'
      end
      object Label28: TLabel
        Left = 32
        Top = 280
        Width = 91
        Height = 15
        Caption = 'Limite Dispon'#237'vel'
      end
      object Label29: TLabel
        Left = 32
        Top = 216
        Width = 82
        Height = 15
        Caption = 'Limite Utilizado'
      end
      object Label30: TLabel
        Left = 32
        Top = 155
        Width = 92
        Height = 15
        Caption = 'Linhas de Cr'#233'dito'
      end
      object Label31: TLabel
        Left = 32
        Top = 88
        Width = 107
        Height = 15
        Caption = 'Sal'#225'rio do C'#244'njugue'
      end
      object Edit23: TEdit
        Left = 32
        Top = 301
        Width = 249
        Height = 23
        TabOrder = 0
      end
      object Edit24: TEdit
        Left = 32
        Top = 237
        Width = 249
        Height = 23
        TabOrder = 1
      end
      object Edit25: TEdit
        Left = 32
        Top = 176
        Width = 249
        Height = 23
        TabOrder = 2
      end
      object Edit26: TEdit
        Left = 32
        Top = 109
        Width = 249
        Height = 23
        TabOrder = 3
      end
      object Edit27: TEdit
        Left = 32
        Top = 45
        Width = 249
        Height = 23
        TabOrder = 4
      end
      object Memo1: TMemo
        Left = 352
        Top = 45
        Width = 407
        Height = 250
        Lines.Strings = (
          '')
        TabOrder = 5
      end
    end
  end
end
