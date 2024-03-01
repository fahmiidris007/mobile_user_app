import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_user_app/configs/theme/app_themes.dart';
import 'package:mobile_user_app/data/repositories/database_repo.dart';
import 'package:mobile_user_app/data/services/user_service.dart';
import 'package:mobile_user_app/features/crud/add_user/bloc/add_user_bloc.dart';
import 'package:mobile_user_app/features/crud/add_user/view/add_page.dart';
import 'package:mobile_user_app/features/crud/add_user/view/added_page.dart';
import 'package:mobile_user_app/features/crud/delete_user/bloc/delete_user_bloc.dart';
import 'package:mobile_user_app/features/crud/delete_user/view/delete_page.dart';
import 'package:mobile_user_app/features/crud/fav_user/bloc/selected_user_bloc.dart';
import 'package:mobile_user_app/features/crud/get_user/bloc/get_user_bloc.dart';
import 'package:mobile_user_app/features/crud/get_user/view/list_page.dart';
import 'package:mobile_user_app/features/crud/intro/view/splash_screen.dart';
import 'package:mobile_user_app/features/crud/update_user/bloc/update_user_bloc.dart';
import 'package:mobile_user_app/features/crud/update_user/view/update_page.dart';
import 'package:mobile_user_app/features/crud/update_user/view/updated_page.dart';

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
        BlocProvider(
          create: (context) => SelectedUserBloc(databaseRepo: DatabaseHelper()),
        ),
      ],
      child: MaterialApp(
          title: 'User CRUD App',
          debugShowCheckedModeBanner: false,
          theme: theme(),
          home: SplashScreen(),
          routes: {
            UserListPage.routeName: (context) => const UserListPage(),
            AddUserPage.routeName: (context) => const AddUserPage(),
            UpdateUserPage.routeName: (context) => const UpdateUserPage(),
            DeletePage.routeName: (context) => const DeletePage(),
            AddedPage.routeName: (context) => const AddedPage(),
            UpdatedPage.routeName: (context) => const UpdatedPage(),
          }),
    );
  }
}
