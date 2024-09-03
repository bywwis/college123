from tkinter import *
from tkinter import ttk
import random
import subprocess

WIDTH = 1400
HEIGHT = 800
SPEED = 100
SPACE_SIZE = 25
BODY_SIZE = 3
SNAKE = "#F0FFFF"
FOOD = "#00BFFF"
BACKGROUND = "#87CEEB"
BOMB = "#B22222"


score = 0
direction = 'down'


class Snake:
	def __init__(self):
		self.body_size = BODY_SIZE
		self.coordinates = []
		self.squares = []

		for i in range(0, BODY_SIZE):
			self.coordinates.append([50, 50])

		for x, y in self.coordinates:
			square = area.create_rectangle(x, y, x + SPACE_SIZE, y + SPACE_SIZE, fill=SNAKE, tag="snake")
			self.squares.append(square)


class Food:
	def __init__(self):
		x = random.randint(0, (WIDTH / SPACE_SIZE) - 5) * SPACE_SIZE
		y = random.randint(0, (HEIGHT / SPACE_SIZE) - 5) * SPACE_SIZE

		while [x, y] in snake.coordinates:
			x = random.randint(0, (WIDTH / SPACE_SIZE) - 5) * SPACE_SIZE
			y = random.randint(0, (HEIGHT / SPACE_SIZE) - 5) * SPACE_SIZE

		self.coordinates = [x, y]
		area.create_oval(x, y, x + SPACE_SIZE, y + SPACE_SIZE, fill=FOOD, tag="food")


class Bomb:
	def __init__(self):
		x = random.randint(0, (WIDTH / SPACE_SIZE) - 5) * SPACE_SIZE
		y = random.randint(0, (HEIGHT / SPACE_SIZE) - 5) * SPACE_SIZE

		while [x, y] in snake.coordinates:
			x = random.randint(0, (WIDTH / SPACE_SIZE) - 5) * SPACE_SIZE
			y = random.randint(0, (HEIGHT / SPACE_SIZE) - 5) * SPACE_SIZE

		self.coordinates = [x, y]

		area.create_oval(x, y, x + SPACE_SIZE, y + SPACE_SIZE, fill=BOMB, tag="bomb")


def next_turn(snake, food, bomb):

	x, y = snake.coordinates[0]

	if direction == "up":
		y -= SPACE_SIZE
	elif direction == "down":
		y += SPACE_SIZE
	elif direction == "left":
		x -= SPACE_SIZE
	elif direction == "right":
		x += SPACE_SIZE

	snake.coordinates.insert(0, (x, y))
	square = area.create_rectangle(x, y, x + SPACE_SIZE, y + SPACE_SIZE, fill=SNAKE)
	snake.squares.insert(0, square)

	if x == food.coordinates[0] and y == food.coordinates[1]:

		global score
		score += 10
		counter.config(text="Счёт: {}".format(score))
		area.delete("food")
		food = Food()
		area.delete("bomb")
		bomb = Bomb()

	else:
		del snake.coordinates[-1]
		area.delete(snake.squares[-1])
		del snake.squares[-1]

	if check_collisions(snake) or (x == bomb.coordinates[0] and y == bomb.coordinates[1]):
		counter.config(text="Счёт: {}".format(score))
		game_over()
	else:
		window.after(SPEED, next_turn, snake, food, bomb)


def change_direction(new_direction):

	global direction

	if new_direction == 'left':
		if direction != 'right':
			direction = new_direction
	elif new_direction == 'right':
		if direction != 'left':
			direction = new_direction
	elif new_direction == 'up':
		if direction != 'down':
			direction = new_direction
	elif new_direction == 'down':
		if direction != 'up':
			direction = new_direction


def check_collisions(snake):

	x, y = snake.coordinates[0]

	if x < 0 or x >= WIDTH:
		return True
	elif y < 0 or y >= HEIGHT:
		return True

	for body_part in snake.coordinates[1:]:
		if x == body_part[0] and y == body_part[1]:
			return True

	return False


def game_over():
	area.delete(ALL)
	area.create_text(area.winfo_width() / 2, area.winfo_height() / 2, font=('Segoe print', 60), text=f"Игра окончена со счётом {score}", fill="red", tag="gameover")


def go_back():
	subprocess.run(["menu.exe"])
	window.destroy()
	exit()


def restart_game():
	subprocess.run(["play.exe"])
	window.destroy()


if __name__ == '__main__':

	window = Tk()
	window.title("Змейка")
	window.geometry('1920x1080')
	window.configure(bg='#F0F8FF')
	window.attributes('-fullscreen', True)

	counter = Label(window, text="Счёт: {}".format(score), font=('Segoe print', 20), background='#F0F8FF')
	counter.pack(anchor='ne')

	area = Canvas(window, bg=BACKGROUND, height=HEIGHT, width=WIDTH)
	area.pack()

	go_btn = ttk.Button(window, text="<---", command=go_back)
	go_btn.place(x=0, y=0, anchor="nw", width=80, height=40)

	restart_btn = ttk.Button(window, text='↻', command=restart_game)
	restart_btn.place(x=130, y=20, anchor="c", width=80, height=40)

	window.bind('<Left>', lambda event: change_direction('left'))
	window.bind('<Right>', lambda event: change_direction('right'))
	window.bind('<Up>', lambda event: change_direction('up'))
	window.bind('<Down>', lambda event: change_direction('down'))

	snake = Snake()
	food = Food()
	bomb = Bomb()

	next_turn(snake, food, bomb)

	window.mainloop()