import 'package:agenda_de_contatos/model/contact.dart';
import 'package:agenda_de_contatos/repository/contact_repository.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class EditContact extends StatefulWidget {
  Contact contact;
  EditContact({
    super.key,
    required this.contact,
  });

  @override
  State<EditContact> createState() => _EditContactState();
}

class _EditContactState extends State<EditContact> {
  var _isObscure = true;
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController phoneController;
  late final TextEditingController cellPhoneController;

  void initState() {
    nameController = TextEditingController(text: widget.contact.name);
    emailController = TextEditingController(text: widget.contact.email);
    passwordController = TextEditingController(text: widget.contact.password);

    phoneController = MaskedTextController(
        mask: "(00) 0000-0000", text: widget.contact.phone);
    cellPhoneController = MaskedTextController(
        mask: "(00) 00000-0000", text: widget.contact.cellPhone);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar ${widget.contact.name}"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            final contact = Contact(
              id: widget.contact.id,
                name: nameController.text,
                phone: phoneController.text,
                photo: "assets/images/Thomas.jpg",
                cellPhone: cellPhoneController.text,
                email: emailController.text,
                password: passwordController.text);
            final result = await ContactRepository.updateContact(contact);
            String message;
            if (result != 0) {
              message = "Contato salvo com sucesso!!!";
            } else {
              message = "Lamento, não foi possível salvar o contato";
            }
            final snack = SnackBar(content: Text(message));
            ScaffoldMessenger.of(context).showSnackBar(snack);
          }
        },
        child: Icon(
          Icons.save,
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                validator: (text) => (text == null || text.length < 3)
                    ? "O nome do contato é inválido"
                    : null,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  label: Text("Nome do contato"),
                  icon: Icon(Icons.account_box),
                ),
              ),
              TextFormField(
                controller: emailController,
                validator: (text) =>
                    (text == null || !EmailValidator.validate(text)
                        ? "O email digitado é inválido"
                        : null),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  label: Text("Email"),
                  icon: Icon(Icons.email),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      validator: (text) => (text == null || text.length != 14)
                          ? "O número de telefone é inválido"
                          : null,
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        label: Text("Telefone"),
                        icon: Icon(Icons.call),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      validator: (text) => (text == null || text.length != 15)
                          ? "O número de celular é inválido"
                          : null,
                      controller: cellPhoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        label: Text("Celular"),
                        icon: Icon(Icons.call),
                      ),
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: passwordController,
                validator: (text) => (text == null || text.length < 8)
                    ? "A senha deve conter ao menos 8 caracteres"
                    : null,
                decoration: InputDecoration(
                  label: Text("Senha de acesso"),
                  icon: Icon(Icons.password),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    icon: Icon(
                      (_isObscure) ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                ),
                obscureText: _isObscure,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
