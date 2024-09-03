unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    comma: TButton;
    Del: TButton;
    Four: TButton;
    Five: TButton;
    Plus: TButton;
    Six: TButton;
    Mult: TButton;
    Delenie: TButton;
    One: TButton;
    Two: TButton;
    Three: TButton;
    Minus: TButton;
    equally: TButton;
    Clear: TButton;
    Zero: TButton;
    Cancel: TButton;
    Sqrt: TButton;
    Seven: TButton;
    Eight: TButton;
    Nine: TButton;
    Division: TButton;
    Sqr: TButton;
    Output: TEdit;
    procedure FourClick(Sender: TObject);
    procedure FiveClick(Sender: TObject);
    procedure SixClick(Sender: TObject);
    procedure MultClick(Sender: TObject);
    procedure DelenieClick(Sender: TObject);
    procedure OneClick(Sender: TObject);
    procedure TwoClick(Sender: TObject);
    procedure ThreeClick(Sender: TObject);
    procedure MinusClick(Sender: TObject);
    procedure equallyClick(Sender: TObject);
    procedure DelClick(Sender: TObject);
    procedure ZeroClick(Sender: TObject);
    procedure commaClick(Sender: TObject);
    procedure PlusClick(Sender: TObject);
    procedure ClearClick(Sender: TObject);
    procedure CancelClick(Sender: TObject);
    procedure SqrtClick(Sender: TObject);
    procedure SevenClick(Sender: TObject);
    procedure EightClick(Sender: TObject);
    procedure NineClick(Sender: TObject);
    procedure DivisionClick(Sender: TObject);
    procedure SqrClick(Sender: TObject);
    procedure OutputChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  Numb1, Numb2, Numb3: Real;
  Mark: String;

implementation

{$R *.lfm}

{ TForm1 }

//Процедура для стирания одного символа строки
procedure TForm1.DelClick(Sender: TObject);
var
  str: string;
begin
  str := Output.Text;
  //Условие проверяет строку на не пустоту
  if str <> '' then
    begin
      //Если условие истинно, то удаляется последний символ строки
      Delete(str, Length(str), 1);
    end;
  Output.Text := str;
end;

//Процедура нажатия кнопки с цифрой 0
procedure TForm1.ZeroClick(Sender: TObject);
begin
  Output.Text := Output.Text + '0';
end;

//Процедура нажатия кнопки с запятой
procedure TForm1.commaClick(Sender: TObject);
var
  a: string;
  i, count: integer;
begin
   a := ',';
  // Счётчик для подсчёта символа ","
  count := 0;
  Output.Text := Output.Text + a;
  //Циклом проходимся по строке
  for i := 1 to Length(Output.Text) do
      begin
        //Условие проверяет равен ли символ строки символу ","
        if Output.Text[i] = ',' then
          //Если условие истинно, то к счётчику прибавляется 1
          count += 1;
        //Условие проверяет введено ли 2 запятые в одной строке
        if count >= 2 then
          begin
            //Если условие истинно, то выводится сообщение, завершается процедура и очищается поле
            Output.Clear;
            ShowMessage('Некорректный ввод. Повторите попытку.');
            Exit;
          end;
      end;
end;

//Процедура нажатия кнопки сложения
procedure TForm1.PlusClick(Sender: TObject);
begin
  if Output.Text = '' then
    begin
      Output.Clear;
      ShowMessage('Некорректный ввод. Повторите попытку.');
      Exit;
    end;
  if (Output.Text <> '') or (Output.Text = Mark) then
    begin
      Numb1 := StrToFloat(Output.Text);
      Output.Clear;
      Mark := '+';
    end;
end;

//Процедура нажатия кнопки с цифрой 4
procedure TForm1.FourClick(Sender: TObject);
begin
  Output.Text := Output.Text + '4';
end;

//Процедура нажатия кнопки с цифрой 5
procedure TForm1.FiveClick(Sender: TObject);
begin
  Output.Text := Output.Text + '5';
end;

//Процедура нажатия кнопки с цифрой 6
procedure TForm1.SixClick(Sender: TObject);
begin
  Output.Text := Output.Text + '6';
end;

//Процедура для нажатия кнопки умножения
procedure TForm1.MultClick(Sender: TObject);
begin
  if Output.Text = '' then
    begin
      Output.Clear;
      ShowMessage('Некорректный ввод. Повторите попытку.');
      Exit;
    end;
  if (Output.Text <> '') or (Output.Text = Mark) then
    begin
      Numb1 := StrToFloat(Output.Text);
      Output.Clear;
      Mark := '*';
    end;
end;

