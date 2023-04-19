# Month selector

Package que permite ao usuário selecionar um mês e um ano no calendário, sem a necessidade de inserir um dia específico. Ele retorna um Dialog que permite que o usuário selecione um ou mais meses.

## Features

Seleção de um ou vários meses em um calendário;
Multi-seleção de meses, permitindo a seleção de meses de diferentes anos;
Personalizável para atender às necessidades específicas de diferentes projetos;

### Screenshots

<p align="center">
    <img src="./screenshots/img1.png" width="250"/>
    <img src="./screenshots/img2.png" width="250"/>
</p>

## How to use

Adicione o widget ´MonthSelector()´ ao código.

### Example

```dart
            showDialog(
                context: context,
                builder: (context) {
                  return MonthSelector(
                    callback: (res) {
                      Navigator.pop(context);
                      if (res != null && res != []) {
                        setState(() {
                          month = res[0];
                        });
                      }
                    },
                  );
                });
```

### Lista de parâmetros

Estes são os principais parâmetros a serem configurados:

`callback`: define uma função a ser chamada quando o usuário selecionar uma ou mais datas.

`selectedDate`: define as datas que estarão selecionadas ao abrir o calendário.

`firstDate`: define a menor data selecionável.

`lastDate`: define a maior data selecionável.

`multiSelection`: permite a seleção de múltiplas datas

`months`: define as strings dos meses exibidos no calendário.



## Contributions:
[Darice Sousa](https://github.com/daricesousa)

<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->