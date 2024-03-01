import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_user_app/configs/theme/app_themes.dart';
import 'package:mobile_user_app/features/crud/add_user/bloc/add_user_bloc.dart';
import 'package:mobile_user_app/features/crud/add_user/bloc/add_user_event.dart';
import 'package:mobile_user_app/features/crud/add_user/bloc/add_user_state.dart';

class AddUserPage extends StatelessWidget {
  static const String routeName = '/addPage';

  const AddUserPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create User',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: colorFill,
              ),
              child: const Icon(Icons.close, size: 30)),
        ),
      ),
      body: const SafeArea(
        child: AddUserWidget(),
      ),
    );
  }
}

class AddUserWidget extends StatelessWidget {
  const AddUserWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController name = TextEditingController();
    final TextEditingController job = TextEditingController();

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: BlocBuilder<AddNewUserBloc, AddNewUserState>(
          builder: (context, state) {
            return Column(
              children: [
                const Text(
                  "POST",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: const InputDecoration(hintText: 'Enter name'),
                  controller: name,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: const InputDecoration(hintText: 'Enter job'),
                  controller: job,
                ),
                Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: secondaryColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                  ),
                  onPressed: () {
                    context
                        .read<AddNewUserBloc>()
                        .add(AddNewUser(name.text, job.text));
                  },
                  child: state is AddNewUserLoaded? ||
                          state is AddNewUserInitial
                      ? const Text(
                          "Create User",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )
                      : const CircularProgressIndicator(),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
