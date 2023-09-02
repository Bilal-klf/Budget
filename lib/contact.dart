import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.name,
                    controller: _nameController,
                    maxLength: 50,
                    decoration: const InputDecoration(
                      label: Text("Name"),
                    ),
                  ),
                ),
              ]),
              const SizedBox(height: 5),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    maxLength: 50,
                    decoration: const InputDecoration(
                      label: Text("Email"),
                    ),
                  ),
                ),
              ]),
              const SizedBox(height: 5),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: _phoneNumberController,
                    maxLength: 50,
                    decoration: const InputDecoration(
                      label: Text("Phone"),
                    ),
                  ),
                ),
              ]),
              const SizedBox(height: 5),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Expanded(
                  child: TextField(
                    controller: _subjectController,
                    maxLength: 50,
                    decoration: const InputDecoration(
                      label: Text("Subject"),
                    ),
                  ),
                ),
              ]),
              const SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      maxLength: 50,
                      decoration: const InputDecoration(
                        label: Text("Your message"),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              ElevatedButton(
                onPressed: () {},
                child: const Text("submit"),
              ),
            ],
          ),
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          title: Text("Contact"),
        ),
      ),
    );
  }
}
