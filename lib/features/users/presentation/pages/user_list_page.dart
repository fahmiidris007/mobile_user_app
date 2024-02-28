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
          child: BlocBuilder<GetUserBloc, GetUserState>(
            builder: (_, state) {
              if (state is GetUserLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GetUserSuccess) {
                return Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(24, 16, 24, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Total: ${state.users?.total} items' , style: TextStyle(color: onPrimaryColor)),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.users?.data.length,
                          itemBuilder: (_, index) {
                            var user = state.users;
                            return UserListTile(user: user, index: index);
                          },
                        ),
                      ),
                    ],
                  ),
                );
              } else if (state is GetUserFailed) {
                return const Center(
                  child: Icon(Icons.refresh),
                );
              }
              return const SizedBox();
            },
          ),
        ),
        Center(
          child: const Text('Selected'),
        ),
      ],

    );
  }
}

