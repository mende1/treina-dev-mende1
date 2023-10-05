# Máquina saltitante

Neste desafio você deve implementar o código de uma máquina que se move em
saltos por um tabuleiro. Seus movimentos são definidos por uma série de
instruções que indicam a direção e o número de casas que a máquina deve pular.

```
B 2
D 1
C 1
E 2
```

Cada letra indica uma direção:

- C para cima;
- B para baixo;
- E para a esquerda;
- D para a direita;

A partir de sua posição inicial, a cada movimento executado pela máquina, ela
deixa no local por onde passa uma marca 'X' no tabuleiro. Depois de seguir cada
passo da sequência de instruções, o código deve retornar o mapa mínimo
desenhado como um array. Considerando a sequência de movimentos do exemplo
acima, o mapa desenhado ao final seria:

```
[['O','X','O'],
 ['X','O','X'],
 ['O','X','X']]
```

Neste caso, a posição inicial da máquina foi a coordenada [0,1] (linha 0,
coluna 1) e o mapa desenhado tem dimensões 3x3. Observe que em cada teste deste desafio,
a posição inicial e as dimensões do mapa final podem variar e devem ser inferidos
com base nos movimentos executados.

