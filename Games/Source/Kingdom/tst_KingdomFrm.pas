unit tst_KingdomFrm;

{$IFDEF FPC}
{$mode delphi}{$H+}
{$ENDIF}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, frm_KingdomMain;

type
  TKingdomTestForm=class(TfrmKingdomMain)
  end;

  { KingdomProxyClass }

  { TKingdom }

  TKingdom=record
  private
    function GetArea: integer;
    function GetDeath: integer;
    function GetDeathSum: integer;
    function GetDistributedFood: integer;
    function GetGameEnded: Boolean;
    function GetLandInProduction: integer;
    function getLandPerPopPerc: integer;
    function GetLandPrice: integer;
    function GetPopSum: integer;
    function GetPopulation: integer;
    function GetStorage: integer;
    function GetYear: integer;
  public
    test:TTestCase;
     function BuySellLand(Amount:integer):boolean;
     function Distribute(aValue:integer):boolean;
     function Production(aValue:integer):boolean;
     Procedure NewGame;
     Function NewYear(keep: boolean):boolean;
     property Year:integer read GetYear;
     Property LandPrice:integer read GetLandPrice ;
     PRoperty Area:integer read GetArea;
     property Population:integer read GetPopulation;
     property Death:integer read GetDeath;
     property DeathSum:integer read GetDeathSum;
     property DeathPerc:integer read GetPopSum;
     property LandPerPopPerc:integer read GetLandPerPopPerc;
     Property Storage:integer read GetStorage;
     property LandInProd:integer read GetLandInProduction;
     Property Distributed:integer read GetDistributedFood;
     Property GameEnded:Boolean read GetGameEnded;
  end;

  { TTestKingdomFrm }

  TTestKingdomFrm= class(TTestCase)
  private
    FKingdom:TKingdom;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  public
    constructor Create; override;
  published
    procedure TestSetUp;
    PROCEDURE TestGameRun0;
  PROCEDURE TestSetProd;
    PROCEDURE TestBuySell;
    PROCEDURE TestDistribute;
    PROCEDURE TestNewYear;
    Procedure TestExpellation;
  end;

implementation

uses Forms,unt_KingdomBase;

{ TKingdom }

function TKingdom.GetArea: integer;
begin
  frmKingdomMain.ActiveControl:=frmKingdomMain.edtArea;
  Application.ProcessMessages;
  sleep(100);
  trystrtoint(frmKingdomMain.edtArea.Text,result);
  //result := TKingdomTestForm(frmKingdomMain).Kingdom.Area;
end;

function TKingdom.GetDeath: integer;
begin
  result := TKingdomTestForm(frmKingdomMain).Kingdom.Death;
end;

function TKingdom.GetDeathSum: integer;
begin
  result := TKingdomTestForm(frmKingdomMain).Kingdom.DeathSum;
end;

function TKingdom.GetDistributedFood: integer;
begin
  result := TKingdomTestForm(frmKingdomMain).Kingdom.Distributed;
end;

function TKingdom.GetGameEnded: Boolean;
begin
  result := TKingdomTestForm(frmKingdomMain).Kingdom.GameEnded;
end;

function TKingdom.GetLandInProduction: integer;
begin
  result := TKingdomTestForm(frmKingdomMain).Kingdom.LandInProd;
end;

function TKingdom.getLandPerPopPerc: integer;
begin
  result := TKingdomTestForm(frmKingdomMain).Kingdom.LandPerPopPerc;
end;

function TKingdom.GetLandPrice: integer;
begin
  frmKingdomMain.ActiveControl:=frmKingdomMain.edtPriceOfLand;
  Application.ProcessMessages;
  sleep(100);
  trystrtoint(frmKingdomMain.edtPriceOfLand.Text,result);
  //result := TKingdomTestForm(frmKingdomMain).Kingdom.LandPrice;

end;

function TKingdom.GetPopSum: integer;
begin
  result := TKingdomTestForm(frmKingdomMain).Kingdom.DeathPerc;
end;

function TKingdom.GetPopulation: integer;
begin
  frmKingdomMain.ActiveControl:=frmKingdomMain.edtPopulation;
  Application.ProcessMessages;
  sleep(100);
  trystrtoint(frmKingdomMain.edtPopulation.Text,result);
  //result := TKingdomTestForm(frmKingdomMain).Kingdom.Population;

end;

function TKingdom.GetStorage: integer;
begin
  frmKingdomMain.ActiveControl:=frmKingdomMain.edtStorage;
  Application.ProcessMessages;
  sleep(100);
  trystrtoint(frmKingdomMain.edtStorage.Text,result);
  //result := TKingdomTestForm(frmKingdomMain).Kingdom.Storage;
end;

function TKingdom.GetYear: integer;
begin
  result := TKingdomTestForm(frmKingdomMain).Kingdom.Year;
end;

