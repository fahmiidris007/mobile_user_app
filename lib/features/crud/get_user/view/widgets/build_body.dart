import 'package:flutter/material.dart';
import 'package:mobile_user_app/features/crud/fav_user/view/widgets/fav_list_view.dart';
import 'package:mobile_user_app/features/crud/get_user/view/widgets/user_list_view.dart';

class BuildBody extends StatelessWidget {
  const BuildBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: <Widget>[
        UserListView(),
        FavListView(),
      ],
    );
  }
}




