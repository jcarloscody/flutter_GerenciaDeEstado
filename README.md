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

# ValueNotifier
> é uma class do flutter que funciona com reatividade, ou seja, toda vez que seu valor for alterado será mandado rebiudar o widget específico que ela tem.Em síntese, o SetState rebiuda a tela toda, agora com o changeNotifier apenas uma parte da tela é reconstruído..****

# Change Notifier
> segue uma obs importante, o provider usar o change notifier que é nativo do flutter, ou seja, o provider criou uma capsula por cima do change notifier e adicionou outras funcionalidades.
> O Change Notifier segue um padrão do design pattern chamado observable conceito este formado por uma classe observavel ou estruturas observavel e ouvintes e quando a estrutura for atualizada então os ouvintes serão atualizados.


# Bloc Pattern
> [**Review Stream**](https://github.com/jcarloscody/dart_Stream)
> é a utilização de stream para atualização do estado.
> 