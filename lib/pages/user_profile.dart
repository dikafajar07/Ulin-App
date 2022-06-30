import 'package:flutter/material.dart';
import 'package:mobile_ulin/pages/edit_profile.dart';
import 'package:mobile_ulin/providers/users.dart';
import 'package:provider/provider.dart';

class ProfileUser extends StatelessWidget {
  static const route = "/addProfile";

  final TextEditingController imageController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  ProfileUser({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void save(String image, String name, String email) {
      try {
        Provider.of<Users>(context, listen: false)
            .addUser(image, name, email)
            .then((value) => Navigator.pop(context));
      } catch (err) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Error Occured"),
              content: Text("Error : $err"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("OKAY"),
                ),
              ],
            );
          },
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("My Profile")),
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.save),
        //     onPressed: () => Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => EditProfilePage(),
        //       ),
        //     ),
        //   ),
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 24 + MediaQuery.of(context).padding.top,
                    bottom: 24,
                  ),
                  child: Column(
                    children: const [
                      CircleAvatar(
                        radius: 52,
                        backgroundImage: NetworkImage(
                            "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
                      ),
                      SizedBox(height: 12),
                    ],
                  ),
                ),
                TextField(
                  autocorrect: false,
                  autofocus: true,
                  controller: imageController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: "link image",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
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
                const SizedBox(height: 20),
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
              margin: const EdgeInsets.only(bottom: 30),
              child: ElevatedButton(
                onPressed: () => save(imageController.text, nameController.text,
                    emailController.text),
                child: const Text(
                  "Save",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
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
