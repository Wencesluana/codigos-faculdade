while True:
    numero_1 = input('Digite um número: ')
    numero_2 = input('Digite outro número: ')
    operador = input('Digite um operador(+/-*): ')

    numeros_validos = None
    num_1_float = 0
    num_2_float = 0

# print('digite um numero')
# sair = input(' quer sair? [s]im: ').lower().startswith('s')
# print(sair)

    try: 
        num_1_float = float(numero_1)
        num_2_float = float(numero_2)
        numeros_validos = True
    except:
        numeros_validos = None

    if numeros_validos is None:
        print('um ou ambos os números digitados são inválidos.')
        continue

    operadores_permitidos = '+-/*'

    if operador not in operadores_permitidos:
       print('operador inválido')
       continue
    
    if len(operador) > 1:
       print('digite apenas um operador.')
       continue

    print('realizando sua conta, confira o resultado abaixo:')
    if operador == '+':
       print(f'{num_1_float} + {num_2_float}=', num_1_float + num_2_float)
    elif operador == '-':
       print(f'{num_1_float} - {num_2_float}=', num_1_float - num_2_float)
    elif operador == '/':
       print(f'{num_1_float} / {num_2_float}=', num_1_float / num_2_float)
    elif operador == '*':
       print(f'{num_1_float} * {num_2_float}=', num_1_float * num_2_float)
    else:
       print('não deveria ter chegado aqui')

    sair = input('quer sair? [s]im: ').lower().startswith('s')

    if sair is True:
       break