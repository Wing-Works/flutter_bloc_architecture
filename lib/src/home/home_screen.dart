import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/core/base/base_widget/stateless/base_stateless_widget.dart';
import 'package:flutter_bloc_architecture/core/l10n/generated/l10n.dart';
import 'package:flutter_bloc_architecture/src/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_architecture/src/home/widgets/item_card_widget.dart';
import 'package:flutter_bloc_architecture/src/settings/settings_screen.dart';
import 'package:flutter_bloc_architecture/src/widget/render/gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends BaseStatelessWidget<HomeBloc> {
  const HomeScreen(super.bloc, {super.key});

  static const String routeName = '/home';

  @override
  PreferredSizeWidget? buildAppbar(BuildContext context, HomeBloc bloc) {
    return AppBar(
      leading: Icon(Icons.menu_sharp, color: Theme.of(context).cardColor),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, SettingsScreen.routeName);
          },
          icon: Icon(Icons.settings, color: Theme.of(context).cardColor),
        ),
      ],
      backgroundColor: Theme.of(context).primaryColor,
    );
  }

  @override
  Widget buildView(BuildContext context, HomeBloc model) {
    final theme = Theme.of(context);
    final s = AppLocalizations.of(context);
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16).w,
          decoration: BoxDecoration(
            color: theme.primaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: const Radius.circular(24).r,
              bottomRight: const Radius.circular(24).r,
            ),
          ),
          child: Column(
            children: [
              TextField(
                controller: model.controller,
                style: theme.textTheme.bodyMedium,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: theme.cardColor,
                  suffixIcon: Icon(
                    Icons.search,
                    color: theme.iconTheme.color,
                    size: 30,
                  ),
                  hintText: s.search,
                  hintStyle: theme.textTheme.bodyMedium,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const Gap.height(20),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              spacing: 20.h,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      spacing: 8,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: theme.cardColor,
                          child: Icon(
                            Icons.category_rounded,
                            size: 30,
                            color: theme.iconTheme.color,
                          ),
                        ),

                        Text(
                          s.all,
                          style: GoogleFonts.poppins(
                            color: theme.textTheme.bodyMedium?.color,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20).r,
                    color: theme.colorScheme.onSurface.withAlpha(20),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 30).h,
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 35).w,
                        width: 20,
                        child: Icon(
                          Icons.discount_outlined,
                          size: 30,
                          color: theme.iconTheme.color,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              s.discountOffer,
                              style: GoogleFonts.poppins(
                                letterSpacing: 4,
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                color: theme.textTheme.titleMedium?.color,
                              ),
                            ),
                            Text(
                              s.discountDescription,
                              style: TextStyle(
                                wordSpacing: 1,
                                color: theme.textTheme.bodyMedium?.color,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 30).w,
                        width: 20,
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          size: 30,
                          color: theme.iconTheme.color,
                        ),
                      ),
                    ],
                  ),
                ),
                BlocSelector<HomeBloc, HomeState, List<ProductModel>>(
                  selector: (s) => s.list,
                  builder: (_, list) {
                    if (list.isEmpty) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return GridView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                            childAspectRatio: 0.75,
                          ),
                      itemCount: list.length,
                      itemBuilder: (_, index) => ItemCard(item: list[index]),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
