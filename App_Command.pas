unit App_Command;

interface

uses
  { units }
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  System.UITypes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.WinXPanels,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TAppCommand = class(TForm)
    Content: TCardPanel;
    CardRegisterLogin: TCard;
    PcRegisterLogin: TPageControl;
    TsRegister: TTabSheet;
    LbRegUser: TLabel;
    EdRegName: TEdit;
    LbRegEmail: TLabel;
    EdRegPassword: TEdit;
    LbRegPassword: TLabel;
    EdRegEmail: TEdit;
    LbRegConfPassword: TLabel;
    EdRegConfPassword: TEdit;
    SbRegister: TSpeedButton;
    Query: TFDQuery;
    CardCommand: TCard;
    TsLogin: TTabSheet;
    LbLoginPassword: TLabel;
    EdLoginPassword: TEdit;
    SbLogin: TSpeedButton;
    BtnAddCommand: TButton;
    EdSearchCategory: TEdit;
    EdSearchSubCategory: TEdit;
    BtnListCommand: TButton;
    LbLoginUser: TLabel;
    EdLoginName: TEdit;
    LbTitleCategory: TLabel;
    LbTitleSubCategory: TLabel;
    CardCreate: TCard;
    PCreate: TPanel;
    LbCreateSubCat: TLabel;
    LbCreateCat: TLabel;
    LbCreateCommand: TLabel;
    LbCreateDesc: TLabel;
    EdCategory: TEdit;
    EdSubCategory: TEdit;
    EdCommand: TEdit;
    EdDescription: TEdit;
    SbCreate: TSpeedButton;
    CardUpdateDelete: TCard;
    PUpdateDelete: TPanel;
    LbUpDelSubCat: TLabel;
    LbUpDelCat: TLabel;
    LbUpDelCommand: TLabel;
    LbUpDelDesc: TLabel;
    SbDelete: TSpeedButton;
    SbUpdate: TSpeedButton;
    EdCatUpDel: TEdit;
    EdSubCatUpDel: TEdit;
    EdCommandUpDel: TEdit;
    EdDescUpDel: TEdit;
    BtnBackCreate: TButton;
    BtnBackUpDel: TButton;
    BtnLogout: TButton;
    SbPanelContainer: TScrollBox;
    procedure SbRegisterClick(Sender: TObject);
    procedure SbLoginClick(Sender: TObject);
    procedure SbDeleteClick(Sender: TObject);
    procedure BtnAddCommandClick(Sender: TObject);
    procedure BtnListCommandClick(Sender: TObject);
    procedure CommandPanelClick(Sender: TObject);
    procedure SbUpdateClick(Sender: TObject);
    procedure SbCreateClick(Sender: TObject);
    procedure BtnBackCreateClick(Sender: TObject);
    procedure BtnLogoutClick(Sender: TObject);
  private
    CommandID: Integer;
    procedure FreePanels;
    procedure CleanInputs;
    procedure CreatePanel(const CommandText: string; PanelTop, ID: Integer);
    function ValidateRegister(const Name, Email, Password, ConfirmPassword: string): boolean;
    function ValidateLogin(const Name, Password: string): boolean;
    function ValidateCrud(const Cat, Command, Desc: string; const create: boolean): boolean;
    function DisplayMessage(const Msg: string): boolean;
  public
    { Public declarations }
  end;

var
  AppCommand: TAppCommand;

implementation

{$R *.dfm}

uses uDataModule;

{ Create command button }
procedure TAppCommand.BtnAddCommandClick(Sender: TObject);
begin
  Content.ActiveCard := CardCreate;
  FreePanels;
end;

{ Panel for each command/description }
procedure TAppCommand.CommandPanelClick(Sender: TObject);
begin
  CommandID := (Sender as TPanel).Tag;
  Content.ActiveCard := CardUpdateDelete;

  Query.Close;
  Query.SQL.Text := 'SELECT * FROM commands WHERE id = :id';
  Query.Params.ParamByName('id').Value := CommandID;

  try
    Query.Open;
    if not Query.IsEmpty then
    begin
      EdCatUpDel.Text := Query.FieldByName('category').AsString;
      EdSubCatUpDel.Text := Query.FieldByName('subcategory').AsString;
      EdCommandUpDel.Text := Query.FieldByName('command').AsString;
      EdDescUpDel.Text := Query.FieldByName('description').AsString;
    end;
  except
    on E: Exception do
      ShowMessage('Error: ' + E.Message);
  end;
  FreePanels;
end;

{ Come back button to CardCreate }
procedure TAppCommand.BtnBackCreateClick(Sender: TObject);
begin
  Content.ActiveCard := CardCommand;
end;

