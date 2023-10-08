# Controle de qualidade

Três irmãs, Autenticada, Xerox e Fotocópia, dirigem uma empresa que faz réplicas das maiores obras de arte produzidas pela humanidade. Seus funcionários, porém, não são muito bem qualificados: vários deles têm dificuldade de criar cópias fiéis e, portanto, várias cópias acabam tendo cores que diferem muito das originais, precisando ser analisadas pelos irmãos. 

Recentemente, porém, o aumento de demanda por cópias tornou inviável que as irmãs checassem as obras manualmente. Isso as obrigou a investir num dos principais avanços tecnológicos dos últimos tempos: um sistema automatizado que consegue detectar tons de cores em quadros.

Com esse sistema, as irmãs conseguem comparar os tons predominantes nos quadros originais com os detectados nas cópias. O programa avalia a cópia da seguinte forma:

- Ao receber um arquivo contendo as obras originais e seus tons predominantes e um arquivo com as cópias e seus tons predominantes, o programa compara cada um dos tons observados na cópia com os tons observados na obra original. Para cada tom da cópia, devemos comparar com o respectivo tom observado na mesma posição da obra original, e assim pode ser dada uma das seguintes avaliações para cada tom, baseada na diferença calculada entre os tons:

  - Excelente: essa avaliação é dada quando a diferença de tom da cópia com pelo menos um dos tons originais da pintura é igual a zero;

  - Bom: essa avaliação é dada quando a diferença de tom da cópia com pelo menos um dos tons originais da pintura está entre 0 e 5, e esse tom não é uma cópia excelente de outro tom da original;

  - Aceitável: essa avaliação é dada quando a diferença de tom da cópia com pelo menos um dos tons originais da pintura está entre 5 e 20, e esse tom não é uma cópia excelente ou boa de outro tom da original;

  - Ruim: Essa avaliação é dada para todos os tons que não se encaixam nas situações acima;

- Vejamos um exemplo. Dada as seguintes obras: 

```ruby
original = '(0,255,13)//(238,255,0)//(171,0,154)'
copy = '(0,255,13)//(238,255,0)//(11,201,3)'
```

- Para avaliar cada um desses tons devemos compará-los com os respectivos tons presentes na obra original, ou seja, comparamos o primeiro tom `(0,255,13)` da original com o primeiro tom da cópia, `(0,255,13)`, o segundo tom da original, `(238,255,0)`, com o segundo tom da cópia, `(238,255,0)`, e o terceiro tom da original, `(171,0,154)`, com o terceiro tom da cópia, `(11,201,3)`. 

```ruby
(0,255,13) -> (0,255,13) = "excelente"
(238,255,0) -> (238,255,0) = "excelente"
(171,0,154) -> (11,201,3) = "ruim"
```

- Dessa análise, temos que tanto o primeiro quanto o segundo tom da cópia são classificados como **excelente**, pois a distância entre eles e os tons originais correspondentes é zero, enquanto o terceiro tom é classificado como **ruim**, pois a distância entre ele e o seu tom correspondente na pintura original é por volta de `99,5`, que é maior que vinte.

- Após checar todos os tons observados na cópia, o programa avalia a pintura em sua totalidade. Essa avaliação funciona da seguinte maneira:

  - Cópia excelente: essa avaliação é dada quando a maioria dos tons avaliados na cópia possuem avaliação "excelente";

  - Cópia boa: essa avaliação é dada quando a maioria dos tons avaliados na cópia possuem avaliação "bom";

  - Cópia aceitável: essa avaliação é dada quando a maioria dos tons avaliados na cópia possuem avaliação "aceitável";

  - Cópia ruim: essa avaliação é dada quando a maioria dos tons avaliados na cópia possuem avaliação "ruim";

- Considerando o exemplo acima, temos que dos três tons observados na cópia, dois possuem avaliação excelente e um ruim. Portanto, a cópia no geral recebe a avaliação de **cópia excelente**.

Neste desafio, você deve implementar o sistema descrito acima. Para isso, você irá receber dois arquivos: `original_tones_files` e `copied_tones_files`, que contém as obras originais e as cópias, respectivamente, além dos tons observados em cada uma delas. Além desses arquivos, você receberá a array `paintings` que contém os nomes das obras que devem ser comparadas.

Para calcular a diferença entre tons, você deve usar a gem `color_diff`, que já estará configurada no desafio. Você pode e deve consultar a documentação dessa gem [clicando aqui](https://www.rubydoc.info/gems/color_diff/0.1).
