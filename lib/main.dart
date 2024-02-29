import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_user_app/configs/theme/app_themes.dart';
import 'package:mobile_user_app/data/services/user_service.dart';
import 'package:mobile_user_app/features/crud/add_user/bloc/add_user_bloc.dart';
import 'package:mobile_user_app/features/crud/add_user/view/add_user_page.dart';
import 'package:mobile_user_app/features/crud/delete_user/bloc/delete_user_bloc.dart';
import 'package:mobile_user_app/features/crud/get_user/bloc/get_user_bloc.dart';
import 'package:mobile_user_app/features/crud/get_user/view/user_list_page.dart';
import 'package:mobile_user_app/features/crud/update_user/bloc/update_user_bloc.dart';
import 'package:mobile_user_app/features/crud/update_user/view/update_user_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetUserBloc(userService: UserService()),
        ),
        BlocProvider(
          create: (context) => AddNewUserBloc(userService: UserService()),
        ),
        BlocProvider(
          create: (context) => UpdateUserBloc(userService: UserService()),
        ),
        BlocProvider(
          create: (context) => DeleteUserBloc(userService: UserService()),
        ),
      ],
      child: MaterialApp(
          title: 'User CRUD App',
          debugShowCheckedModeBanner: false,
          theme: theme(),
          home: const UserListPage(),
          routes: {
            UserListPage.routeName: (context) => const UserListPage(),
            AddUserPage.routeName: (context) => const AddUserPage(),
            UpdateUserPage.routeName: (context) => const UpdateUserPage(),
          }),
    );
  }
}
