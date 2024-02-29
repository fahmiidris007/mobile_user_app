import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_user_app/configs/theme/app_themes.dart';
import 'package:mobile_user_app/features/users/presentation/bloc/users/remote/get/get_user_bloc.dart';
import 'package:mobile_user_app/features/users/presentation/widgets/user_list_tile.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {

  @override
  void initState() {
    super.initState();
    context.read<GetUserBloc>().add(GetUser());
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Padding(
        padding: EdgeInsets.only(left: 16),
        child: Text(
          'User List',
          style: TextStyle(color: Colors.black),
        ),
      ),
      bottom: const TabBar(
        tabs: [
          Tab(
            text: 'Non Selected',
          ),
          Tab(
            text: 'Selected',
          ),
        ],
      )
    );
  }

  _buildBody() {
    return TabBarView(
      children: <Widget>[
        Center(
          child: BlocBuilder<GetUserBloc, GetUserState>(builder: (context, state) {
            if (state is GetUserLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetUserLoaded) {
              return Center(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.user.length,
                  itemBuilder: (context, index) {
                    print("Item Count: ${index}");
                    return UserListTile(
                      user: state.user[index],
                      index: index,
                    );
                  },
                ),
              );
            } else if (state is GetUserError) {
              return const Text('Something went wrong!');
            }else{
              return const Text('Something went wrong!');
            }
          }),
        ),
        Center(
          child: const Text('Selected'),
        ),
      ],

    );
  }
}

