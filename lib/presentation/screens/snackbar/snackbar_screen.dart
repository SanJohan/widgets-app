import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {

  static const String name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context){

    ScaffoldMessenger.of(context).clearSnackBars(); // para evitar que se muestren varios snackbars si llamo la funcion repetidamente
    
    final snackbar = SnackBar(
      content: const Text('hola mundo'),
      action: SnackBarAction(label: 'OK!', onPressed: (){}),
      duration: const Duration( seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context){

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Estas seguro?'),
        content: const Text('Laboris id deserunt velit esse eu eiusmod cupidatat dolor ullamco proident consequat sunt dolore. Ullamco ipsum Lorem nostrud reprehenderit officia est nostrud dolore mollit ut. Tempor proident ullamco proident sint esse. Deserunt veniam quis aliquip proident nisi officia et est commodo eiusmod laboris. Minim voluptate ea labore ad eu ex amet sint incididunt deserunt ipsum.'),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            }, 
            child: const Text('Cancelar')
          ),

          FilledButton(
            onPressed: () {
              context.pop();
            }, 
            child: const Text('Aceptar')
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Snackbars y dialogos'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Quis voluptate reprehenderit eiusmod ex ut nostrud. Commodo excepteur nulla amet magna. Cillum excepteur eu tempor et ea.')
                  ]
                );
              },
              child: const Text('Licencias usadas'),
            ),

            FilledButton.tonal(
              onPressed: () {
                openDialog(context);
              },
              child: const Text('Dialogos'),
            )

          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}