function TKingdom.BuySellLand(Amount: integer): boolean;
begin
  frmKingdomMain.ActiveControl:=frmKingdomMain.edtAmountOfLand;
  Application.ProcessMessages;
  sleep(100);
  frmKingdomMain.edtAmountOfLand.Text:=inttostr(abs(amount));
  Application.ProcessMessages;
  sleep(100);
  test.CheckEquals(abs(Amount),frmKingdomMain.edtAmountOfLand.Value,'AmountOfLand.Value');

  if Amount>=0 then
    begin
      frmKingdomMain.ActiveControl:=frmKingdomMain.btnBuy;
        Application.ProcessMessages;
        sleep(100);
  frmKingdomMain.btnBuyClick(frmKingdomMain.btnBuy)
    end
  else
    begin
      frmKingdomMain.ActiveControl:=frmKingdomMain.btnSell;
        Application.ProcessMessages;
        sleep(100);
  frmKingdomMain.btnSellClick(frmKingdomMain.btnSell);
    end;
  Application.ProcessMessages;
  sleep(100);
  result := frmKingdomMain.Memo1.Lines[frmKingdomMain.Memo1.Lines.Count-1] = rsOK;
  Application.ProcessMessages;
  sleep(100);
end;

function TKingdom.Distribute(aValue: integer): boolean;
begin
  frmKingdomMain.ActiveControl:=frmKingdomMain.edtDistrFood;
    Application.ProcessMessages;
    sleep(100);
  if avalue< frmKingdomMain.edtDistrFood.MinValue then
    frmKingdomMain.edtDistrFood.MinValue:=aValue;
  frmKingdomMain.edtDistrFood.Text:=inttostr(aValue);
  Application.ProcessMessages;
  sleep(100);
  test.CheckEquals(aValue,frmKingdomMain.edtDistrFood.Value,'DistrFood.Value');
        frmKingdomMain.ActiveControl:=frmKingdomMain.btnDistrFood;
        Application.ProcessMessages;
        sleep(100);
  frmKingdomMain.btnDistrFoodClick(frmKingdomMain.btnDistrFood);
    Application.ProcessMessages;
  sleep(100);
  result := frmKingdomMain.Memo1.Lines[frmKingdomMain.Memo1.Lines.Count-1] = rsOK;
    Application.ProcessMessages;
  sleep(100);
end;

function TKingdom.Production(aValue: integer): boolean;
begin
        frmKingdomMain.ActiveControl:=frmKingdomMain.edtAmountOfLand2;
        Application.ProcessMessages;
        sleep(100);
  if avalue< frmKingdomMain.edtAmountOfLand2.MinValue then
    frmKingdomMain.edtAmountOfLand2.MinValue:=aValue;
  frmKingdomMain.edtAmountOfLand2.Text:=inttostr(aValue);
    Application.ProcessMessages;
  sleep(100);
  test.CheckEquals(aValue,frmKingdomMain.edtAmountOfLand2.Value,'AmountOfLand2.Value');
        frmKingdomMain.ActiveControl:=frmKingdomMain.btnProduce;
        Application.ProcessMessages;
        sleep(100);
  frmKingdomMain.btnProduceClick(frmKingdomMain.btnProduce);
    Application.ProcessMessages;
  sleep(100);
  result := frmKingdomMain.Memo1.Lines[frmKingdomMain.Memo1.Lines.Count-1] = rsOK;
    Application.ProcessMessages;
  sleep(100);
  if frmKingdomMain.edtAmountOfLand2.MinValue<0 then
    frmKingdomMain.edtAmountOfLand2.MinValue:=0;
end;

procedure TKingdom.NewGame;
begin
  frmKingdomMain.ActiveControl:=frmKingdomMain.btnNew;
    Application.ProcessMessages;
    sleep(100);
  frmKingdomMain.btnNewClick(frmKingdomMain.btnNew);
  Application.ProcessMessages;
  sleep(100);
end;

function TKingdom.NewYear(keep: boolean): boolean;
var
  lOYear: Integer;
begin
  lOYear := Year;
  frmKingdomMain.ActiveControl:=frmKingdomMain.btnNext;
    Application.ProcessMessages;
    sleep(100);
  frmKingdomMain.btnNextClick(frmKingdomMain.btnNext);
  Application.ProcessMessages;
  sleep(100);
  result := Year>lOYear;
  Application.ProcessMessages;
  sleep(100);
end;

procedure TTestKingdomFrm.TestSetUp;
begin
  CheckNotNull(frmKingdomMain,'Kingdom Mainform is assigned');
  CheckTrue(frmKingdomMain.Visible);
end;

