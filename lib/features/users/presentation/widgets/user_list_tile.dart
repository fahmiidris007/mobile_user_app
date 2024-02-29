import 'package:flutter/material.dart';
import 'package:mobile_user_app/configs/theme/app_themes.dart';
import 'package:mobile_user_app/features/users/domain/entities/user_list.dart';

class UserListTile extends StatelessWidget {
  const UserListTile({
    super.key,
    required this.user, required this.index,
  });

  final UserListEntity? user;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(8),
      leading: Image.network(
        user!.data[index].avatar,
        width: 50,
        fit: BoxFit.cover,
      ),
      title: Row(
        children: [
          Text(
              '${user?.data[index].firstName} ${user?.data[index].lastName}'),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.more_horiz),
            onPressed: () {},
          ),
        ],
      ),
      subtitle: Text(user!.data[index].email, style: TextStyle(color: secondaryColor)),

    );
  }
}
