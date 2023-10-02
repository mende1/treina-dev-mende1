# Jogos da Fome

Você recebeu a designação de nova pessoa controladora de pontuação da capital, responsável por calcular os pontos e elaborar estatísticas detalhadas sobre o desempenho de participantes nas arenas mortais do jogo virtual dos Jogos da Fome.

Seu desafio é processar o log de eventos para calcular o score final de cada participante e fornecer um sumário detalhado do uso de cada arma e das eliminações causadas pelo cenário. Para isso, você irá receber a hash `participants`, que contém os nomes dos participantes e suas respectivas armas disponíveis e pontos associados; e também a string `log`, detalhando os eventos da partida, incluindo eliminações padrões e eliminações por adversidades do cenário.

### Métodos

A classe `HungerGames` deve ter dois métodos principais:

- `score`: este método deve retornar um hash com os nomes dos participantes como chaves e sua pontuação final como valores. A pontuação é calculada com base nas eliminações realizadas por cada participante, com pontos sendo concedidos conforme a arma utilizada. Mais detalhes sobre as regras de contagem de pontos podem ser vistos abaixo.

- `weapons_summary`: este método deve retornar um hash com um resumo detalhado das armas utilizadas e das eliminações causadas pelo cenário. Cada arma ou adversidade do cenário deve ser uma chave no hash, com o número de eliminações como valor.

### Regras para Contagem de Pontos

- Cada eliminação confere a quem eliminou um número de pontos baseado na arma utilizada.
- Participante eliminado por outro perde 1 ponto.
- Participante eliminado por adversidade do cenário perde 3 pontos.

## Exemplo

A entrada do método `score` com:

```ruby
    participants = { catnip: ['ArcoeFlecha:5'], beedle: ['Besouros:10'] }
    log = <<~PARTIDA
      00:00 - Inicio da partida;
      00:15 - catnip elimina beedle com ArcoeFlecha;
      00:40 - catnip elimina beedle com ArcoeFlecha;
      00:55 - beedle elimina catnip com Besouros;
      01:15 - catnip elimina beedle com ArcoeFlecha;
      01:30 - Fim da partida
    PARTIDA
```

deve retornar `{ catnip: 14, beedle: 7 }`, pois, catnip eliminou beedle três vezes com o `ArcoeFlecha`, que vale 5 pontos por eliminação. Já beedle eliminou catnip uma vez com `Besouros`, o que concede 10 pontos. Como beedle foi eliminado três vezes, ele perde três pontos da sua pontuação total; da mesma forma, catnip perde um.

A entrada do método `weapons_summary` com:

```ruby
    participants = { catnip: ['ArcoeFlecha:5'], beedle: ['Besouros:10'] }
    log = <<~PARTIDA
      00:00 - Inicio da partida;
      00:15 - catnip elimina beedle com ArcoeFlecha;
      00:40 - catnip elimina beedle com ArcoeFlecha;
      00:55 - beedle elimina catnip com Besouros;
      01:15 - catnip elimina beedle com ArcoeFlecha;
      01:30 - Fim da partida
    PARTIDA
```

deve retornar `{ ArcoeFlecha: 3, Besouros: 1 }`, pois, foram feitas três eliminações com o `ArcoeFlecha` e apenas uma com `Besouros`.

## Informações adicionais

- Você pode consultar a documentação da classe `Hash` [clicando aqui](https://ruby-doc.org/core-3.0.0/Hash.html)