procedure TTestKingdomFrm.TestGameRun0;
begin
  RandSeed := 0;
  Application.Minimize;
  Application.Restore;
   frmKingdomMain.btnNewClick(frmKingdomMain.btnNew);
   CheckFalse(TKingdomTestForm(frmKingdomMain).kingdom.GameEnded, 'Game has not ended yet');
   CheckEquals(1, TKingdomTestForm(frmKingdomMain).Kingdom.Year, 'Game is in Year 1');
   CheckEquals('1000', frmKingdomMain.edtArea.Text, 'Area');
   CheckEquals('100', frmKingdomMain.edtPopulation.Text, 'Population');
   CheckEquals('2800', frmKingdomMain.edtStorage.Text, 'Storage');
   CheckEquals(0, TKingdomTestForm(frmKingdomMain).Kingdom.LandInProd, 'LandInProd');
   CheckEquals(0, TKingdomTestForm(frmKingdomMain).Kingdom.Distributed, 'Distributed');
   CheckEquals('21', frmKingdomMain.edtPriceOfLand.Text, 'LandPrice');
   //-- First Move
   CheckEquals(True, FKingdom.BuySellLand(19), 'Buy 19 Land succesful');
   CheckEquals(True, FKingdom.Distribute(1900), 'Distribute 1900 tufts succesful');
   CheckEquals(True, FKingdom.Production(1000), 'Production 1000 Land succesful');
   checkequals(True, FKingdom.NewYear(False), 'New Year successful');
   // -- Check Values
   CheckFalse(FKingdom.GameEnded, 'Game has not ended yet');
   CheckEquals(2, FKingdom.Year, 'Game is in Year 2');
   CheckEquals(1019, FKingdom.Area, '[2] Area');
   CheckEquals(107, FKingdom.Population, '[2] Population');
   CheckEquals(952, FKingdom.LandPerPopPerc, '[2] Population per Land');
   CheckEquals(5, FKingdom.Death, '[2] Death');
   CheckEquals(5, FKingdom.DeathSum, '[2] DeathSum');
   CheckEquals(5, FKingdom.DeathPerc, '[2] DeathPerc');
   CheckEquals(3001, FKingdom.Storage, '[2] Storage');
   CheckEquals(0, FKingdom.LandInProd, '[2] LandInProd');
   CheckEquals(0, FKingdom.Distributed, '[2] Distributed');
   CheckEquals(21, FKingdom.LandPrice, '[2] LandPrice');
   //-- [2] Move
   CheckEquals(True, FKingdom.BuySellLand(51), 'Buy 51 Land succesful');
   CheckEquals(True, FKingdom.Production(1070), 'Production 1000 Land succesful');
   CheckEquals(True, FKingdom.BuySellLand(-1070), 'Sell 1070 Land succesful');
   CheckEquals(True, FKingdom.Distribute(2140), 'Distribute 1900 tufts succesful');
   checkequals(True, FKingdom.NewYear(False), 'New Year successful');
   // -- Check Values
   CheckFalse(FKingdom.GameEnded, 'Game has not ended yet');
   CheckEquals(3, FKingdom.Year, 'Game is in Year 3');
   CheckEquals(0, FKingdom.Area, '[3] Area');
   CheckEquals(118, FKingdom.Population, '[3] Population');
   CheckEquals(0, FKingdom.LandPerPopPerc, '[3] Population per Land');
   CheckEquals(0, FKingdom.Death, '[3] Death');
   CheckEquals(5, FKingdom.DeathSum, '[3] DeathSum');
   CheckEquals(2, FKingdom.DeathPerc, '[3] DeathPerc');
   CheckEquals(27075, FKingdom.Storage, '[3] Storage');
   CheckEquals(0, FKingdom.LandInProd, '[3] LandInProd');
   CheckEquals(0, FKingdom.Distributed, '[3] Distributed');
   CheckEquals(20, FKingdom.LandPrice, '[3] LandPrice');
   //-- [3] Move
   CheckEquals(True, FKingdom.BuySellLand(1180), 'Buy 1180 Land succesful');
   CheckEquals(True, FKingdom.Production(1180), 'Production 1180 Land succesful');
   CheckEquals(True, FKingdom.BuySellLand(-1180), 'Sell 1180 Land succesful');
   CheckEquals(True, FKingdom.Distribute(2360), 'Distribute 2360 tufts succesful');
   checkequals(True, FKingdom.NewYear(False), 'New Year successful');
   // -- Check Values
   CheckFalse(FKingdom.GameEnded, 'Game has not ended yet');
   CheckEquals(4, FKingdom.Year, 'Game is in Year 4');
   CheckEquals(0, FKingdom.Area, '[4] Area');
   CheckEquals(121, FKingdom.Population, '[4] Population');
   CheckEquals(0, FKingdom.LandPerPopPerc, '[4] Population per Land');
   CheckEquals(0, FKingdom.Death, '[4] Death');
   CheckEquals(5, FKingdom.DeathSum, '[4] DeathSum');
   CheckEquals(1, FKingdom.DeathPerc, '[4] DeathPerc');
   CheckEquals(26485, FKingdom.Storage, '[4] Storage');
   CheckEquals(0, FKingdom.LandInProd, '[4] LandInProd');
   CheckEquals(0, FKingdom.Distributed, '[4] Distributed');
   CheckEquals(19, FKingdom.LandPrice, '[4] LandPrice');
   //-- [4] Move
   CheckEquals(True, FKingdom.BuySellLand(1234), 'Buy 1234 Land succesful');
   CheckEquals(True, FKingdom.Production(1210), 'Production 1210 Land succesful');
   //  CheckEquals(true,FKingdom.BuySellLand(-1180),'Sell 1180 Land succesful');
   CheckEquals(True, FKingdom.Distribute(2420), 'Distribute 2420 tufts succesful');
   checkequals(True, FKingdom.NewYear(False), 'New Year successful');
   // -- Check Values
   CheckFalse(FKingdom.GameEnded, 'Game has not ended yet');
   CheckEquals(5, FKingdom.Year, 'Game is in Year 5');
   CheckEquals(1234, FKingdom.Area, '[5] Area');
   CheckEquals(133, FKingdom.Population, '[5] Population');
   CheckEquals(927, FKingdom.LandPerPopPerc, '[5] Population per Land');
   CheckEquals(0, FKingdom.Death, '[5] Death');
   CheckEquals(5, FKingdom.DeathSum, '[5] DeathSum');
   CheckEquals(0, FKingdom.DeathPerc, '[5] DeathPerc');
   CheckEquals(3641, FKingdom.Storage, '[5] Storage');
   CheckEquals(0, FKingdom.LandInProd, '[5] LandInProd');
   CheckEquals(0, FKingdom.Distributed, '[5] Distributed');
   CheckEquals(21, FKingdom.LandPrice, '[5] LandPrice');
   //-- [5] Move
   CheckEquals(True, FKingdom.BuySellLand(96), 'Buy 96 Land succesful');
   CheckEquals(True, FKingdom.Production(1330), 'Production 1330 Land succesful');
   CheckEquals(True, FKingdom.BuySellLand(-1330), 'Sell 1330 Land succesful');
   CheckEquals(True, FKingdom.Distribute(2660), 'Distribute 2660 tufts succesful');
   checkequals(True, FKingdom.NewYear(False), 'New Year successful');
   // -- Check Values
   CheckFalse(FKingdom.GameEnded, 'Game has not ended yet');
   CheckEquals(6, FKingdom.Year, 'Game is in Year 6');
   CheckEquals(0, FKingdom.Area, '[6] Area');
   CheckEquals(144, FKingdom.Population, '[6] Population');
   CheckEquals(0, FKingdom.LandPerPopPerc, '[6] Population per Land');
   CheckEquals(0, FKingdom.Death, '[6] Death');
   CheckEquals(5, FKingdom.DeathSum, '[6] DeathSum');
   CheckEquals(0, FKingdom.DeathPerc, '[6] DeathPerc');
   CheckEquals(28890, FKingdom.Storage, '[6] Storage');
   CheckEquals(0, FKingdom.LandInProd, '[6] LandInProd');
   CheckEquals(0, FKingdom.Distributed, '[6] Distributed');
   CheckEquals(16, FKingdom.LandPrice, '[6] LandPrice');
   //-- [6] Move
   CheckEquals(True, FKingdom.BuySellLand(1580), 'Buy 1580 Land succesful');
   CheckEquals(True, FKingdom.Production(1440), 'Production 1180 Land succesful');
   //  CheckEquals(true,FKingdom.BuySellLand(-1330),'Sell 1180 Land succesful');
   CheckEquals(True, FKingdom.Distribute(2880), 'Distribute 2880 tufts succesful');
   checkequals(True, FKingdom.NewYear(False), 'New Year successful');
   // -- Check Values
   CheckFalse(FKingdom.GameEnded, 'Game has not ended yet');
   CheckEquals(7, FKingdom.Year, 'Game is in Year 7');
   CheckEquals(1580, FKingdom.Area, '[7] Area');
   CheckEquals(150, FKingdom.Population, '[7] Population');
   CheckEquals(1053, FKingdom.LandPerPopPerc, '[7] Population per Land');
   CheckEquals(0, FKingdom.Death, '[7] Death');
   CheckEquals(5, FKingdom.DeathSum, '[7] DeathSum');
   CheckEquals(0, FKingdom.DeathPerc, '[7] DeathPerc');
   CheckEquals(5770, FKingdom.Storage, '[7] Storage');
   CheckEquals(0, FKingdom.LandInProd, '[7] LandInProd');
   CheckEquals(0, FKingdom.Distributed, '[7] Distributed');
   CheckEquals(23, FKingdom.LandPrice, '[7] LandPrice');
   //-- [7] Move
   CheckEquals(True, FKingdom.BuySellLand(87), 'Buy 1580 Land succesful');
   CheckEquals(True, FKingdom.Production(1500), 'Production 1500 Land succesful');
   //  CheckEquals(true,FKingdom.BuySellLand(-1580),'Sell 1580 Land succesful');
   CheckEquals(True, FKingdom.Distribute(3000), 'Distribute 3000 tufts succesful');
   checkequals(True, FKingdom.NewYear(False), 'New Year successful');
   // -- Check Values
   CheckFalse(FKingdom.GameEnded, 'Game has not ended yet');
   CheckEquals(8, FKingdom.Year, 'Game is in Year 8');
   CheckEquals(1667, FKingdom.Area, '[8] Area');
   CheckEquals(162, FKingdom.Population, '[8] Population');
   CheckEquals(1029, FKingdom.LandPerPopPerc, '[8] Population per Land');
   CheckEquals(0, FKingdom.Death, '[8] Death');
   CheckEquals(5, FKingdom.DeathSum, '[8] DeathSum');
   CheckEquals(0, FKingdom.DeathPerc, '[8] DeathPerc');
   CheckEquals(1519, FKingdom.Storage, '[8] Storage');
   CheckEquals(0, FKingdom.LandInProd, '[8] LandInProd');
   CheckEquals(0, FKingdom.Distributed, '[8] Distributed');
   CheckEquals(23, FKingdom.LandPrice, '[8] LandPrice');
   //-- [8] Move
   //    CheckEquals(true,FKingdom.BuySellLand(1580),'Buy 1580 Land succesful');
   CheckEquals(True, FKingdom.Production(1620), 'Production 1620 Land succesful');
   CheckEquals(True, FKingdom.BuySellLand(-1667), 'Sell 1667 Land succesful');
   CheckEquals(True, FKingdom.Distribute(3240), 'Distribute 3240 tufts succesful');
   checkequals(True, FKingdom.NewYear(False), 'New Year successful');
   // -- Check Values
   CheckFalse(FKingdom.GameEnded, 'Game has not ended yet');
   CheckEquals(9, FKingdom.Year, 'Game is in Year 9');
   CheckEquals(0, FKingdom.Area, '[9] Area');
   CheckEquals(171, FKingdom.Population, '[9] Population');
   CheckEquals(0, FKingdom.LandPerPopPerc, '[9] Population per Land');
   CheckEquals(0, FKingdom.Death, '[9] Death');
   CheckEquals(5, FKingdom.DeathSum, '[9] DeathSum');
   CheckEquals(0, FKingdom.DeathPerc, '[9] DeathPerc');
   CheckEquals(43910, FKingdom.Storage, '[9] Storage');
   CheckEquals(0, FKingdom.LandInProd, '[9] LandInProd');
   CheckEquals(0, FKingdom.Distributed, '[9] Distributed');
   CheckEquals(17, FKingdom.LandPrice, '[9] LandPrice');
   //-- [9] Move
   CheckEquals(True, FKingdom.BuySellLand(2330), 'Buy 2330 Land succesful');
   CheckEquals(True, FKingdom.Production(1710), 'Production 1710 Land succesful');
   //    CheckEquals(true,FKingdom.BuySellLand(-1667),'Sell 1667 Land succesful');
   CheckEquals(True, FKingdom.Distribute(3420), 'Distribute 3420 tufts succesful');
   checkequals(True, FKingdom.NewYear(False), 'New Year successful');
   // -- Check Values
   CheckFalse(FKingdom.GameEnded, 'Game has not ended yet');
   CheckEquals(10, FKingdom.Year, 'Game is in Year 10');
   CheckEquals(2330, FKingdom.Area, '[10] Area');
   CheckEquals(181, FKingdom.Population, '[10] Population');
   CheckEquals(1287, FKingdom.LandPerPopPerc, '[10] Population per Land');
   CheckEquals(0, FKingdom.Death, '[10] Death');
   CheckEquals(5, FKingdom.DeathSum, '[10] DeathSum');
   CheckEquals(0, FKingdom.DeathPerc, '[10] DeathPerc');
   CheckEquals(6859, FKingdom.Storage, '[10] Storage');
   CheckEquals(0, FKingdom.LandInProd, '[10] LandInProd');
   CheckEquals(0, FKingdom.Distributed, '[10] Distributed');
   CheckEquals(25, FKingdom.LandPrice, '[10] LandPrice');
   //-- [10] Move
   CheckEquals(True, FKingdom.BuySellLand(93), 'Buy 2330 Land succesful');
   CheckEquals(True, FKingdom.Production(1810), 'Production 1710 Land succesful');
   //    CheckEquals(true,FKingdom.BuySellLand(-1667),'Sell 1667 Land succesful');
   CheckEquals(True, FKingdom.Distribute(3620), 'Distribute 3420 tufts succesful');
   checkequals(True, FKingdom.NewYear(False), 'New Year successful');
   // -- Check Values
   CheckTrue(FKingdom.GameEnded, 'Game has not ended yet');
   CheckEquals(11, FKingdom.Year, 'Game is in Year 11');
   CheckEquals(2423, FKingdom.Area, '[11] Area');
   CheckEquals(185, FKingdom.Population, '[11] Population');
   CheckEquals(1309, FKingdom.LandPerPopPerc, '[11] Population per Land');
   CheckEquals(0, FKingdom.Death, '[11] Death');
   CheckEquals(5, FKingdom.DeathSum, '[11] DeathSum');
   CheckEquals(0, FKingdom.DeathPerc, '[11] DeathPerc');
   CheckEquals(7249, FKingdom.Storage, '[11] Storage');
   CheckEquals(0, FKingdom.LandInProd, '[11] LandInProd');
   CheckEquals(0, FKingdom.Distributed, '[11] Distributed');
   CheckEquals(18, FKingdom.LandPrice, '[11] LandPrice');
