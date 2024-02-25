import 'package:flutter/material.dart';
import 'task_management_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/image/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Row(
            children: [
              Icon(
                Icons.assignment,
                color: Colors.green,
              ),
              SizedBox(width: 8),
              Text(
                'NotePro',
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
            ],
          ),
          backgroundColor: Colors.yellow[50],
        ),
        backgroundColor: Colors.transparent,
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TaskManagementApp()),
              );
            },
            child: const Text('Make Your note'),
          ),
        ),
      ),
    );
  }
}
