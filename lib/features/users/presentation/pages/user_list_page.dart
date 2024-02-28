import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_user_app/features/users/presentation/bloc/users/remote/get/get_user_bloc.dart';
import 'package:mobile_user_app/features/users/presentation/widgets/user_list_tile.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Text(
        'User List',
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  _buildBody() {
    return BlocBuilder<GetUserBloc, GetUserState>(
      builder: (_, state) {
        if (state is GetUserLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetUserSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.users?.data?.length ?? 0,
            itemBuilder: (_, index) {
              var user = state.users;
              return ListTile(
                contentPadding: const EdgeInsets.all(8),
                leading: Image.network(
                  user!.data![index].avatar!,
                  width: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(
                    '${user.data![index].firstName} ${user.data![index].lastName}'),
                subtitle: Text(user.data![index].email!),
              );
            },
          );
        } else if (state is GetUserFailed) {
          return const Center(
            child: Icon(Icons.refresh),
          );
        }
        return const SizedBox();
      },
    );
  }
}
