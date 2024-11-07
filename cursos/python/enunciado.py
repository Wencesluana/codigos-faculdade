#entrada = input('Digite um numero: ')
#if entrada.isdigit():
#entrada_int = int(entrada)
#par_impar = entrada_int % 2 == 0
#par_impar_texto = 'impar'
#print(f'o numero {entrada_int} é {par_impar_texto}')
#else:
#print('Voce nao digitou um nuemro inteiro.')   

try:
    entrada_int = float(entrada)
    par_impar = entrada_int % 2 == 0
    par_impar_texto = 'impar'

    if par_impar:
        par_impar_texto = 'par'

    print(f'o numero {entrada_int}né {par_impar_texto}')
except:
    print('vocr nao digitou um numero inteiro')


entrada = input('digite a hora em numeros inteiros: ')

try:
    hora = int(entrada)
    if hora >= 0 and hora <= 11:
        print('bom dia')
    elif hora >= 12 and hora <= 17:
        print('boa tarde')
    elif hora >= 18 and hora <=23:
        print('boa noite')
    else:
        print('nao conheço essa hora')
except:
    print('por favvor, digite números inteiros')

nome = input('digite seu nome: ')
tamanho_nome = len(nome)

if tamanho_nome > 1:
    if tamanho_nome <= 4:
        print('seu nome é curto')
    elif tamanho_nome >= 5 and tamanho_nome <= 6:
        print('seu nome é normal')
    else:
        print('seu nome é muito grande')
else: 
    print('por favor, digite pelo menos uma letra')