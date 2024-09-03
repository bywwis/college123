from tkinter import *
from tkinter import ttk
import subprocess


# Кнопка "Правила"
def clicked_rules_btn():
    # Кнопка для возвращения в меню из окна "Правила"
    def go_back_rules():
        window_rules.destroy()
        window_menu.deiconify()

    # Настройка окна "Правила"
    window_rules = Tk()
    window_rules.title("Правила игры")
    window_rules.geometry('1920x1080')
    window_rules.attributes('-fullscreen', True)
    window_rules.configure(bg='#F0F8FF')

    # Стиль для кнопок в окне "Правила"
    ttk.Style().configure("TButton", font=("Segoe print", 26), background="#F0F8FF", foreground="#87CEEB")

    for widget in window_rules.winfo_children():
        widget.destroy()

    # Содержимое окна "Правила"
    # Вставить изобрадение с правилами из фигмы
    title_rules = Label(window_rules, text="Правила игры", font=("Segoe print", 50), foreground='#87CEEB', background='#F0F8FF')
    title_rules.place(relx=0.5, rely=0.2, anchor="c")

    text_rules1 = Label(window_rules,
                            text="Имеется игровое поле, на котором будет происходить действие игры. На данном поле случайным образом появляется еда (в виде кружочка, закрашенного цветом).",
                            font=('Segoe print', 12), background='#F0F8FF')
    text_rules1.place(relx=0.5, rely=0.3, anchor='c')

    text_rules2 = Label(window_rules,
                            text="Есть змейка (связная последовательность из нескольких клеток, расположенных по прямой или с поворотами), которая постоянно двигается с момента запуска игры ",
                            font=('Segoe print', 12), background='#F0F8FF')
    text_rules2.place(relx=0.5, rely=0.33, anchor='c')

    text_rules6 = Label(window_rules,
                        text="и является управляемой, ",
                        font=('Segoe print', 12), background='#F0F8FF')
    text_rules6.place(relx=0.5, rely=0.36, anchor='c')

    text_rules3 = Label(window_rules,
                            text="при помощи стрелок на клавиатуре(вверх/вниз/вправо/влево). Если на пути у змейки появляется еда, то еда исчезает и тут же появляется на поле в другом месте, ",
                            font=('Segoe print', 12), background='#F0F8FF')
    text_rules3.place(relx=0.5, rely=0.39, anchor='c')

    text_rules4 = Label(window_rules,
                            text="а сама змейка увеличивается на ОДНУ клеточку, а к счёту прибавляется 10 очков. ",
                            font=('Segoe print', 12), background='#F0F8FF')
    text_rules4.place(relx=0.5, rely=0.42, anchor='c')

    text_rules5 = Label(window_rules,
                            text="Цель игры - накормить змейку, сделав её как можно длиннее.",
                            font=('Segoe print', 12), background='#F0F8FF')
    text_rules5.place(relx=0.5, rely=0.45, anchor='c')

    text_rules5 = Label(window_rules,
                            text="Игра оканчивается, когда змейка врезается в стену или в саму себя (Стеной являтся прямоугольник, ограниченный цветом).",
                            font=('Segoe print', 12), background='#F0F8FF')
    text_rules5.place(relx=0.5, rely=0.48, anchor='c')

    go_btn = ttk.Button(window_rules, text="<----", command=go_back_rules)
    go_btn.place(x=0, y=0, anchor="nw", width=80, height=40)

    window_rules.mainloop()

# Кнопка "Выход"
def clicked_exit_btn():
    exit()

# Кнопка "Играть"
def clicked_play_btn():
    window_menu.quit()
    subprocess.Popen(["python", "play.py"])


if __name__ == '__main__':

    # Настройка окна меню
    window_menu = Tk()
    window_menu.title("Змейка")
    window_menu.geometry('1920x1080')
    window_menu.attributes('-fullscreen', True)
    window_menu.configure(bg='#F0F8FF')

    # Стиль для кнопок в окне "Меню"
    ttk.Style().configure("TButton", font=("Segoe print", 26), background="#F0F8FF", foreground="#87CEEB")

    for widget in window_menu.winfo_children():
        widget.destroy()

    # Содержимое окна "Меню"
    title = ttk.Label(window_menu, text="Меню", font=("Segoe print", 100), foreground="#87CEEB", background='#F0F8FF')
    title.place(relx=0.5, rely=0.2, anchor="c")

    play_btn = ttk.Button(text="Играть", command=clicked_play_btn)
    play_btn.place(relx=0.5, rely=0.4, anchor="c", width=200, height=70)
    play_btn.configure()

    rules_btn = ttk.Button(text="Правила", command=clicked_rules_btn)
    rules_btn.place(relx=0.5, rely=0.55, anchor="c", width=200, height=70)

    exit_btn = ttk.Button(text="Выйти", command=clicked_exit_btn)
    exit_btn.place(relx=0.5, rely=0.7, anchor="c", width=200, height=70)

    window_menu.mainloop()




