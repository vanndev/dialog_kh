# Dialog kh library
A Flutter library to help you create animated, simple, style, custom dialogs in your app.
Dialog kh is opensource library developed by <a href="https://kimsoer.site/">Voern Kimsoer</a> with <a href="https://www.youtube.com/channel/UCeOdLQeAytUW38kgLUbZ2BA">Vann Dev</a>


## Features

- Show alert dialog.
- Show bottom Sheet.
- Alert dialog has option auto close or not.
- Support theme mode : Dark mode and light mode.
- Support custom: color, style, button, icon, widget.
- Custom Text field to input submit.
- Header can customize widget
- Bottom can customize widget

## Installation

1. Add the latest version of package to your pubspec.yaml (and run`dart pub get`):
```yaml
dependencies:
  dialog_kh: ^0.0.2
```
2. Import the package and use it in your Flutter App.
```dart
import 'package:dialog_kh/dialog_kh.dart';
```

## Example 01
For example, to create dialog kh, you could use the following code:

```dart
   /// Show alert message
            SizedBox(
              width: 280,
              height: 50,
              child: ElevatedButton(
                child: const Text('Show alert message'),
                onPressed: () {
                  DialogKh.alertDialogKh(
                    context: context,
                    isAutoClosed: true, // default: true
                    seconds: 2,
                    header: const Icon(Icons.check_circle, color: Colors.green, size: 100),
                    title: "Congratulations",
                    description: "Congratulation your work is good",
                    radius: 30,
                  );
                },
              ),
            ),
```
<img src="https://github.com/chhumsovann/dialog_kh/raw/main/img/alert_message.jpg"  width="200"/>

## Example 02
For example, to create dialog kh, you could use the following code:

```dart
   /// Show alert message
            SizedBox(
              width: 280,
              height: 50,
              child: ElevatedButton(
                child: const Text('Show alert message'),
                onPressed: () {
                      DialogKh.alertDialogKh(
                      context: context,
                      isAutoClosed: false, // default: true
                      disableBtn: false, // disable button is default os you need set disable to false, If you want to use button
                      header: Icon(Icons.check_circle, color: Theme.of(context).primaryColor, size: 100),
                      title: "Congratulations",
                      titleColor: Theme.of(context).primaryColor,
                      description: "Congratulation your work is good",
                      onConfirm: () {
                      /// Do something...
                      Navigator.pop(context);
                      },
                      onCancel: () {
                      /// Do something...
                      Navigator.pop(context);
                      },
                  );
                },
              ),
            ),
```
<img src="https://github.com/chhumsovann/dialog_kh/raw/main/img/alert_dialog_01.jpg"  width="200"/>

## Example 03
For example, to create dialog kh, you could use the following code:

```dart
  TextEditingController txt = TextEditingController();

/// Show alert dialog with text field input submit form
            SizedBox(
              width: 280,
              height: 50,
              child: ElevatedButton(
                child: const Text('Show alert message'),
                onPressed: () {
                      txt.clear();
                      DialogKh.alertDialogKh(
                      context: context,
                      header: Icon(Icons.check_circle, color: Theme.of(context).primaryColor, size: 100),
                      title: "Success",
                      titleColor: Theme.of(context).primaryColor,
                      description: "Do you have any reason?",
                      isTextField: true, // default: false
                      isAutoClosed: false, // default: true
                      txtEditController: txt,
                      onSubmit: () {
                      /// Do something...
                      print("Submit: ${txt.text}");
                      Navigator.pop(context);
                      },
                  );
                },
              ),
            ),
```

<img src="https://github.com/chhumsovann/dialog_kh/raw/main/img/alert_dialog_02.jpg"  width="200"/>

## Example 04
For example, to create dialog kh, you could use the following code:

```dart
 /// Show bottom sheet
SizedBox(
    height: 50,
    width: 280,
    child: ElevatedButton(
        child: const Text('Bottom sheet message'),
        onPressed: () {
            DialogKh.messageKh(
                context: context,
                radius: 15,
                title: "Message",
                description: "Congratulation your work is good",
                leading: const Icon(Icons.email, size: 40),
            );
        },
    ),
),
```

<img src="https://github.com/chhumsovann/dialog_kh/raw/main/img/show_message.jpg"  width="200"/>

## Example 05
For example, to create dialog kh, you could use the following code:

```dart
 /// Show bottom sheet
SizedBox(
    height: 50,
    width: 280,
    child: ElevatedButton(
        child: const Text('Bottom sheet'),
        onPressed: () {
            DialogKh.bottomSheetKh(
                context: context,
                height: 500,
                header: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Icon(Icons.check_circle, color: Theme.of(context).primaryColor, size: 100),
                ),
                onConfirm: () {
                /// Do something...
                Navigator.pop(context);
                },
                onCancel: () {
                /// Do something...
                Navigator.pop(context);
            });
        },
    ),
),
```

<img src="https://github.com/chhumsovann/dialog_kh/raw/main/img/bottom_sheet.jpg"  width="200"/>