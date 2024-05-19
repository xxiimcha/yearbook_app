import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';

class NewAlumnus extends StatefulWidget {
  const NewAlumnus({super.key});

  @override
  State<NewAlumnus> createState() => _NewAlumnusState();
}

class _NewAlumnusState extends State<NewAlumnus> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _courseController = TextEditingController();
  final TextEditingController _mottoController = TextEditingController();
  final TextEditingController _batchController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _courseController.dispose();
    _mottoController.dispose();
    _batchController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      String name = _nameController.text;
      String course = _courseController.text;
      String motto = _mottoController.text;
      String batch = _batchController.text;

      // Database configuration
      final conn = await MySqlConnection.connect(ConnectionSettings(
        host: 'srv1402.hstgr.io',
        port: 3306,
        user: 'u646358860_yearbook',
        db: 'u646358860_yearbook',
        password: '8T^vuUNq0xJ',
      ));

      // Insert data into database
      var result = await conn.query(
          'INSERT INTO students (name, course, motto, batch) VALUES (?, ?, ?, ?)',
          [name, course, motto, batch]);

      // Close the connection
      await conn.close();

      // Show a dialog to confirm submission
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('New Alumnus'),
            content: Text('Data saved successfully!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop(); // Go back to the previous screen
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Alumnus'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _courseController,
                decoration: InputDecoration(labelText: 'Course'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a course';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _mottoController,
                decoration: InputDecoration(labelText: 'Motto'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a motto';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _batchController,
                decoration: InputDecoration(labelText: 'Batch'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a batch';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