{ Logout session }
procedure TAppCommand.BtnLogoutClick(Sender: TObject);
begin
  Content.ActiveCard := CardRegisterLogin;
end;

{ Find  and list command/description given a category and subcategory(optionally) }
procedure TAppCommand.BtnListCommandClick(Sender: TObject);
var
  PanelTop: Integer;
begin
  if EdSearchCategory.Text = '' then
  begin
    ShowMessage('Ingresa una categoría.');
    Exit;
  end;

  Query.Close;
  Query.SQL.Text := 'SELECT * FROM commands WHERE category = :category AND ' +
                    'subcategory = :subcategory';
  Query.Params.ParamByName('category').Value := EdSearchCategory.Text;
  Query.Params.ParamByName('subcategory').Value := EdSearchSubCategory.Text;

  try
    Query.Open;
    FreePanels;
    PanelTop := 15;
    while not Query.Eof do
    begin
      var CommandText := '   ' + Query.FieldByName('command').AsString + '  |  ' +
                         Query.FieldByName('description').AsString + '   ';
      CreatePanel(CommandText, PanelTop, Query.FieldByName('id').AsInteger);
      PanelTop := PanelTop + 70;
      Query.Next;
    end;

    if PanelTop = 15 then
      ShowMessage('No se encontraron comandos para esa categoría/subcategoría.');
  except
    on E: Exception do
      ShowMessage('Error: ' + E.Message);
  end;
end;

{ Create a new command }
procedure TAppCommand.SbCreateClick(Sender: TObject);
begin
  if not ValidateCrud(EdCategory.Text, EdCommand.Text, EdDescription.Text, True) then
    Exit;

  Query.Close;
  Query.SQL.Text := 'INSERT INTO commands(category, subcategory, command, description) ' +
                    'VALUES (:category, :subcategory, :command, :description)';
  Query.Params.ParamByName('category').Value := EdCategory.Text;
  Query.Params.ParamByName('subcategory').Value := EdSubcategory.Text;
  Query.Params.ParamByName('command').Value := EdCommand.Text;
  Query.Params.ParamByName('description').Value := EdDescription.Text;

  try
    Query.ExecSQL;
    ShowMessage('Comando creado exitosamente.');
    Content.ActiveCard := CardCommand;
    CleanInputs;
  except
    on E: Exception do
      ShowMessage('Error al crear la información: ' + E.Message);
  end;
end;

