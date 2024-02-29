import 'package:flutter/material.dart';
import 'package:mobile_user_app/configs/theme/app_themes.dart';
import 'package:mobile_user_app/data/repositories/user_repository.dart';

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
      leading: //image with corner radius 20
      ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          user!.avatar!,
          width: 70,
          fit: BoxFit.cover,
        ),),
      title: Row(
        children: [
          Expanded(
            flex: 5,
            child: Text(
                '${user?.firstName} ${user?.lastName}'),
          ),
          const Spacer(),
          Flexible(
            flex: 1,
            child: PopupMenuButton(
              surfaceTintColor: colorFill2,
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: ListTile(
                    title:  Center(child: Text('Select')),
                    onTap: () {

                    },
                  ),
                ),
                PopupMenuItem(child:
                  ListTile(
                    title: Center(child: Text('Update')),
                    onTap: () {
                    },
                  ),),
                PopupMenuItem(
                  child: ListTile(
                    title: Center(child: Text('Delete')),
                    onTap: () {
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      subtitle: Text(user!.email!, style: TextStyle(color: secondaryColor)),

    );
  }
}
