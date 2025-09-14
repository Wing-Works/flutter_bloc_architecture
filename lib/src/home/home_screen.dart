import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/base/base_widget/stateless/base_stateless_widget.dart';
import 'package:flutter_clean_architecture/core/di/di.dart';
import 'package:flutter_clean_architecture/src/home/bloc/home_bloc.dart';
import 'package:flutter_clean_architecture/src/home/widgets/item_card_widget.dart';
import 'package:flutter_clean_architecture/src/widget/render/gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends BaseStatelessWidget<HomeBloc> {
  const HomeScreen({super.key});

  @override
  HomeBloc get bloc => getIt<HomeBloc>();

  @override
  PreferredSizeWidget? buildAppbar(BuildContext context, HomeBloc bloc) {
    return AppBar(
      title: const Text('Home Screen', style: TextStyle(color: Colors.white)),
      centerTitle: true,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.refresh,
            color: Colors.white,
          ),
        ),
      ],
      backgroundColor: Colors.deepPurple,
    );
  }

  @override
  Widget buildView(BuildContext context, HomeBloc model) {
    return BlocSelector<HomeBloc, HomeState, List<ProductModel>>(
      selector: (s) => s.list,
      builder: (_, list) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12).w,
          child: ListView.separated(
            itemCount: list.length,
            itemBuilder: (_, index) {
              final item = list[index];
              return ItemCard(
                title: item.title,
                subtitle: item.category,
              );
            },
            separatorBuilder: (_, __) {
              return const Gap.height(12);
            },
          ),
        );
      },
    );
  }
}
