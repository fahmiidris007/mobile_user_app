import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_user_app/configs/theme/app_themes.dart';
import 'package:mobile_user_app/data/repositories/user_repository.dart';
import 'package:mobile_user_app/features/crud/delete_user/bloc/delete_user_bloc.dart';
import 'package:mobile_user_app/features/crud/delete_user/bloc/delete_user_event.dart';
import 'package:mobile_user_app/features/crud/delete_user/view/delete_page.dart';
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
                    title: const Center(child: Text('Delete')),
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
                                  child: ElevatedButton(onPressed: (){
                                    context.read<DeleteUserBloc>().add(DeleteUser(user!.id.toString()));
                                    Navigator.pop(context);
                                    Navigator.pushNamed(context, DeletePage.routeName);
                                  }, child: Text('DELETE NOW')),
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
