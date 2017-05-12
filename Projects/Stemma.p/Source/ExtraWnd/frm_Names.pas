unit frm_Names;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Grids,
  StdCtrls, ExtCtrls, Spin, Menus, FMUtils, frm_EditName, LCLType, Buttons,
  ComboEx, ActnList, ComCtrls, Types;

type

  { TfrmNames }

  TfrmNames = class(TForm)
    actNamesDelete: TAction;
    actNamesEdit: TAction;
    actNamesAdd: TAction;
    actNamesSetPrefered: TAction;
    alsNames: TActionList;
    cbxSex: TComboBoxEx;
    cbxLiving: TComboBoxEx;
    ilIcons: TImageList;
    lblLastModification: TLabel;
    mniNamesSetPrefered: TMenuItem;
    mniSeparator: TMenuItem;
    mniNamesAdd: TMenuItem;
    mniNamesEdit: TMenuItem;
    mniNamesDelete: TMenuItem;
    lblModificationDate: TLabel;
    mnuNames: TPopupMenu;
    edtInterest: TSpinEdit;
    grdNames: TStringGrid;
    Panel1: TPanel;
    ToolBar1: TToolBar;
    procedure actNamesDeleteUpdate(Sender: TObject);
    procedure actNamesSetPreferedUpdate(Sender: TObject);
    procedure cbxLivingChange(Sender: TObject);
    procedure cbxSexChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var {%H-}CloseAction: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtInterestChange(Sender: TObject);
    procedure actNamesSetPreferedExecute(Sender: TObject);
    procedure actNamesAddExecute(Sender: TObject);
    procedure actNamesDeleteExecute(Sender: TObject);
    procedure cbxLivingDblClick(Sender: TObject);
    procedure actNamesEditExecute(Sender: TObject);
    procedure grdNamesContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure grdNamesDrawCell(Sender: TObject; aCol, aRow: Integer;
      aRect: TRect; {%H-}aState: TGridDrawState);
    procedure grdNamesResize(Sender: TObject);
    procedure imgLivingDblClick(Sender: TObject);
  private
    function GetIdName: integer;
    procedure ModifyIndividual(Sender: TObject);
    procedure SetImageIcon(const lcbxEx: TComboBoxEx; const DataId: string);
    { private declarations }
  public
    { public declarations }
    procedure PopulateNom(Sender: TObject);
    property idName:integer read GetIdName;
  end;


var
  frmNames: TfrmNames;

implementation

uses
  frm_Main,cls_Translation, dm_GenData, frm_Explorer;

{$R *.lfm}

const
  imgIdChar='?FMON';
  resFilenames:array[0..4]of string=('inconnu','feminin','masculin','vivant','mort');

{ TfrmNames }

procedure TfrmNames.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
     dmGenData.OnModifyIndividual:=nil;
     dmGenData.WriteCfgFormPosition(self);
     dmGenData.WriteCfgGridPosition(grdNames as TStringGrid,5);
end;

procedure TfrmNames.cbxSexChange(Sender: TObject);
begin
  if cbxSex.ItemIndex <> cbxSex.tag then
    begin
      cbxSex.Tag := cbxSex.ItemIndex;
      dmGenData.UpdateIndSex(frmStemmaMainForm.iID,imgIdChar[cbxSex.tag+1],sender);
      dmGenData.SaveModificationTime(frmStemmaMainForm.iID);
    end;
end;

procedure TfrmNames.cbxLivingChange(Sender: TObject);
begin
   if cbxLiving.ItemIndex <> cbxLiving.tag then
    begin
      cbxLiving.Tag := cbxLiving.ItemIndex;
  dmGenData.UpdateIndLiving(frmStemmaMainForm.iID,imgIdChar[cbxLiving.Tag*cbxLiving.Tag*3+1-(cbxLiving.Tag div 2)*8],sender);
     dmGenData.SaveModificationTime(frmStemmaMainForm.iID);
    end;
end;

procedure TfrmNames.actNamesSetPreferedUpdate(Sender: TObject);
begin
  actNamesSetPrefered.Checked:=grdNames.Cells[1,grdNames.Row] = '*';
  actNamesSetPrefered.Enabled:=not actNamesSetPrefered.Checked;
end;