end;

procedure TTestKingdomFrm.TestSetProd;
BEGIN
  RandSeed := 0;
  FKingdom.NewGame;
  CheckFalse(FKingdom.GameEnded, 'Game has not ended yet');
  CheckEquals(1, FKingdom.Year, 'Game is in Year 1');
  CheckEquals(1000, FKingdom.Area, 'Area');
  CheckEquals(100, FKingdom.Population, 'Population');
  CheckEquals(1000, FKingdom.LandPerPopPerc, '[1] Population per Land');
  CheckEquals(0, FKingdom.Death, 'Death');
  CheckEquals(0, FKingdom.DeathSum, '[1] DeathSum');
  CheckEquals(0, FKingdom.DeathPerc, '[1] DeathPerc');
  CheckEquals(2800, FKingdom.Storage, 'Storage');
  CheckEquals(0, FKingdom.LandInProd, 'LandInProd');
  CheckEquals(0, FKingdom.Distributed, 'Distributed');
  CheckEquals(21, FKingdom.LandPrice, 'LandPrice');
  // Check-Prod
  CheckEquals(True, FKingdom.BuySellLand(19), 'Buy 19 Land succesful');
  CheckEquals(1019, FKingdom.Area, 'Area');
  CheckEquals(2401, FKingdom.Storage, 'Storage');
  CheckEquals(False, FKingdom.Production(-1), 'Negative Values are not allowed');
  CheckEquals(0, FKingdom.LandInProd, 'LandInProd');
  CheckEquals(True, FKingdom.BuySellLand(-20), 'Buy 19 Land succesful');
  CheckEquals(999, FKingdom.Area, 'Area');
  CheckEquals(2821, FKingdom.Storage, 'Storage');
  CheckEquals(False, FKingdom.Production(1000), 'Not enough land');
  CheckEquals(0, FKingdom.LandInProd, 'LandInProd');
  CheckEquals(True, FKingdom.Distribute(2324), 'Distribute 2350 succesful');
  CheckEquals(497, FKingdom.Storage, 'Storage');
  CheckEquals(False, FKingdom.Production(999), 'Not enough Resources');
  CheckEquals(0, FKingdom.LandInProd, 'LandInProd');
  // Reset Game
  RandSeed := 0;
  FKingdom.NewGame;
  CheckEquals(True, FKingdom.Production(1000), 'OK');
  CheckEquals(1000, FKingdom.LandInProd, 'LandInProd');
