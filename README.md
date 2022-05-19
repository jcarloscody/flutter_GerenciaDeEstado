# GERÊNCIA DE ESTADO

Aqui trataremos as gerências de estado padrões do flutter sem usar os packages externos. Em síntese, veremos setState, ChangeNotifier,ValueNotifier, Streams(Bloc Pattern), mas não usaremos o bloc provider. Desenvolvi estes conceitos aplicando num projeto de imc.

## Dependências
> - [`syncfusion_flutter_gauges:`]() auxília na criação de gráficos.
> - [`currency_text_input_formatter`]() auxília na formatação como por exemplo a máscara.

# SetState
> apesar de setState resolver muitos problemas, porém ele tem vários problemas:
> - rebiuda a tela toda
> - o grande problema, fazer um widget filho atualizar o pai
> - complexidade em usar os componentes de outras telas.