procedure TfrmNames.actNamesDeleteUpdate(Sender: TObject);
begin
  actNamesDelete.Enabled:=not (grdNames.Cells[1,grdNames.Row] = '*') or
    (grdNames.RowCount<3);
end;

procedure TfrmNames.FormResize(Sender: TObject);
begin

end;

procedure TfrmNames.PopulateNom(Sender: TObject);
var
  sSex, sLiving, sDate:string;
  iInterest, lidInd: LongInt;


begin
  lidInd:= frmStemmaMainForm.iID;
  dmGenData.PopulateNameTable(lidInd,grdNames);

  if dmGenData.GetDataOfInd(frmStemmaMainForm.iID,sSex,sLiving,sDate,iInterest) then
   begin
   SetImageIcon(cbxSex, sSex);
   SetImageIcon(cbxLiving, sLiving);
   edtInterest.Value := iInterest;
   lblModificationDate.Caption:=ConvertDate('1'+sDate+'030000000000',1);
   Caption:=Translation.Items[126]+' ('+IntToStr( grdNames.RowCount-1)+
     Translation.Items[127];

  end;
end;

procedure TfrmNames.FormShow(Sender: TObject);
begin
  Caption:=Translation.Items[214];
  grdNames.Cells[2,0]:=Translation.Items[185];
  grdNames.Cells[3,0]:=Translation.Items[136];
  grdNames.Cells[4,0]:=Translation.Items[176];
  grdNames.Cells[5,0]:=Translation.Items[177];
  lblLastModification.Caption:=Translation.Items[215];
  mniNamesSetPrefered.Caption:=Translation.Items[234];
  mniNamesAdd.Caption:=Translation.Items[224];
  mniNamesEdit.Caption:=Translation.Items[225];
  mniNamesDelete.Caption:=Translation.Items[226];
  dmGenData.ReadCfgFormPosition(Sender as TForm,0,0,70,1000);
  dmGenData.ReadCfgGridPosition(grdNames as TStringGrid,5);
  dmGenData.OnModifyIndividual:=@ModifyIndividual;
  PopulateNom(Sender);
end;

procedure TfrmNames.edtInterestChange(Sender: TObject);
begin
  // Enregistrer la modification
  dmGenData.UpdateIndInterrest(frmStemmaMainForm.iID,edtInterest.Value,sender);
  dmGenData.SaveModificationTime(frmStemmaMainForm.iID);
end;

procedure TfrmNames.actNamesSetPreferedExecute(Sender: TObject);
var
  temp:integer;
  lidName: Integer;
  lidInd:integer;
begin
     If grdNames.Cells[1,grdNames.row]='*' then
        ShowMessage(Translation.Items[128])
     else
        begin
        temp:=ptrint(grdNames.Objects[0,grdNames.row]);
	lidInd:=frmStemmaMainForm.iID;

        lidName:=dmGenData.getidNameofInd(lidInd);

        dmGenData.UpdateNamesPrefered( temp,lidName);
        // lblModificationDate la date de modification
        // lblModificationDate l'explorateur si affiché
        if frmStemmaMainForm.actWinExplorer.Checked then
           frmExplorer.UpdatePreferedMark(temp,lidName);

        //frmExplorer.Index.Repaint;
        dmGenData.SaveModificationTime(frmStemmaMainForm.iID);
        frmExplorer.FindIndividual;
     end;
end;

procedure TfrmNames.actNamesAddExecute(Sender: TObject);  // Ajouter
begin
//     dmGenData.PutCode('A',0);
  frmEditName.EditType:=eNET_NameVariation;
     if frmEditName.Showmodal = mrOK then
        begin
         PopulateNom(Sender);
     end;
end;

procedure TfrmNames.actNamesDeleteExecute(Sender: TObject);  // Supprimer
var
  lidName: Integer;
begin
  if grdNames.Row>0 then
     if grdNames.Cells[1,grdNames.Row]='' then
        if Application.MessageBox(Pchar(Translation.Items[129]+
           grdNames.Cells[4,grdNames.Row]+Translation.Items[28]),pchar(Translation.Items[1]),MB_YESNO)=IDYES then
           begin
           lidName:=ptrint(grdNames.Objects[0,grdNames.Row]);
           dmGenData.DeleteCitationb_TypeId('N',lidName);
           dmGenData.DeleteName(lidName);
           if frmStemmaMainForm.actWinExplorer.Checked then
              frmExplorer.DeleteIndex(lidName);
           grdNames.DeleteRow(grdNames.Row);
           dmGenData.SaveModificationTime(frmStemmaMainForm.iID);
        end;
