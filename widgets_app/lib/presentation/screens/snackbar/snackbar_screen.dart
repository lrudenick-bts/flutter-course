import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SnackbarView();
  }
}

class _SnackbarView extends StatelessWidget {
  const _SnackbarView();

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackbar = SnackBar(
      content: const Text('Hello world'),
      action: SnackBarAction(label: 'OK', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context)
        .showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context, 
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('Are you sure?'),
          content: const Text('Culpa mollit pariatur cillum id eiusmod proident ex proident culpa nulla. Minim incididunt id reprehenderit velit tempor pariatur esse sunt ut. Aute incididunt fugiat quis nisi id reprehenderit velit incididunt amet sint irure fugiat.'),
          actions: [
            TextButton(
              onPressed: () => context.pop(), 
              child: const Text('Cancel')
            ),
            FilledButton(
              onPressed: () => context.pop(), 
              child: const Text('Accept')
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars & dialogs'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.remove_red_eye_outlined),
        label: const Text('Show snackbar'),
        onPressed: () => showCustomSnackbar(context)
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
                    const Text('Laborum eu irure laboris aute ex dolor pariatur culpa nulla fugiat. Veniam exercitation amet eiusmod ipsum quis amet mollit culpa sunt fugiat ut occaecat do. Et magna id exercitation tempor laborum proident sunt duis enim enim proident reprehenderit qui nulla. Cupidatat qui consectetur ipsum ad Lorem irure enim cillum incididunt proident ut dolor quis. Magna nulla qui ea sint elit est aliquip excepteur consequat ex elit Lorem.')
                  ]
                );
              }, 
              child: const Text('Used licenses')
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context), 
              child: const Text('Display dialog')
            )
          ],
        ),
      ),
    );
  }
}