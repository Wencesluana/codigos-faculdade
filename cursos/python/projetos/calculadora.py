num1 = int(input("Coloque um número:"))
num2 = int(input("Coloque outro número:"))
action = str(input("Escolha uma ação: Adição(A), Subtração(S), Multiplicação(M) ou Divisão(D): "))

print("O resultado é: ", end = "")

if action == "a":
    print(num1 + num2)
elif action == "s":
    print(num1 - num2)
elif action == "m":
    print(num1 * num2)
else:
    print(num1/num2)