END;

procedure TTestKingdomFrm.TestBuySell;
begin
  RandSeed := 0;
  FKingdom.NewGame;
  CheckFalse(FKingdom.GameEnded, 'Game has not ended yet');
  CheckEquals(1, FKingdom.Year, 'Game is in Year 1');
  CheckEquals(1000, FKingdom.Area, 'Area');
  CheckEquals(100, FKingdom.Population, 'Population');
  CheckEquals(1000, FKingdom.LandPerPopPerc, '[1] Population per Land');
  CheckEquals(0, FKingdom.Death, 'Death');
  CheckEquals(0, FKingdom.DeathSum, '[1] DeathSum');
  CheckEquals(0, FKingdom.DeathPerc, '[1] DeathPerc');
  CheckEquals(2800, FKingdom.Storage, 'Storage');
  CheckEquals(0, FKingdom.LandInProd, 'LandInProd');
  CheckEquals(0, FKingdom.Distributed, 'Distributed');
  CheckEquals(21, FKingdom.LandPrice, 'LandPrice');
  // Check-Prod
  CheckEquals(True, FKingdom.BuySellLand(0), 'Buy 0 Land succesful');
  CheckEquals(1000, FKingdom.Area, 'Area');
  CheckEquals(2800, FKingdom.Storage, 'Storage');
  CheckEquals(false, FKingdom.BuySellLand(-1001), 'Sell -1001 Land unsuccesful');
  CheckEquals(1000, FKingdom.Area, 'Area');
  CheckEquals(2800, FKingdom.Storage, 'Storage');
  CheckEquals(false, FKingdom.BuySellLand(134), 'Buy 134 Land unsuccesful');
  CheckEquals(1000, FKingdom.Area, 'Area');
  CheckEquals(2800, FKingdom.Storage, 'Storage');
  CheckEquals(true, FKingdom.BuySellLand(-1000), 'Sell -1000 Land succesful');
  CheckEquals(0, FKingdom.Area, 'Area');
  CheckEquals(23800, FKingdom.Storage, 'Storage');
  CheckEquals(true, FKingdom.BuySellLand(1133), 'Buy 134 Land unsuccesful');
  CheckEquals(1133, FKingdom.Area, 'Area');
  CheckEquals(7, FKingdom.Storage, 'Storage');

