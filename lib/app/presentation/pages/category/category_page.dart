import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_list/app/presentation/pages/category/styles.dart';
import 'package:todo_list/app/presentation/pages/category/widgets/category_bar/category_bar.dart';
import 'package:todo_list/app/presentation/providers/pages/category_page_provider.dart';
import 'package:todo_list/app/presentation/widgets/button/glowing_button/glowing_button.dart';
import 'package:todo_list/app/presentation/widgets/card/color_card/color_card.dart';
import 'package:todo_list/app/presentation/widgets/input/input/input.dart';
import 'package:todo_list/app/presentation/widgets/text/label/label.dart';
import 'package:todo_list/constants/colors_hex.dart';
import 'package:todo_list/constants/theme.dart';

class CategoryPage extends StatelessWidget with CategoryPageStyles {
  final int categoryId;

  CategoryPage({Key key, this.categoryId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CategoryPageProvider>(context, listen: false);

    return FutureBuilder(
      future: provider(categoryId),
      builder: (_, AsyncSnapshot<void> snapshot) => buildScaffold(
        context,
        provider,
      ),
    );
  }

  Widget buildScaffold(BuildContext context, CategoryPageProvider provider) {
    return Scaffold(
      appBar: CategoryAppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  padding: inputContainerPadding(context),
                  child: Form(
                    key: provider.formKey,
                    child: Input(
                      hint: 'Enter the category name',
                      initialValue: provider.category.name,
                      validator: provider.validateInput,
                      onSaved: (value) => provider.category.name = value,
                    ),
                  ),
                ),
                Container(
                  padding: labelContainerPadding(),
                  child: Label('Select them category color', large: true),
                ),
                Consumer<CategoryPageProvider>(
                  builder: (_, provider, __) => AnimatedContainer(
                    duration: TLTheme.duration,
                    height: 7,
                    margin: colorDisplayMargin(),
                    decoration: colorDisplayDecoration(
                      ColorsHex.color(provider.color),
                    ),
                  ),
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
                provider.pageAction == CategoryPageAction.create
                    ? 'Create Category'
                    : 'Update Category',
                style: glowingButtonMarginTextStyle(),
              ),
              onTap: () => provider.handleCategory(context),
            ),
          ),
        ],
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
    final provider = Provider.of<CategoryPageProvider>(context);

    return ColorCard(
      alignment: Alignment.topCenter,
      alpha: provider.color == ColorsHex.codes[index],
      color: ColorsHex.color(ColorsHex.codes[index]),
      height: MediaQuery.of(context).size.height * .2,
      margin: EdgeInsets.only(left: TLTheme.padding),
      onTap: () => provider.setColor(ColorsHex.codes[index]),
    );
  }
}
