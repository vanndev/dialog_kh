import 'package:dialog_kh/dialog_kh.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo Dialog Kh',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      home: const MyHomePage(),
    );
  }
}

final longMessage = """
Balík 007I00123225*001001 je ve stavu:

Předáno na VM

Ovšem aby bylo možné provést požadovanou akci, musí být balík v jednom z těchto stavů: 
	- BOX - plný
	- BOX - mimo provoz
	- BOX - nadrozměrná zásilka
	- Chybně směrováno / vyskladněno
	- Příjem balíku z LH
	- První příjem - BEZ výrobního čísla
	- První příjem - S výrobním číslem
	- Doklady převzaty
	- Doručeno
	- Inventura
	- K likvidaci
	- K předání jinému kurýrovi
	- Kontrola naložení
	- Likvidace
	- Převzato do rozvozu
	- Na skladě
	- Načtení poškozeného balíku
	- Nedoručeno
	- Neexistuje
	- Nekompletní zásilka
	- Nepřevzato do rozvozu
	- Přijato na VM - nová zásilka
	- Nucené uvolnění do rozvozu
	- Obecné načtení
	- Pozdní příjezd kamionu
	- Předání na depo
	- Předání osobního odběru
	- Přesun ve skladu
	- Převzetí cenné zásilky
	- Převzetí od jiného kurýra
	- Pick-up / Svoz
	- Příjem z LH DEPA ITS
	- Příjem na sklad
	- Příjem nedoruč. z rozvozu
	- Příje
""";

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController txt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dialog Kh"),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            const SizedBox(height: 10),

            /// Show alert dialog
            SizedBox(
              height: 50,
              width: 280,
              child: ElevatedButton(
                child: const Text('Show alert dialog'),
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
            const SizedBox(height: 10),

            /// Show alert dialog with long message
            SizedBox(
              height: 50,
              width: 280,
              child: ElevatedButton(
                child: const Text('Show alert dialog with long message'),
                onPressed: () {
                  DialogKh.alertDialogKh(
                    context: context,
                    isAutoClosed: false, // default: true
                    disableBtn: false, // disable button is default os you need set disable to false, If you want to use button
                    header: Icon(Icons.check_circle, color: Theme.of(context).primaryColor, size: 100),
                    title: "Long message",
                    titleColor: Theme.of(context).primaryColor,
                    description: longMessage,
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
            const SizedBox(height: 10),

            /// Show custom dialog
            SizedBox(
              height: 50,
              width: 280,
              child: ElevatedButton(
                child: const Text('Show custom dialog'),
                onPressed: () {
                  DialogKh.alertDialogKh(
                    context: context,
                    isAutoClosed: false, // default: true
                    disableBtn: false, // disable button is default os you need set disable to false, If you want to use button
                    title: "Congratulations",
                    titleColor: Theme.of(context).primaryColor,
                    description: "Congratulation your work is good",
                    body: SizedBox(
                      height: 350,
                      child: ListView(
                        children: List.generate(20, (index) => ListTile(title: Text("Item $index"))),
                      ),
                    ),
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
            const SizedBox(height: 10),

            /// Show alert dialog with text field input submit form
            SizedBox(
              height: 50,
              width: 280,
              child: ElevatedButton(
                child: const Text('Show submit form'),
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
            const SizedBox(height: 10),

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
            const SizedBox(height: 10),

            /// Show bottom sheet
            SizedBox(
              height: 50,
              width: 280,
              child: ElevatedButton(
                child: const Text('Bottom sheet'),
                onPressed: () {
                  DialogKh.bottomSheetKh(
                      context: context,
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
            const SizedBox(height: 10),

            /// Show custom bottom sheet
            SizedBox(
              height: 50,
              width: 280,
              child: ElevatedButton(
                child: const Text('Custom bottom sheet'),
                onPressed: () {
                  DialogKh.bottomSheetKh(
                    context: context,
                    heightFactor: 0.8,
                    body: SizedBox(
                      height: 350,
                      child: ListView(
                        children: List.generate(20, (index) => ListTile(title: Text("Item $index"))),
                      ),
                    ),
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
          ],
        ),
      ),
    );
  }
}