end;

procedure TTestKingdomFrm.TestDistribute;
begin
  RandSeed := 0;
  FKingdom.NewGame;
  CheckFalse(FKingdom.GameEnded, 'Game has not ended yet');
  CheckEquals(1, FKingdom.Year, 'Game is in Year 1');
  CheckEquals(1000, FKingdom.Area, 'Area');
  CheckEquals(100, FKingdom.Population, 'Population');
  CheckEquals(1000, FKingdom.LandPerPopPerc, '[1] Population per Land');
  CheckEquals(0, FKingdom.Death, 'Death');
  CheckEquals(0, FKingdom.DeathSum, '[1] DeathSum');
  CheckEquals(0, FKingdom.DeathPerc, '[1] DeathPerc');
  CheckEquals(2800, FKingdom.Storage, 'Storage');
  CheckEquals(0, FKingdom.LandInProd, 'LandInProd');
  CheckEquals(0, FKingdom.Distributed, 'Distributed');
  CheckEquals(21, FKingdom.LandPrice, 'LandPrice');
  // Check-Prod
  CheckEquals(True, FKingdom.Distribute(0), 'Distribute 0 succesful');
  CheckEquals(2800, FKingdom.Storage, 'Storage');
  CheckEquals(0, FKingdom.Distributed , 'Distributed');
  CheckEquals(false, FKingdom.Distribute(-1), 'Distribute -1 unsuccesful');
  CheckEquals(2800, FKingdom.Storage, 'Storage');
  CheckEquals(0, FKingdom.Distributed , 'Distributed');
  CheckEquals(true, FKingdom.Distribute(1), 'Distribute 1 succesful');
  CheckEquals(2799, FKingdom.Storage, 'Storage');
  CheckEquals(1, FKingdom.Distributed , 'Distributed');
  CheckEquals(true, FKingdom.Distribute(999), 'Distribute 999 succesful');
  CheckEquals(1800, FKingdom.Storage, 'Storage');
  CheckEquals(1000, FKingdom.Distributed , 'Distributed');
  CheckEquals(false, FKingdom.Distribute(1801), 'Distribute 1801 unsuccesful');
  CheckEquals(1800, FKingdom.Storage, 'Storage');
  CheckEquals(1000, FKingdom.Distributed , 'Distributed');
  CheckEquals(true, FKingdom.Distribute(-1000), 'Distribute -1000 succesful');
  CheckEquals(2800, FKingdom.Storage, 'Storage');
  CheckEquals(0, FKingdom.Distributed , 'Distributed');
  CheckEquals(True, FKingdom.Production(1000), 'OK');
  CheckEquals(1000, FKingdom.LandInProd, 'LandInProd');
  CheckEquals(false, FKingdom.Distribute(2301), 'Distribute 2301 unsuccesful');
  CheckEquals(2800, FKingdom.Storage, 'Storage');
  CheckEquals(0, FKingdom.Distributed , 'Distributed');
  CheckEquals(true, FKingdom.Distribute(2300), 'Distribute 2301 unsuccesful');
  CheckEquals(500, FKingdom.Storage, 'Storage');
  CheckEquals(2300, FKingdom.Distributed , 'Distributed');

