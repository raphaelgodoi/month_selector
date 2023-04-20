# Month selector

[![Pub Package](https://img.shields.io/badge/pub-v1.0.0-blue)](https://pub.dev/packages/calendar_date_picker2)
[![Pub Package](https://img.shields.io/badge/flutter-%3E%3D1.17.0-green)](https://flutter.dev/)


A package that allows the user to select a month and a year on a calendar, without the need to specify a specific day. It returns a Dialog that allows the user to select one or more months.

## Features

- Selection of one or several months on a calendar;
- Multi-selection of months, allowing the selection of months from different years;
- Customizable to meet specific needs of different projects;

### Screenshots

<p align="center">
    <img src="https://raw.githubusercontent.com/daricesousa/month_selector/main/screenshots/img1.png" width="250"/>
    <img src="https://raw.githubusercontent.com/daricesousa/month_selector/main/screenshots/img2.png" width="250"/>
</p>

## How to use

Add the following line to `pubspec.yaml`:

```yaml
dependencies:
  month_selector: ^1.0.0
```
To use the Month Selector, import the `month_selector/month_selector.dart` package and add the `MonthSelector` widget to your code. Make sure to check out [example](https://github.com/daricesousa/month_selector/tree/main/example) for more details.



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

`selectedDate`: defines the dates that will be selected when the calendar is opened.

`firstDate`: defines the earliest selectable date.

`lastDate`: defines the latest selectable date.

`multiSelection`: allows the selection of multiple dates

`months`: defines the month strings displayed on the calendar.



## Contributions:
[Darice Sousa](https://github.com/daricesousa)