end;

procedure TfrmNames.cbxLivingDblClick(Sender: TObject);

begin
  cbxSex.Tag := (cbxSex.Tag+1) mod 3;
  cbxSex.ItemIndex :=cbxSex.Tag;
  dmGenData.UpdateIndSex(frmStemmaMainForm.iID,imgIdChar[cbxSex.Tag+1],sender);
  dmGenData.SaveModificationTime(frmStemmaMainForm.iID);
end;

procedure TfrmNames.actNamesEditExecute(Sender: TObject);
var
  lidName: Longint;
begin
  If (grdNames.Row>0) and trystrtoint(grdNames.Cells[0, grdNames.Row],lidName) then
     begin
     frmEditName.EditType:=eNET_EditExisting;
     frmEditName.idName:=lidName;
     If frmEditName.Showmodal=mrOK then
          PopulateNom(Sender);
     end;
end;

procedure TfrmNames.grdNamesContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
var
  mC: Classes.TPoint;
begin
  mC:= grdNames.MouseToCell(MousePos);
  grdNames.Row:=mc.y;
  mnuNames.PopUp;
  Handled:=true;
end;

procedure TfrmNames.grdNamesDrawCell(Sender: TObject; aCol, aRow: Integer;
  aRect: TRect; aState: TGridDrawState);
begin
  if aCol=0 then
     begin
     (Sender as TStringGrid).Canvas.Font.Color := (Sender as TStringGrid).Canvas.Brush.Color;
     (Sender as TStringGrid).Canvas.TextOut(aRect.Left,aRect.Top,(Sender as TStringGrid).Cells[aCol,aRow]);
  end;
  if (((Sender as TStringGrid).Cells[1,aRow]='*') and (aCol>0)) then
     begin
//     if (Sender as TStringGrid).Row=aRow then
//        (Sender as TStringGrid).Canvas.Brush.Color := clBlue
//     else
//        (Sender as TStringGrid).Canvas.Brush.Color := clYellow;
//     (Sender as TStringGrid).Canvas.FillRect(aRect);
     (Sender as TStringGrid).Canvas.Font.Bold := true;
     (Sender as TStringGrid).Canvas.TextOut(aRect.Left+2,aRect.Top+2,(Sender as TStringGrid).Cells[aCol,aRow]);
  end;
end;

procedure TfrmNames.grdNamesResize(Sender: TObject);
var
  ww: Integer;
begin
  if grdNames.ColCount>5 then
    begin
  ww := grdNames.Columns[0].Width+grdNames.Columns[1].Width+grdNames.Columns[2].Width+grdNames.Columns[4].Width+grdNames.ColCount+2;
  grdNames.Columns[3].Width := grdNames.Width-ww;
    end;
end;

procedure TfrmNames.imgLivingDblClick(Sender: TObject);

begin
  cbxLiving.Tag := (cbxLiving.Tag+1) mod 3;
  cbxLiving.ItemIndex :=cbxLiving.Tag;
  dmGenData.UpdateIndSex(frmStemmaMainForm.iID,imgIdChar[cbxLiving.Tag*cbxLiving.Tag*3+1-(cbxLiving.Tag div 2)*8],sender);
  dmGenData.SaveModificationTime(frmStemmaMainForm.iID);
end;


function TfrmNames.GetIdName: integer;
begin
   result := ptrint(grdNames.Objects[0, grdNames.Row]);
end;

procedure TfrmNames.ModifyIndividual(Sender: TObject);
begin
    PopulateNom(Sender);
end;

procedure TfrmNames.SetImageIcon(const lcbxEx: TComboBoxEx; const DataId: string);
var
  i, imgid: Integer;
begin
  imgid:=-1;
  for i := 1 to length(imgIdChar) do
    if DataId=imgIdChar[i] then
      begin
      imgid:=i-1-(i div 4)*2;
      break
      end;
  if imgid>=0 then
    begin
    lcbxEx.tag := imgid;
    lcbxEx.ItemIndex:=imgid;
    end;
end;


end.
