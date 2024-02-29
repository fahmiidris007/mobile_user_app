import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_user_app/configs/theme/app_themes.dart';
import 'package:mobile_user_app/features/crud/add_user/view/add_user_page.dart';
import 'package:mobile_user_app/features/crud/get_user/bloc/get_user_bloc.dart';
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

  _buildBody() {
    return TabBarView(
      children: <Widget>[
        Center(
          child: BlocBuilder<GetUserBloc, GetUserState>(builder: (context, state) {
            if (state is GetUserLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetUserLoaded) {
              return Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24, 16, 24, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Total: ${state.user.length} items' , style: TextStyle(color: onPrimaryColor)),
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
              return const Text('Something went wrong!');
            }else{
              return const Text('Something went wrong!');
            }
          }),
        ),
        Center(
          child: const Text('Selected'),
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