//Процедура для нажатия кнопки 1/х
procedure TForm1.DelenieClick(Sender: TObject);
begin
  Numb1 := StrToFloat(Output.Text);
  //Условие проверяет значение, равное 0, т.к. на 0 делить нельзя
  if Numb1 = 0 then
    begin
      //Если условие истинно, то выводится сообщение, завершается процедура и очищается поле
      Output.Clear;
      ShowMessage('Введено некорректно значение. Повторите попытку.');
      Exit;
    end;

  Numb1 := 1 / Numb1;
  Output.Text := FloatToStr(Numb1);
end;

//Процедура нажатия кнопки с цифрой 1
procedure TForm1.OneClick(Sender: TObject);
begin
  Output.Text := Output.Text + '1';
end;

//Процедура нажатия кнопки с цифрой 2
procedure TForm1.TwoClick(Sender: TObject);
begin
  Output.Text := Output.Text + '2';
end;

//Процедура нажатия кнопки с цифрой 3
procedure TForm1.ThreeClick(Sender: TObject);
begin
  Output.Text := Output.Text + '3';
end;

//Процедура нажатия кнопки вычитания
procedure TForm1.MinusClick(Sender: TObject);
begin
  if Output.Text = '' then
    begin
      Output.Clear;
      ShowMessage('Некорректный ввод. Повторите попытку.');
      Exit;
    end;
  if (Output.Text <> '') or (Output.Text = Mark) then
    begin
      Numb1 := StrToFloat(Output.Text);
      Output.Clear;
      Mark := '-';
    end;
end;

//Процедура нажатия кнопки равно
procedure TForm1.equallyClick(Sender: TObject);
begin
  if Output.Text = '' then
    begin
      Output.Clear;
      ShowMessage('Некорректный воод. Повторите попытку.');
      Exit;
    end;
  if (Output.Text <> '') or (Output.Text = Mark) then
    begin
      Numb2 := StrToFloat(Output.Text);
      Output.Clear;
    end;

  Output.Clear;
  //Условие проверяет деление на 0
  if (Mark = '/') and (Numb2 = 0) then
    begin
      //Если условие истинно, то выводится сообщение, завершается процедура и очищается поле
      ShowMessage('На ноль делить нельзя! Повторите попытку.');
      Exit;
      Output.Clear;
    end;

  case Mark of
  '+': Numb3 := Numb1 + Numb2;
  '-': Numb3 := Numb1 - Numb2;
  '/': Numb3 := Numb1 / Numb2;
  '*': Numb3 := Numb1 * Numb2;
  end;
  Output.Text := FloatToStr(Numb3);
end;

//Процедура нажатия кнопки отмены действия
procedure TForm1.ClearClick(Sender: TObject);
begin
  Numb1 := 0;
  Numb2 := 0;
  Numb3 := 0;
  Output.Clear;
end;

//Процедура нажатия кнопки очищения поля
procedure TForm1.CancelClick(Sender: TObject);
begin
  Output.Clear;
end;

//Процедура нажатия кнопки для извлечения корня
procedure TForm1.SqrtClick(Sender: TObject);
begin
  if Output.Text <> Mark then
    begin
      Numb1 := StrToFloat(Output.Text);
      //Условие проверяет отрицательно ли значение, т.к. нельзя извлекать корень из отрицательного значения
      if Numb1 < 0 then
      begin
      //Если условие истинно, то выводится сообщение, завершается процедура и очищается поле
             Output.Clear;
             ShowMessage('Введено некорректно значение. Повторите попытку.');
             Exit;
      end;

  Numb1 := Sqrt(Numb1);
  Output.Text := FloatToStr(Numb1);

    end;

  if Output.Text = Mark then
     begin
       Output.Clear;
       ShowMessage('Введено некорректное значение. Повторите попытку.');
       Exit;
     end;

end;

//Процедура нажатия кнопки с цифрой 7
procedure TForm1.SevenClick(Sender: TObject);
begin
  Output.Text := Output.Text + '7';
end;

//Процедура нажатия кнопки с цифрой 8
procedure TForm1.EightClick(Sender: TObject);
begin
  Output.Text := Output.Text + '8';

end;

//Процедура нажатия кнопки с цифрой 9
procedure TForm1.NineClick(Sender: TObject);
begin
  Output.Text := Output.Text + '9';
end;

//Процедура нажатия кнопки деления
procedure TForm1.DivisionClick(Sender: TObject);
begin
  if Output.Text = '' then
    begin
      Output.Clear;
      ShowMessage('Некорректный ввод. Повторите попытку.');
      Exit;
    end;
  if (Output.Text <> '') or (Output.Text = Mark) then
    begin
      Numb1 := StrToFloat(Output.Text);
      Output.Clear;
      Mark := '/';
    end;
end;

//Процедура нажатия кнопки возведения в квадрат
procedure TForm1.SqrClick(Sender: TObject);
begin
  Numb1 := StrToFloat(Output.Text);
  Numb1 := Sqr(Numb1);
  Output.Text := FloatToStr(Numb1);
end;

end.

