import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() {
    return _ContactState();
  }
}

class _ContactState extends State<Contact> {
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  sendEmail(context) async {
    final Email email = Email(
      body:
          "Phone number : ${_phoneNumberController.text}\nName : ${_nameController.text}\nEmail : ${_emailController.text}\nMessage : ${_messageController.text}",
      subject: _subjectController.text,
      recipients: ['billalkhellaf@gmail.com'],
      cc: [],
      bcc: [],
      attachmentPaths: [],
      isHTML: false,
    );
    await FlutterEmailSender.send(email);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        duration: Duration(seconds: 3),
        content: Center(
            child: Text(
                "Your message has been transmitted to our client service", textAlign: TextAlign.center,)),
      ),
    );
    clearText();
    dispose();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void clearText(){
    _messageController.clear();
    _subjectController.clear();
    _phoneNumberController.clear();
    _emailController.clear();
    _nameController.clear();
  }

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
                onPressed: () {
                  setState(() {
                    sendEmail(context);

                  });
                },
                child: const Text("submit"),
              ),
            ],
          ),
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          title: const Text("Contact"),
        ),
      ),
    );
  }
}
