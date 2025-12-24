import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/core/base/base_widget/stateful/base_stateful_widget.dart';
import 'package:flutter_bloc_architecture/src/product_page/bloc/product_page_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductPageScreen extends BaseStatefulWidget<ProductPageBloc> {
  const ProductPageScreen(super.bloc, {required this.productId, super.key});

  static const String routeName = '/product_page';

  final int productId;

  @override
  State<ProductPageScreen> createState() => _ProductPageScreenState();
}

class _ProductPageScreenState
    extends BasePageState<ProductPageBloc, ProductPageScreen> {
  @override
  bool get extendBodyBehindAppBar => true;

  @override
  void initState() {
    super.initState();
    bloc.fetchData(widget.productId);
  }

  @override
  PreferredSizeWidget? buildAppbar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: GestureDetector(
        onTap: () {},
        child: const Icon(
          Icons.keyboard_arrow_left,
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  Widget buildView(BuildContext context, ProductPageBloc bloc) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                // color: Colors.pink,
                width: double.infinity,
                height: 350,
                child:
                    BlocSelector<
                      ProductPageBloc,
                      ProductPageState,
                      ProductModel
                    >(
                      selector: (s) => s.productModel,
                      builder: (_, model) {
                        return Image.network(
                          'https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/thumbnail.webp',
                          fit: BoxFit.cover,
                        );
                      },
                    ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                margin: const EdgeInsets.only(top: 230),
                height: 360,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'White pantsuit',
                              style: GoogleFonts.poppins(
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              '580.00',
                              style: GoogleFonts.poppins(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Description',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          'Choose size',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 5,
                                ),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: const Color(0xffF5F5F5),
                                  child: Text(
                                    'XS',
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 5,
                                ),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: const Color(0xffF5F5F5),
                                  child: Text(
                                    'S',
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 5,
                                ),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: const Color(0xffF5F5F5),
                                  child: Text(
                                    'M',
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 5,
                                ),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: const Color(0xffF5F5F5),
                                  child: Text(
                                    'L',
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 5,
                                ),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: const Color(0xffF5F5F5),
                                  child: Text(
                                    'XL',
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 5,
                                ),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: const Color(0xffF5F5F5),
                                  child: Text(
                                    'XXL',
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 5,
                                ),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: const Color(0xffF5F5F5),
                                  child: Text(
                                    'XXXL',
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: SizedBox(
                            height: 55,
                            width: 200,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                // primary: Colors.black
                              ),
                              onPressed: () {},
                              icon: const Icon(Icons.add),
                              label: Text(
                                'Add to Basket',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
