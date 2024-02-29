import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_user_app/configs/theme/app_themes.dart';
import 'package:mobile_user_app/features/crud/update_user/bloc/update_user_bloc.dart';
import 'package:mobile_user_app/features/crud/update_user/bloc/update_user_event.dart';
import 'package:mobile_user_app/features/crud/update_user/bloc/update_user_state.dart';

class UpdateUserPage extends StatelessWidget {
  static const String routeName = '/updateUser';

  const UpdateUserPage({Key? key,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
    final id = ModalRoute.of(context)!.settings.arguments as String;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: BlocBuilder<UpdateUserBloc, UpdateUserState>(
          builder: (context, state) {
            return Column(
              children: [
                const Text("POST", style: TextStyle(color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,),),
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
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white
                  ),
                  onPressed: () {
                    context.read<UpdateUserBloc>().add(UpdateUser(id,name.text, job.text));
                    if (context.mounted) {
                      showDialog(
                          context: context,
                          builder: (context) =>
                              NewUserDialog(state: state,));
                    }
                  },
                  child: state is UpdateUserLoaded? || state is UpdateUserInitial?
                  const Text("Update User",
                    style: TextStyle(color: Colors.black, fontSize: 16),)
                      :const CircularProgressIndicator(),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

class NewUserDialog extends StatelessWidget {
  const NewUserDialog({
    super.key,
    required this.state
  });

  final UpdateUserState state;


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateUserBloc, UpdateUserState>(
        builder: (context, state) {
          switch (state) {
            case UpdateUserLoaded():
              return Dialog(
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('ID: ${state.newUser.id}',),
                                Text('Name: ${state.newUser.name}'),
                                Text('Job: ${state.newUser.job}'),
                                Text(
                                  'Updated at: ${state.newUser.updatedAt}',
                                )
                              ]
                          )
                      )
                  )
              );
            case UpdateUserLoading():
              return const CircularProgressIndicator();
          }
          return const Text('Something went wrong');
        });
  }
}
