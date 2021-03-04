import 'package:flutter/material.dart';
import 'package:todo_list/app/presentation/bloc/category_page/category_page_bloc.dart';

import 'package:todo_list/app/presentation/pages/category/styles.dart';
import 'package:todo_list/app/presentation/pages/category/widgets/category_bar/category_bar.dart';
import 'package:todo_list/app/presentation/widgets/button/glowing_button/glowing_button.dart';
import 'package:todo_list/app/presentation/widgets/card/color_card/color_card.dart';
import 'package:todo_list/app/presentation/widgets/input/input/input.dart';
import 'package:todo_list/app/presentation/widgets/text/label/label.dart';
import 'package:todo_list/constants/colors_hex.dart';
import 'package:todo_list/constants/theme.dart';
import 'package:todo_list/injection_container.dart' as ic;

class CategoryPage extends StatelessWidget with CategoryPageStyles {
  final int categoryId;
  final controller = ic.get<CategoryPageBloc>();

  CategoryPage({Key key, this.categoryId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller(categoryId),
      builder: (_, snapshot) {
        return snapshot.connectionState != ConnectionState.done
            ? Scaffold(body: Center(child: CircularProgressIndicator()))
            : buildPage(context);
      },
    );
  }

  StreamBuilder buildPage(BuildContext context) {
    return StreamBuilder(
      stream: controller.output,
      builder: (_, snapshot) => Scaffold(
        appBar: CategoryAppBar(controller: controller),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Container(
                    padding: inputContainerPadding(context),
                    child: Form(
                      key: controller.formKey,
                      child: Input(
                        hint: 'Enter the category name',
                        initialValue: controller.category?.name,
                        validator: controller.validateInput,
                        onSaved: (value) => controller.category.name = value,
                      ),
                    ),
                  ),
                  Container(
                    padding: labelContainerPadding(),
                    child: Label(
                      'This is the category current color',
                      large: true,
                    ),
                  ),
                  AnimatedContainer(
                    duration: TLTheme.duration,
                    height: 7,
                    margin: colorDisplayMargin(),
                    decoration: colorDisplayDecoration(
                      ColorsHex.color(controller.category.color),
                    ),
                  ),
                  Container(
                    padding: labelContainerPadding(),
                    child: Label('Select a new category color'),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * .4,
                    child: _buildCategoriesList(context),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: GlowingButton(
                height: 70,
                margin: glowingButtonMargin(),
                child: Text(
                  controller.pageAction == CategoryPageAction.create
                      ? 'Create Category'
                      : 'Update Category',
                  style: glowingButtonMarginTextStyle(),
                ),
                onTap: () => controller.handleCategory(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoriesList(BuildContext context) {
    return ListView.builder(
      physics: TLTheme.physics,
      scrollDirection: Axis.horizontal,
      itemCount: ColorsHex.codes.length,
      itemBuilder: (_, int index) => _buildCategoryItem(context, index),
    );
  }

  Widget _buildCategoryItem(BuildContext context, int index) {
    return ColorCard(
      alignment: Alignment.topCenter,
      alpha: controller.category.color == ColorsHex.codes[index],
      color: ColorsHex.color(ColorsHex.codes[index]),
      height: MediaQuery.of(context).size.height * .2,
      margin: EdgeInsets.only(left: TLTheme.padding),
      onTap: () => controller.setColor(ColorsHex.codes[index]),
    );
  }
}
