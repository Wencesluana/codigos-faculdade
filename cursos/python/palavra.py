import os

palavra_secreta = 'perfume'
letras_acertadas = ''
numero_tentativas = 0

while True:
    letra_digitada = input('digite uma letra: ')

    if len(letra_digitada) > 1:
        print('uma letra por vez, apressadx')
        continue

    if letra_digitada in palavra_secreta:
        letras_acertadas += letra_digitada

    palavra_formada = ''
    for letra_secreta in palavra_secreta:
        if letra_secreta in letras_acertadas:
            print(letra_secreta)
        else: 
            palavra_formada += '*'

    print('palavra_formada: ', palavra_formada)

    if palavra_formada == palavra_secreta: 
        os.system('clear')
        print('voce ganhou \0/ parabens!!')
        print('a palavra era, ', palavra_secreta)
        print('Tentativas: ', numero_tentativas)
        letras_acertadas = ''
        numero_tentativas = 0