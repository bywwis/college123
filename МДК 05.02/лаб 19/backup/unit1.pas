unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button2: TButton;
    Button20: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Edit1: TEdit;
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
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
procedure TForm1.Button1Click(Sender: TObject);
var
  str: string;
begin
  str := Edit1.Text;
  //Условие проверяет строку на не пустоту
  if str <> '' then
    begin
      //Если условие истинно, то удаляется последний символ строки
      Delete(str, Length(str), 1);
    end;
  Edit1.Text := str;
end;

//Процедура нажатия кнопки с цифрой 0
procedure TForm1.Button20Click(Sender: TObject);
begin
  Edit1.Text := Edit1.Text + '0';
end;

//Процедура нажатия кнопки с запятой
procedure TForm1.Button22Click(Sender: TObject);
var
  a: string;
  i, count: integer;
begin
   a := ',';
  // Счётчик для подсчёта символа ","
  count := 0;
  Edit1.Text := Edit1.Text + a;
  //Циклом проходимся по строке
  for i := 1 to Length(Edit1.Text) do
      begin
        //Условие проверяет равен ли символ строки символу ","
        if Edit1.Text[i] = ',' then
          //Если условие истинно, то к счётчику прибавляется 1
          count += 1;
        //Условие проверяет введено ли 2 запятые в одной строке
        if count >= 2 then
          begin
            //Если условие истинно, то выводится сообщение, завершается процедура и очищается поле
            Edit1.Clear;
            ShowMessage('Некорректный ввод. Повторите попытку.');
            Exit;
          end;
      end;
end;

//Процедура нажатия кнопки сложения
procedure TForm1.Button23Click(Sender: TObject);
begin
  if Edit1.Text = '' then
    begin
      Edit1.Clear;
      ShowMessage('Некорректный ввод. Повторите попытку.');
      Exit;
    end;
  if (Edit1.Text <> '') or (Edit1.Text = Mark) then
    begin
      Numb1 := StrToFloat(Edit1.Text);
      Edit1.Clear;
      Mark := '+';
    end;
end;

//Процедура нажатия кнопки с цифрой 4
procedure TForm1.Button10Click(Sender: TObject);
begin
  Edit1.Text := Edit1.Text + '4';
end;

//Процедура нажатия кнопки с цифрой 5
procedure TForm1.Button11Click(Sender: TObject);
begin
  Edit1.Text := Edit1.Text + '5';
end;

//Процедура нажатия кнопки с цифрой 6
procedure TForm1.Button12Click(Sender: TObject);
begin
  Edit1.Text := Edit1.Text + '6';
end;

//Процедура для нажатия кнопки умножения
procedure TForm1.Button13Click(Sender: TObject);
begin
  if Edit1.Text = '' then
    begin
      Edit1.Clear;
      ShowMessage('Некорректный ввод. Повторите попытку.');
      Exit;
    end;
  if (Edit1.Text <> '') or (Edit1.Text = Mark) then
    begin
      Numb1 := StrToFloat(Edit1.Text);
      Edit1.Clear;
      Mark := '*';
    end;
end;

//Процедура для нажатия кнопки 1/х
procedure TForm1.Button14Click(Sender: TObject);
begin
  Numb1 := StrToFloat(Edit1.Text);
  //Условие проверяет значение, равное 0, т.к. на 0 делить нельзя
  if Numb1 = 0 then
    begin
      //Если условие истинно, то выводится сообщение, завершается процедура и очищается поле
      Edit1.Clear;
      ShowMessage('Введено некорректно значение. Повторите попытку.');
      Exit;
    end;

  Numb1 := 1 / Numb1;
  Edit1.Text := FloatToStr(Numb1);
end;

//Процедура нажатия кнопки с цифрой 1
procedure TForm1.Button15Click(Sender: TObject);
begin
  Edit1.Text := Edit1.Text + '1';
end;

//Процедура нажатия кнопки с цифрой 2
procedure TForm1.Button16Click(Sender: TObject);
begin
  Edit1.Text := Edit1.Text + '2';
end;

//Процедура нажатия кнопки с цифрой 3
procedure TForm1.Button17Click(Sender: TObject);
begin
  Edit1.Text := Edit1.Text + '3';
