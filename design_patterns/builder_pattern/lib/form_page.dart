import 'package:flutter/material.dart';

import 'validation/validator_builder.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário Simples'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Email'),
                ),
                validator: ValidatorBuilder().required().email().build(),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Nome'),
                ),
                validator: ValidatorBuilder().required().build(),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
