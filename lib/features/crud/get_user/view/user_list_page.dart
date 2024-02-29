import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_user_app/configs/theme/app_themes.dart';
import 'package:mobile_user_app/features/crud/add_user/view/add_user_page.dart';
import 'package:mobile_user_app/features/crud/get_user/bloc/get_user_bloc.dart';
import 'package:mobile_user_app/features/crud/get_user/view/widgets/build_body.dart';
import 'package:mobile_user_app/features/crud/get_user/view/widgets/user_list_tile.dart';

class UserListPage extends StatefulWidget {
  static const routeName = '/listPage';

  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  final _scrollController = ScrollController();
  late GetUserBloc _getUserBloc;

  @override
  void initState() {
    super.initState();
    _getUserBloc = context.read<GetUserBloc>();
    _getUserBloc.add(GetUser());
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: buildAppBar(context),
        body: const BuildBody(),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
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
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AddUserPage.routeName);
            },
            icon: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: colorFill,
                ),
                child: const Icon(Icons.add, size: 30)),
          ),
        ],
      );
  }


  void _onScroll() {
    if (_isBottom) _getUserBloc.add(GetMoreUser());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}