end;

procedure TTestKingdomFrm.TestNewYear;
begin
  RandSeed := 0;
  FKingdom.NewGame;
  CheckFalse(FKingdom.GameEnded, 'Game has not ended yet');
  CheckEquals(1, FKingdom.Year, 'Game is in Year 1');
  CheckEquals(1000, FKingdom.Area, 'Area');
  CheckEquals(100, FKingdom.Population, 'Population');
  CheckEquals(1000, FKingdom.LandPerPopPerc, '[1] Population per Land');
  CheckEquals(0, FKingdom.Death, 'Death');
  CheckEquals(0, FKingdom.DeathSum, '[1] DeathSum');
  CheckEquals(0, FKingdom.DeathPerc, '[1] DeathPerc');
  CheckEquals(2800, FKingdom.Storage, 'Storage');
  CheckEquals(0, FKingdom.LandInProd, 'LandInProd');
  CheckEquals(0, FKingdom.Distributed, 'Distributed');
  CheckEquals(21, FKingdom.LandPrice, 'LandPrice');
  // Check-NewYear
  checkequals(false, FKingdom.NewYear(False), 'New Year unsuccessful');
  CheckFalse(FKingdom.GameEnded, 'Game has not ended yet');
  CheckEquals(1, FKingdom.Year, 'Game is in Year 1');
  CheckEquals(true, FKingdom.Distribute(1900), 'Distribute 1900 unsuccesful');
  CheckEquals(900, FKingdom.Storage, 'Storage');
  CheckEquals(1900, FKingdom.Distributed , 'Distributed');
  checkequals(false, FKingdom.NewYear(False), 'New Year unsuccessful');
  CheckFalse(FKingdom.GameEnded, 'Game has not ended yet');
  CheckEquals(1, FKingdom.Year, 'Game is in Year 1');
  CheckEquals(True, FKingdom.Production(1000), 'OK');
  CheckEquals(1000, FKingdom.LandInProd, 'LandInProd');
  checkequals(true, FKingdom.NewYear(False), 'New Year successful');
  CheckFalse(FKingdom.GameEnded, 'Game has not ended yet');
  CheckEquals(2, FKingdom.Year, 'Game is in Year 1');
