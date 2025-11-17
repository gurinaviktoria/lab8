import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/home_viewmodel.dart';
import '../theme_provider.dart';
import 'add_person_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();
    final themeProvider = context.watch<ThemeProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resume Builder'),
        actions: [
          IconButton(
            icon: Icon(themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode),
            onPressed: () => themeProvider.toggleTheme(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => const AddPersonPage())),
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: vm.people.length,
        itemBuilder: (_, index) {
          final person = vm.people[index];
          return ListTile(
            title: Text(person.name),
            subtitle: Text(person.about),
          );
        },
      ),
    );
  }
}
