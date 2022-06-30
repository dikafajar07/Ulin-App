import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/users.dart';

class EditProfilePage extends StatelessWidget {
  static const route = "/editProfile";

  @override
  Widget build(BuildContext context) {
    String userId = ModalRoute.of(context).settings.arguments as String;

    var prov = Provider.of<Users>(context, listen: false);

    var selectedUser = prov.selectById(userId);

    final TextEditingController imageController =
        TextEditingController(text: selectedUser.image);
    final TextEditingController nameController =
        TextEditingController(text: selectedUser.name);
    final TextEditingController emailController =
        TextEditingController(text: selectedUser.email);

    void edit(String image, String name, String email) {
      prov.editUser(userId, image, name, email);
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit User"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => edit(imageController.text, nameController.text,
                emailController.text),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                TextField(
                  autocorrect: false,
                  autofocus: true,
                  controller: imageController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: "Link Image",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                TextField(
                  autocorrect: false,
                  autofocus: true,
                  controller: nameController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: "Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  autocorrect: false,
                  controller: emailController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    labelText: "email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 30),
              child: ElevatedButton(
                onPressed: () => edit(imageController.text, nameController.text,
                    emailController.text),
                child: Text(
                  "Edit",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
