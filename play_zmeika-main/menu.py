import sys
from tkinter import *
from tkinter import ttk
import subprocess
from PIL import Image, ImageTk


def clicked_rules_btn():
    def go_back_rules():
        window_rules.destroy()
        window_menu.deiconify()

    window_rules = Tk()
    window_rules.title("Правила игры")
    window_rules.geometry('1920x1080')
    window_rules.attributes('-fullscreen', True)
    window_rules.configure(bg='#F0F8FF')

    ttk.Style().configure("TButton", font=("Segoe print", 26), background="#F0F8FF", foreground="#87CEEB")

    title_rules = Label(window_rules, text="Правила игры", font=("Segoe print", 50), foreground='#87CEEB', background='#F0F8FF')
    title_rules.place(relx=0.5, rely=0.2, anchor="c")

    text_rules = Text(window_rules, bg='#F0F8FF', fg='black', font=('Segoe print', 16), height=15, width=100, wrap='word', borderwidth=0)
    text_rules.insert('1.0', 'Имеется поле, условно представленное в виде прямоугольника, закрашенного цветом, на котором будет происходить действие игры. На этом поле случайным образом появляется еда (в виде круга, закрашенного голубым цветом), а также бомба (в виде круга, закрашенного красным цветом). Есть змейка (связная последовательность из нескольких клеток, расположенных на игровом поле по прямой или с поворотами), которая постоянно двигается с момента запуска игры и является управляемой (при помощи стрелок на клавиатуре).Если на пути у змейки появляется еда, то еда исчезает и тут же появляется на поле в другом месте, а сама змейка при этом удлиняется на одну клеточку. Цель игры — накормить змейку, сделав её как можно длиннее. Игра оканчивается проигрышем, если змейка заходит за края игрового поля, касается самой себя или съедает бомбу.')
    text_rules.place(relx=0.5, rely=0.6, anchor='c')
    text_rules.config(state=DISABLED)

    go_btn = ttk.Button(window_rules, text="<----", command=go_back_rules)
    go_btn.place(x=0, y=0, anchor="nw", width=80, height=40)

    window_rules.mainloop()


def clicked_exit_btn():
    window_menu.destroy()
    sys.exit()


def clicked_play_btn():
    window_menu.destroy()
    subprocess.run(["play.exe"])


if __name__ == '__main__':

    window_menu = Tk()
    window_menu.title("Змейка")
    window_menu.geometry('1920x1080')
    window_menu.attributes('-fullscreen', True)
    window_menu.configure(bg='#F0F8FF')

    load = Image.open("cloud (1) (1).png")
    render = ImageTk.PhotoImage(load)

    cloud1 = Label(window_menu, image=render, background='#F0F8FF')
    cloud1.image = render
    cloud1.place(x=10, y=10)

    cloud2 = Label(window_menu, image=render, background='#F0F8FF')
    cloud2.image = render
    cloud2.place(x=150, y=150)

    cloud3 = Label(window_menu, image=render, background='#F0F8FF')
    cloud3.image = render
    cloud3.place(x=300, y=300)

    cloud4 = Label(window_menu, image=render, background='#F0F8FF')
    cloud4.image = render
    cloud4.place(x=300, y=10)

    cloud5 = Label(window_menu, image=render, background='#F0F8FF')
    cloud5.image = render
    cloud5.place(x=10, y=300)

    cloud6 = Label(window_menu, image=render, background='#F0F8FF')
    cloud6.image = render
    cloud6.place(x=400, y=460)

    cloud7 = Label(window_menu, image=render, background='#F0F8FF')
    cloud7.image = render
    cloud7.place(x=300, y=650)

    cloud8 = Label(window_menu, image=render, background='#F0F8FF')
    cloud8.image = render
    cloud8.place(x=100, y=460)

    cloud9 = Label(window_menu, image=render, background='#F0F8FF')
    cloud9.image = render
    cloud9.place(x=30, y=700)

    cloud10 = Label(window_menu, image=render, background='#F0F8FF')
    cloud10.image = render
    cloud10.place(x=500, y=750)

    cloud11 = Label(window_menu, image=render, background='#F0F8FF')
    cloud11.image = render
    cloud11.place(x=700, y=700)

    cloud12 = Label(window_menu, image=render, background='#F0F8FF')
    cloud12.image = render
    cloud12.place(x=950, y=750)

    cloud13 = Label(window_menu, image=render, background='#F0F8FF')
    cloud13.image = render
    cloud13.place(x=1200, y=750)

    cloud14 = Label(window_menu, image=render, background='#F0F8FF')
    cloud14.image = render
    cloud14.place(x=1350, y=650)

    cloud15 = Label(window_menu, image=render, background='#F0F8FF')
    cloud15.image = render
    cloud15.place(x=1100, y=550)

    cloud16 = Label(window_menu, image=render, background='#F0F8FF')
    cloud16.image = render
    cloud16.place(x=990, y=400)

    cloud17 = Label(window_menu, image=render, background='#F0F8FF')
    cloud17.image = render
    cloud17.place(x=1350, y=400)

    cloud18 = Label(window_menu, image=render, background='#F0F8FF')
    cloud18.image = render
    cloud18.place(x=1200, y=200)

    cloud19 = Label(window_menu, image=render, background='#F0F8FF')
    cloud19.image = render
    cloud19.place(x=1350, y=10)

    cloud20 = Label(window_menu, image=render, background='#F0F8FF')
    cloud20.image = render
    cloud20.place(x=1000, y=10)

    ttk.Style().configure("TButton", font=("Segoe print", 26), background="#F0F8FF", foreground="#87CEEB")

    title = ttk.Label(window_menu, text="Меню", font=("Segoe print", 100), foreground="#87CEEB", background='#F0F8FF')
    title.place(relx=0.5, rely=0.2, anchor="c")

    play_btn = ttk.Button(text="Играть", command=clicked_play_btn, cursor="heart")
    play_btn.place(relx=0.5, rely=0.4, anchor="c", width=200, height=70)
    play_btn.configure()

    rules_btn = ttk.Button(text="Правила", command=clicked_rules_btn, cursor="heart")
    rules_btn.place(relx=0.5, rely=0.55, anchor="c", width=200, height=70)

    exit_btn = ttk.Button(text="Выйти", command=clicked_exit_btn, cursor="X_cursor")
    exit_btn.place(relx=0.5, rely=0.7, anchor="c", width=200, height=70)

    window_menu.mainloop()




