import 'package:flutter/material.dart';
import 'package:mobile_user_app/configs/theme/app_themes.dart';
import 'package:mobile_user_app/features/users/data/models/user.dart';

class UserListTile extends StatelessWidget {
  const UserListTile({
    super.key,
    required this.user, required this.index,
  });

  final User? user;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(8),
      leading: Image.network(
        user!.avatar!,
        width: 50,
        fit: BoxFit.cover,
      ),
      title: Row(
        children: [
          Text(
              '${user?.firstName} ${user?.lastName}'),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.more_horiz),
            onPressed: () {},
          ),
        ],
      ),
      subtitle: Text(user!.email!, style: TextStyle(color: secondaryColor)),

    );
  }
}
