import turtle

t = turtle.Turtle()
t.shapesize(1, 1)

s = turtle.Screen()
s.bgcolor('#03bb85')

t.fillcolor("pink")

t.penup()  
t.goto(0, -90)  
t.pendown()  

t.begin_fill()

t.left(50)
t.forward(240)
t.circle(90, 200)
t.left(221)
t.circle(90, 200)
t.forward(234)

t.end_fill()

t.penup() 
t.goto(0, 90)  
t.color("black") 
t.write("Eu lhe amo você", align="center", font=("Arial", 16, "normal"))  
t.pendown()


turtle.done()