import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_user_app/configs/theme/app_themes.dart';
import 'package:mobile_user_app/features/users/presentation/bloc/users/remote/get/get_user_bloc.dart';
import 'package:mobile_user_app/features/users/presentation/pages/user_list_page.dart';

import 'features/users/data/services/user_service.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetUserBloc(crudService: CrudService()),
        ),

      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: theme(),
        home: const UserListPage(),
      ),
    );
  }
}
