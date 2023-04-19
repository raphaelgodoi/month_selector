# Month selector

A package that allows the user to select a month and a year on a calendar, without the need to specify a specific day. It returns a Dialog that allows the user to select one or more months.

## Features

Selection of one or several months on a calendar;
Multi-selection of months, allowing the selection of months from different years;
Customizable to meet specific needs of different projects;

### Screenshots

<p align="center">
    <img src="./screenshots/img1.png" width="250"/>
    <img src="./screenshots/img2.png" width="250"/>
</p>

## How to use

Add the ``MonthSelector` widget to your code.

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

### Parameters list

These are the main parameters to be configured:

`callback`: defines a function to be called when the user selects one or more dates.

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