{ Update an existing command }
procedure TAppCommand.SbUpdateClick(Sender: TObject);
begin
  if not ValidateCrud(EdCatUpDel.Text, EdCommandUpDel.Text, EdDescUpDel.Text, False) then
    Exit;

  if MessageDlg('¿Estás seguro de que deseas actualizar la información?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Query.Close;
    Query.SQL.Text := 'UPDATE commands SET category = :category,' +
                      'subcategory = :subcategory, command = :command,' +
                      'description = :description WHERE id = :id';
    Query.Params.ParamByName('category').Value := EdCatUpDel.Text;
    Query.Params.ParamByName('subcategory').Value := EdSubCatUpDel.Text;
    Query.Params.ParamByName('command').Value := EdCommandUpDel.Text;
    Query.Params.ParamByName('description').Value := EdDescUpDel.Text;
    Query.Params.ParamByName('id').Value := CommandID;

    try
      Query.ExecSQL;
      Content.ActiveCard := CardCommand;
    except
      on E: Exception do
      ShowMessage('Error al actualizar la información: ' + E.Message);
    end;
  end;
end;

{ Delete an existing command }
procedure TAppCommand.SbDeleteClick(Sender: TObject);
begin
  if MessageDlg('¿Estás seguro de que deseas eliminar la información?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Query.Close;
    Query.SQL.Text := 'DELETE FROM commands WHERE id = :id';
    Query.Params.ParamByName('id').Value := CommandID;

    try
      Query.ExecSQL;
      Content.ActiveCard := CardCommand;
    except
      on E: Exception do
      ShowMessage('Error al eliminar la información: ' + E.Message);
    end;
  end;
end;

{ Log in to the app }
procedure TAppCommand.SbLoginClick(Sender: TObject);
begin
  if not ValidateLogin(EdLoginName.Text, EdLoginPassword.Text) then
    Exit;

  Query.Close;
  Query.SQL.Text := 'SELECT * FROM users WHERE name = :name AND password = :password';
  Query.Params.ParamByName('name').Value := EdLoginName.Text;
  Query.Params.ParamByName('password').Value := EdLoginPassword.Text;
  Query.Open;

  if Query.isEmpty then
  begin
    ShowMessage('Nombre de usuario o contraseña inválidos.');
    Exit;
  end;
  Content.ActiveCard := CardCommand;
end;

{ Register to the app }
procedure TAppCommand.SbRegisterClick(Sender: TObject);
begin
  if not ValidateRegister(EdRegName.Text, EdRegEmail.Text, EdRegPassword.Text, EdRegConfPassword.Text) then
    Exit;

  Query.Close;
  Query.SQL.Text := 'INSERT INTO users(name, email, password) ' +
                    'VALUES (:name, :email, :password)';
  Query.Params.ParamByName('name').Value := EdRegName.Text;
  Query.Params.ParamByName('email').Value := EdRegEmail.Text;
  Query.Params.ParamByName('password').Value := EdRegPassword.Text;
  try
    Query.ExecSQL;
    ShowMessage('Registro exitoso!');
    Content.ActiveCard := CardCommand;
  except
    on E: Exception do
      ShowMessage('Error: ' + E.Message);
  end;
end;

{ Free TPanel instances }
procedure TAppCommand.FreePanels;
var
  i: Integer;
begin
  for i := SbPanelContainer.ControlCount - 1 downto 0 do
  begin
    if (SbPanelContainer.Controls[i] is TPanel) then
      SbPanelContainer.Controls[i].Free;
  end;
end;

{ Create dynamic Panel }
procedure TAppCommand.CreatePanel(const CommandText: string; PanelTop, ID: Integer);
var
  CommandPanel: TPanel;
begin
  CommandPanel := TPanel.Create(Self);
  CommandPanel.Parent := SbPanelContainer;
  CommandPanel.Width := Self.Canvas.TextWidth(CommandText);
  CommandPanel.Height := 60;
  CommandPanel.Top := PanelTop;
  CommandPanel.Left := 30;
  CommandPanel.Caption := CommandText;
  CommandPanel.Alignment := taLeftJustify;
  CommandPanel.ParentBackground := False;
  CommandPanel.Color := clSilver;
  CommandPanel.Cursor := crHandPoint;
  CommandPanel.Tag := ID;
  CommandPanel.OnClick := CommandPanelClick;
end;

{ Sets each TEdit instance with input value '' }
procedure TAppCommand.CleanInputs;
begin
  EdCategory.Text := '';
  EdSubCategory.Text := '';
  EdCommand.Text := '';
  EdDescription.Text := '';
end;

{ Register session validations }
function TAppCommand.ValidateRegister(const Name, Email, Password, ConfirmPassword: string): boolean;
begin
  Result := True;

  if Name = '' then
    Exit(DisplayMessage('Ingresa un nombre.'));

  if Email = '' then
    Exit(DisplayMessage('Ingresa un email.'));

  if Password = '' then
    Exit(DisplayMessage('Ingresa una contraseña.'));

  if Password <> ConfirmPassword then
    Exit(DisplayMessage('Las contraseñas no son iguales.'));

  Query.Close;
  Query.SQL.Text := 'SELECT name FROM users WHERE name = :name';
  Query.Params.ParamByName('name').Value := EdRegName.Text;
  Query.Open;

  if not Query.IsEmpty then
    Exit(DisplayMessage('Ya existe un usuario con ese nombre, prueba con otro.'));
end;

{ Login session validations }
function TAppCommand.ValidateLogin(const Name, Password: string): boolean;
begin
  Result := True;

  if Name = '' then
    Exit(DisplayMessage('Ingresa un nombre.'));

  if Password = '' then
    Exit(DisplayMessage('Ingresa una contraseña.'));
end;

{ Show a message and return false }
function TAppCommand.DisplayMessage(const Msg: string): boolean;
begin
  ShowMessage(Msg);
  Result := False;
end;

{ Validations for create and update commands }
function TAppCommand.ValidateCrud(const Cat, Command, Desc: string; const create: boolean): boolean;
begin
  Result := True;

  if Cat = '' then
    Exit(DisplayMessage('Ingresa una categoría.'));

  if Command = '' then
    Exit(DisplayMessage('Ingresa un comando.'));

  if Desc = '' then
    Exit(DisplayMessage('Ingresa una descripción.'));

  if create then
  begin
    Query.Close;
    Query.SQL.Text := 'SELECT command FROM commands WHERE command = :command AND ' +
                      'category = :category AND subcategory = :subcategory';
    Query.Params.ParamByName('category').Value := EdCategory.Text;
    Query.Params.ParamByName('subcategory').Value := EdSubcategory.Text;
    Query.Params.ParamByName('command').Value := EdCommand.Text;
    Query.Open;
    if not Query.IsEmpty then
      Exit(DisplayMessage('Comando existente para esa categoría y subcategoría.'));
  end;
end;
end.
