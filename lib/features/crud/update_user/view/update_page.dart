import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_user_app/configs/theme/app_themes.dart';
import 'package:mobile_user_app/features/crud/update_user/bloc/update_user_bloc.dart';
import 'package:mobile_user_app/features/crud/update_user/bloc/update_user_event.dart';
import 'package:mobile_user_app/features/crud/update_user/bloc/update_user_state.dart';
import 'package:mobile_user_app/features/crud/update_user/view/updated_page.dart';

class UpdateUserPage extends StatelessWidget {
  static const String routeName = '/updatePage';

  const UpdateUserPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Update User',
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
    final id = ModalRoute.of(context)!.settings.arguments as String;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: BlocBuilder<UpdateUserBloc, UpdateUserState>(
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
                        .read<UpdateUserBloc>()
                        .add(UpdateUser(id, name.text, job.text));
                    Navigator.pushNamed(context, UpdatedPage.routeName);
                  },
                  child: state is UpdateUserLoaded? ||
                          state is UpdateUserInitial
                      ? const Text(
                          "Update User",
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
