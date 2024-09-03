program Main;

uses GraphWPF, LeviCurveModule;

var 
  painting := false;
  level := 1;
  (x0,y0):=(Window.Width/3,Window.Height-Window.Height/3);
  (x1,y1):=(Window.Width-Window.Width/3,Window.Height-Window.Height/3);

procedure keyDown(k:key);
begin
  if not painting then begin
    painting := true;
    case k of
      key.Add,key.OemPlus: level += 1;
      key.Subtract,key.OemMinus: if level > 1 then level -= 1;
      key.W : (y0,y1):=(y0-10,y1-10);
      key.S : (y0,y1):=(y0+10,y1+10);
      key.A : (x0,x1):=(x0-10,x1-10);
      key.D : (x0,x1):=(x0+10,x1+10);
      key.Q : (x0,y0,x1,y1):=((x0-window.Center.X)*0.9+window.Center.x,(y0-window.Center.y)*0.9+window.Center.y,(x1-window.Center.X)*0.9+window.Center.x,(y0-window.Center.y)*0.9+window.Center.y);
      key.E : (x0,y0,x1,y1):=((x0-window.Center.X)*1.1+window.Center.x,(y0-window.Center.y)*1.1+window.Center.y,(x1-window.Center.X)*1.1+window.Center.x,(y0-window.Center.y)*1.1+window.Center.y);
    else
      window.Caption := $'key = {k}';
      painting := false;
      exit;
    end;
    window.Clear;
    DrawLevi(level,x0,y0,x1,y1); 
    painting := false;
    window.Caption:='Кривая Леви ' + level + ' +/- - глубина,  WASD - сдвинуть,  Q/E - дальше/ближе';
  end;
end;

begin
  DrawLevi(level,x0,y0,x1,y1);
  OnKeyDown:=keyDown;
end.