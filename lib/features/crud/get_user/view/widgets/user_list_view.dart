import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_user_app/configs/theme/app_themes.dart';
import 'package:mobile_user_app/features/crud/get_user/bloc/get_user_bloc.dart';
import 'package:mobile_user_app/features/crud/get_user/view/widgets/user_list_tile.dart';

class UserListView extends StatelessWidget {
  const UserListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<GetUserBloc, GetUserState>(builder: (context, state) {
        if (state is GetUserLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetUserLoaded) {
          return Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(24, 16, 24, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Total: ${state.user.length} items',
                    style: TextStyle(color: onPrimaryColor)),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.user.length,
                    itemBuilder: (context, index) {
                      return UserListTile(
                        user: state.user[index],
                        index: index,
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        } else if (state is GetUserError) {
          return Center(child: Text('Something went wrong!'));
        } else {
          return Center(child: Text('Something went wrong!'));
        }
      }),
    );
  }
}