end;

//Процедура нажатия кнопки вычитания
procedure TForm1.Button18Click(Sender: TObject);
begin
  if Edit1.Text = '' then
    begin
      Edit1.Clear;
      ShowMessage('Некорректный ввод. Повторите попытку.');
      Exit;
    end;
  if (Edit1.Text <> '') or (Edit1.Text = Mark) then
    begin
      Numb1 := StrToFloat(Edit1.Text);
      Edit1.Clear;
      Mark := '-';
    end;
end;

//Процедура нажатия кнопки равно
procedure TForm1.Button19Click(Sender: TObject);
begin
  if Edit1.Text = '' then
    begin
      Edit1.Clear;
      ShowMessage('Некорректный воод. Повторите попытку.');
      Exit;
    end;
  if (Edit1.Text <> '') or (Edit1.Text = Mark) then
    begin
      Numb2 := StrToFloat(Edit1.Text);
      Edit1.Clear;
    end;

  Edit1.Clear;
  //Условие проверяет деление на 0
  if (Mark = '/') and (Numb2 = 0) then
    begin
      //Если условие истинно, то выводится сообщение, завершается процедура и очищается поле
      ShowMessage('На ноль делить нельзя! Повторите попытку.');
      Exit;
      Edit1.Clear;
    end;

  case Mark of
  '+': Numb3 := Numb1 + Numb2;
  '-': Numb3 := Numb1 - Numb2;
  '/': Numb3 := Numb1 / Numb2;
  '*': Numb3 := Numb1 * Numb2;
  end;
  Edit1.Text := FloatToStr(Numb3);
end;

//Процедура нажатия кнопки отмены действия
procedure TForm1.Button2Click(Sender: TObject);
begin
  Numb1 := 0;
  Numb2 := 0;
  Numb3 := 0;
  Edit1.Clear;
end;

//Процедура нажатия кнопки очищения поля
procedure TForm1.Button3Click(Sender: TObject);
begin
  Edit1.Clear;
end;

//Процедура нажатия кнопки для извлечения корня
procedure TForm1.Button4Click(Sender: TObject);
begin
  if Edit1.Text <> Mark then
    begin
      Numb1 := StrToFloat(Edit1.Text);
      //Условие проверяет отрицательно ли значение, т.к. нельзя извлекать корень из отрицательного значения
      if Numb1 < 0 then
      begin
      //Если условие истинно, то выводится сообщение, завершается процедура и очищается поле
             Edit1.Clear;
             ShowMessage('Введено некорректно значение. Повторите попытку.');
             Exit;
      end;

  Numb1 := Sqrt(Numb1);
  Edit1.Text := FloatToStr(Numb1);

    end;

  if Edit1.Text = Mark then
     begin
       Edit1.Clear;
       ShowMessage('Введено некорректное значение. Повторите попытку.');
       Exit;
     end;

end;

//Процедура нажатия кнопки с цифрой 7
procedure TForm1.Button5Click(Sender: TObject);
begin
  Edit1.Text := Edit1.Text + '7';
end;

//Процедура нажатия кнопки с цифрой 8
procedure TForm1.Button6Click(Sender: TObject);
begin
  Edit1.Text := Edit1.Text + '8';

end;

//Процедура нажатия кнопки с цифрой 9
procedure TForm1.Button7Click(Sender: TObject);
begin
  Edit1.Text := Edit1.Text + '9';
end;

//Процедура нажатия кнопки деления
procedure TForm1.Button8Click(Sender: TObject);
begin
  if Edit1.Text = '' then
    begin
      Edit1.Clear;
      ShowMessage('Некорректный ввод. Повторите попытку.');
      Exit;
    end;
  if (Edit1.Text <> '') or (Edit1.Text = Mark) then
    begin
      Numb1 := StrToFloat(Edit1.Text);
      Edit1.Clear;
      Mark := '/';
    end;
end;

//Процедура нажатия кнопки возведения в квадрат
procedure TForm1.Button9Click(Sender: TObject);
begin
  Numb1 := StrToFloat(Edit1.Text);
  Numb1 := Sqr(Numb1);
  Edit1.Text := FloatToStr(Numb1);
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;


end.

