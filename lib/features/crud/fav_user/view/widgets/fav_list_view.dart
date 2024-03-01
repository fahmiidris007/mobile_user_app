import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_user_app/features/crud/fav_user/bloc/selected_user_bloc.dart';
import 'package:mobile_user_app/features/crud/fav_user/bloc/selected_user_state.dart';
import 'package:mobile_user_app/features/crud/fav_user/view/favorite_list_tile.dart';

class FavListView extends StatelessWidget {
  const FavListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedUserBloc, SelectedUserState>(
      builder: (context, state) {
        if (state is SelectedUserInitial) {
          return const Center(child: Text('No user selected yet!'));
        } else if (state is SelectedUserLoaded) {
          return ListView.builder(
            itemCount: state.users.length,
            itemBuilder: (context, index) {
              return FavListTile(user: state.users[index], index: index);
            },
          );
        } else {
          return Text('Something went wrong!');
        }
      },
    );
  }
}