// reset
RandSeed := 0;
FKingdom.NewGame;
CheckFalse(FKingdom.GameEnded, 'Game has not ended yet');
CheckEquals(1, FKingdom.Year, 'Game is in Year 1');
checkequals(false, FKingdom.NewYear(False), 'New Year unsuccessful');
CheckFalse(FKingdom.GameEnded, 'Game has not ended yet');
CheckEquals(1, FKingdom.Year, 'Game is in Year 1');
CheckEquals(True, FKingdom.Production(1000), 'OK');
CheckEquals(1000, FKingdom.LandInProd, 'LandInProd');
checkequals(false, FKingdom.NewYear(False), 'New Year unsuccessful');
CheckFalse(FKingdom.GameEnded, 'Game has not ended yet');
CheckEquals(1, FKingdom.Year, 'Game is in Year 1');
CheckEquals(true, FKingdom.Distribute(1900), 'Distribute 1900 unsuccesful');
CheckEquals(900, FKingdom.Storage, 'Storage');
CheckEquals(1900, FKingdom.Distributed , 'Distributed');
checkequals(true, FKingdom.NewYear(False), 'New Year successful');
CheckFalse(FKingdom.GameEnded, 'Game has not ended yet');
CheckEquals(2, FKingdom.Year, 'Game is in Year 1');
end;

procedure TTestKingdomFrm.TestExpellation;
begin
  RandSeed := 0;
  FKingdom.NewGame;
  CheckFalse(FKingdom.GameEnded, 'Game has not ended yet');
  CheckEquals(1, FKingdom.Year, 'Game is in Year 1');
  CheckEquals(True, FKingdom.Production(1000), 'OK');
  CheckEquals(1000, FKingdom.LandInProd, 'LandInProd');
  CheckEquals(true, FKingdom.Distribute(1000), 'Distribute 1000 unsuccesful');
  CheckEquals(1800, FKingdom.Storage, 'Storage');
  CheckEquals(1000, FKingdom.Distributed , 'Distributed');
  checkequals(true, FKingdom.NewYear(False), 'New Year successful');
  CheckFalse(FKingdom.GameEnded, 'Game has ended');
  CheckEquals(2, FKingdom.Year, 'Game is in Year 1');
  CheckEquals(50, FKingdom.Death, 'Death');
  CheckEquals(50, FKingdom.DeathSum, '[1] DeathSum');
  CheckEquals(50, FKingdom.DeathPerc, '[1] DeathPerc');
// reset
RandSeed := 0;
FKingdom.NewGame;
CheckFalse(FKingdom.GameEnded, 'Game has not ended yet');
CheckEquals(1, FKingdom.Year, 'Game is in Year 1');
CheckEquals(True, FKingdom.Production(1000), 'OK');
CheckEquals(1000, FKingdom.LandInProd, 'LandInProd');
CheckEquals(true, FKingdom.Distribute(999), 'Distribute 999 unsuccesful');
CheckEquals(1801, FKingdom.Storage, 'Storage');
CheckEquals(999, FKingdom.Distributed , 'Distributed');
checkequals(true, FKingdom.NewYear(False), 'New Year successful');
CheckTrue(FKingdom.GameEnded, 'Game has not ended yet');
CheckEquals(2, FKingdom.Year, 'Game is in Year 1');
CheckEquals(51, FKingdom.Death, 'Death');
CheckEquals(51, FKingdom.DeathSum, '[1] DeathSum');
CheckEquals(51, FKingdom.DeathPerc, '[1] DeathPerc');
end;

procedure TTestKingdomFrm.SetUp;
begin
  if not assigned(frmKingdomMain) then
    Application.CreateForm(TKingdomTestForm,frmKingdomMain);
  frmKingdomMain.Show;
end;

procedure TTestKingdomFrm.TearDown;
begin
  frmKingdomMain.Show;
  freeandnil(frmKingdomMain);
end;

constructor TTestKingdomFrm.Create;
begin
  inherited Create;
  FKingdom.test:= self;
end;

initialization

  RegisterTest(TTestKingdomFrm);
end.

