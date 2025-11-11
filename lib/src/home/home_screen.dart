import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/core/base/base_widget/stateful/base_stateful_widget.dart';
import 'package:flutter_bloc_architecture/src/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_architecture/src/home/widgets/item_card_widget.dart';
import 'package:flutter_bloc_architecture/src/settings/settings_screen.dart';
import 'package:flutter_bloc_architecture/src/widget/render/gap.dart';
import 'package:flutter_bloc_architecture/src/widget/theme_toggle_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends BaseStatefulWidget<HomeBloc> {
  const HomeScreen(super.bloc, {super.key});

  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BasePageState<HomeBloc, HomeScreen> {
  @override
  void initState() {
    super.initState();
    bloc.fetchData();
  }

  @override
  PreferredSizeWidget? buildAppbar() => AppBar(
    title: Text(
      'Home Screen',
      style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
    ),
    centerTitle: true,
    leading: GestureDetector(
      onTap: onBackPressed,
      child: Icon(
        Icons.arrow_back_ios,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    ),
    actions: [
      const ThemeToggleWidget(),
      IconButton(
        onPressed: () => Navigator.pushNamed(context, SettingsScreen.routeName),
        icon: Icon(
          Icons.settings,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    ],
    backgroundColor: Theme.of(context).primaryColor,
  );

  @override
  Widget buildView(BuildContext context, HomeBloc model) {
    return BlocSelector<HomeBloc, HomeState, List<ProductModel>>(
      selector: (s) => s.list,
      builder: (_, list) {
        if (list.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.separated(
          padding: const EdgeInsets.all(12).r,
          itemCount: list.length,
          itemBuilder: (_, index) {
            final item = list[index];
            return ItemCard(title: item.title, subtitle: item.category);
          },
          separatorBuilder: (_, _) {
            return const Gap.height(12);
          },
        );
      },
    );
  }
}
