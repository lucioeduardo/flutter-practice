import 'package:builder_pattern/custom_text_editing_controller.dart';
import 'package:flutter/material.dart';

import 'validation/validator_builder.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();

  final emailController = CustomTextEditingController(
    validator: ValidatorBuilder().required().email().build(),
  );
  final nameController = CustomTextEditingController(
    validator: ValidatorBuilder().required().build(),
  );

  @override
  void initState() {
    super.initState();
  }

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
                controller: emailController,
                decoration: const InputDecoration(
                  label: Text('Email'),
                ),
                validator: emailController.validator,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  label: Text('Nome'),
                ),
                validator: nameController.validator,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              ElevatedButton(
                onPressed: _isValidated ? () {} : null,
                child: const Text('Oi'),
              ),
            ],
          ),
        ),
        onChanged: () {
          setState(() {});
        },
      ),
    );
  }

  bool get _isValidated => emailController.isValid && nameController.isValid;
}
