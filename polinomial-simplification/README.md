# Redução de polinômios

Na escolinha do professor Otávio, a classe está aprendendo sobre redução de polinômios, que é o processo onde termos semelhantes de um polinômio são reunidos. Chamamos de termos semelhantes os monômios que possuem a mesma parte literal. Podemos entender melhor a partir do exemplo:

Considere o polinômio `4x+12-3x`. 
Esse polinômio é formado por três monômios `4x`, `+12` e `-3x`. Cada um desses monômios pode possuir uma parte literal e um coeficiente, com o coeficiente sendo o número que acompanha a parte literal. 

No monômio `4x`, por exemplo, temos que `4` é o coeficiente e `x` é a parte literal. No monômio `-3x`, temos que `-3` é o coeficiente e `x` é a parte literal. No monômio `+12`, temos que `+12` é o coeficiente, mas esse monômio não tem uma parte literal. Também temos os casos onde um monômio não tem coeficiente explícito, como o monômio `xyz`, por exemplo. Neste monômio, por mais que não esteja explícito, o coeficiente é `1`.

Agora que entendemos os monômios, podemos voltar a falar sobre a redução de um polinômio. Como dito anteriormente, a redução é o processo de reunir monômios semelhantes, ou seja, que possuem a mesma parte literal. Se voltarmos ao nosso exemplo anterior, no polinômio `4x+12-3x` temos que `4x` e `-3x` são termos semelhantes e, portanto, podem ser agrupados. Esse agrupamento é feito a partir da soma dos coeficientes desses monômios e o resultado dessa soma acompanha a parte literal deles.
Dessa forma, reunir `4x` e `-3x` resultaria no monômio `x`, pois `4` + `-3` é igual a 1, e a parte literal é conservada. Daí, temos que a redução do polinômio `4x+12-3x` resulta no polinômio `x+12`. Repare que, como não há nenhum termo semelhante ao monômio `+12`, ele é conservado.

Nesse desafio você deve implementar um código que recebe um polinômio e deve retornar o polinômio reduzido. Note que:

- Quando o primeiro termo de um polinômio tem um coeficiente positivo, o sinal `+` é omitido. Isso não acontece quando o coeficiente do primeiro monômio é negativo.

- Para exibir os polinômios reduzidos, apresentamos primeiro todos os monômios que possuem parte literal, sendo que esses monômios devem ser apresentados em ordem alfabética. Por exemplo, `4a+12bd-15` está apresentado da forma correta, enquanto que `7jl+5ecb-14-3a` não está. A exibição correta desse último polinômio seria `-3a+5bce+7jl-14`.

- Repare que, em relação às partes literais, a ordem em que as letras aparecem é indiferente. Dessa forma, os monômios `3abc` e `3bca` são iguais. Ao exibir os resultados, espera-se que a parte literal desses monômios seja exibida em ordem alfabética.


