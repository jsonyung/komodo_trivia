import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../../data/models/category.dart';
import '../widgets/quiz_option_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(
                decelerationRate: ScrollDecelerationRate.fast),
            slivers: [
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 50,
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(20),
                sliver: _buildCategories(context),
              ),
            ],
          ),
          ClipPath(
            clipper: MultipleRoundedCurveClipper(),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue,
                    Colors.green,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              height: 60,
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Choose a category and enjoy the trivia!',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  _categoryPressed(BuildContext context, Category category) {
    showModalBottomSheet(
      context: context,
      builder: (sheetContext) => BottomSheet(
        builder: (_) => QuizOptionsDialog(
          category: category,
        ),
        onClosing: () {},
      ),
    );
  }

  Widget _buildCategories(BuildContext context) {
    return SliverGrid(
        delegate: SliverChildBuilderDelegate(
            (context, index) => _buildCategoryItem(context, index),
            childCount: categories.length),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).size.width > 1000
              ? 7
              : MediaQuery.of(context).size.width > 600
                  ? 5
                  : 3,
          childAspectRatio: 1.2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ));
  }

  Widget _buildCategoryItem(BuildContext context, int index) {
    Category category = categories[index];

    return GestureDetector(
      onTap: () => _categoryPressed(context, category),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.0),
          gradient: const LinearGradient(
            colors: [
              Colors.blue,
              Colors.green,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (category.icon != null) Icon(category.icon),
                if (category.icon != null) const SizedBox(height: 5.0),
                AutoSizeText(
                  category.name,
                  minFontSize: 10.0,
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  wrapWords: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
