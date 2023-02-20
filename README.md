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
  dialog_kh: ^0.0.1
```
2. Import the package and use it in your Flutter App.
```dart
import 'package:dialog_kh/dialog_kh.dart';
```

## Example
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