import turtle
import time
import random

delay = 0.1
score = 0
high_score = 0
segments = []

wn = turtle.Screen()
wn.title("Jogo da cobrinha")
wn.bgcolor("green")
wn.setup(width=780, height=780)
wn.tracer(0)

head = turtle.Turtle()
head.speed(0)
head.shape("square")
head.color("green")
head.penup()
head.goto(0,0)
head.direction = "stop"

food = turtle.Turtle()
food.speed(0)
food.shape("circle")
food.color("red")
food.penup()
food.goto(0,100)

pen = turtle.Turtle()
pen.speed(0)
pen.shape("square")
pen.color("yellow")
pen.penup()
pen.hideturtle()
pen.goto(0, 260)
pen.write("Pontuação: 0 Pontuação mais alta: 0", align="center", font=("Arial", 24, "bold"))

# Funções de controle da direção
def go_up():
    if head.direction != "down":
        head.direction = "up"

def go_down():
    if head.direction != "up":
        head.direction = "down"
    
def go_left():
    if head.direction != "right":
        head.direction = "left"
    
def go_right():
    if head.direction != "left":
        head.direction = "right"

def move():
    if head.direction == "up":
        y = head.ycor()
        head.sety(y + 20)

    if head.direction == "down":
        y = head.ycor()
        head.sety(y - 20)

    if head.direction == "left":
        x = head.xcor()
        head.setx(x - 20)

    if head.direction == "right":
        x = head.xcor()
        head.setx(x + 20)

# Função para reiniciar o jogo
def reset_game():
    global score, delay
    time.sleep(1)
    head.goto(0, 0)
    head.direction = "stop"
    
    for segment in segments:
        segment.goto(1000, 1000)
    
    segments.clear()

    score = 0
    delay = 0.1

    pen.clear()
    pen.write("Pontuação: {} Maior pontuação: {}".format(score, high_score), align="center", font=("Arial", 24, "bold"))

# Controle de teclas
wn.listen()
wn.onkeypress(go_up, "w")
wn.onkeypress(go_down, "s")
wn.onkeypress(go_left, "a")
wn.onkeypress(go_right, "d")

while True:
    wn.update()

    # Verifica colisão com a borda
    if head.xcor() > 390 or head.xcor() < -390 or head.ycor() > 390 or head.ycor() < -390:
        reset_game()

    # Verifica se a cabeça colidiu com a comida
    if head.distance(food) < 20:
        x = random.randint(-290, 290)
        y = random.randint(-290, 290)
        food.goto(x, y)

        new_segment = turtle.Turtle()
        new_segment.speed(0)
        new_segment.shape("square")
        new_segment.color("grey")
        new_segment.penup()
        segments.append(new_segment)

        delay -= 0.01  # Diminui o delay para aumentar a velocidade
        if delay < 0.05:
            delay = 0.05  # Define um limite mínimo para a velocidade

        score += 13

        if score > high_score:
            high_score = score

        pen.clear()
        pen.write("Pontuação: {} Maior Pontuação: {}".format(score, high_score), align="center", font=("Arial", 24, "bold"))

    # Mover os segmentos do corpo da cobra
    for index in range(len(segments)-1, 0, -1):
        x = segments[index-1].xcor()
        y = segments[index-1].ycor()
        segments[index].goto(x, y)

    if len(segments) > 0:
        x = head.xcor()
        y = head.ycor()
        segments[0].goto(x, y)

    move()

    # Verifica colisão com o corpo
    for segment in segments:
        if segment.distance(head) < 20:
            reset_game()

    time.sleep(delay)

wn.mainloop()
