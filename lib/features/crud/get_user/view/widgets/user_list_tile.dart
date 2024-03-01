import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_user_app/configs/theme/app_themes.dart';
import 'package:mobile_user_app/data/models/fav_user.dart';
import 'package:mobile_user_app/data/models/user.dart';
import 'package:mobile_user_app/features/crud/delete_user/bloc/delete_user_bloc.dart';
import 'package:mobile_user_app/features/crud/delete_user/bloc/delete_user_event.dart';
import 'package:mobile_user_app/features/crud/delete_user/view/delete_page.dart';
import 'package:mobile_user_app/features/crud/fav_user/bloc/selected_user_bloc.dart';
import 'package:mobile_user_app/features/crud/fav_user/bloc/selected_user_event.dart';
import 'package:mobile_user_app/features/crud/update_user/view/update_page.dart';

class UserListTile extends StatelessWidget {
  const UserListTile({
    super.key,
    required this.user,
    required this.index,
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
        ),
      ),
      title: Row(
        children: [
          Expanded(
            flex: 5,
            child: Text('${user?.firstName} ${user?.lastName}'),
          ),
          const Spacer(),
          Flexible(
            flex: 1,
            child: PopupMenuButton(
              surfaceTintColor: colorFill2,
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: ListTile(
                    title: Center(child: Text('Select')),
                    onTap: () {
                      Navigator.pop(context);
                      context.read<SelectedUserBloc>().add(
                            AddSelected(user: FavUser.fromUser(user!)),
                          );
                    },
                  ),
                ),
                PopupMenuItem(
                  child: ListTile(
                    title: const Center(child: Text('Update')),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, UpdateUserPage.routeName,
                          arguments: user!.id.toString());
                    },
                  ),
                ),
                PopupMenuItem(
                  child: ListTile(
                    title: const Center(
                        child: Text(
                      'Delete',
                      style: TextStyle(color: deleteColor),
                    )),
                    onTap: () {
                      Navigator.pop(context);
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            child: Wrap(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Center(
                                      child: Text(
                                    'Are you sure ?',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                                Center(
                                  child: ElevatedButton(
                                      onPressed: () {
                                        context.read<DeleteUserBloc>().add(
                                            DeleteUser(user!.id.toString()));
                                        Navigator.pop(context);
                                        Navigator.pushNamed(
                                            context, DeletePage.routeName);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: secondaryColor,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 50, vertical: 20),
                                      ),
                                      child: Text('DELETE NOW',
                                          style: TextStyle(color: Colors.white)),),
                                ),
                              ],
                            ),
                          );
                        },
                      );
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
