import 'package:evently_c17/ui/event_dm.dart';
import 'package:evently_c17/ui/utils/app_colors.dart';
import 'package:evently_c17/ui/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CategoriesTabBar extends StatefulWidget {
  final List<CategoryDM> categories;
  final Function(CategoryDM) onChanged;

  const CategoriesTabBar({
    super.key,
    required this.categories,
    required this.onChanged,
  });

  @override
  State<CategoriesTabBar> createState() => _CategoriesTabBarState();
}

class _CategoriesTabBarState extends State<CategoriesTabBar> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // for(var category in categories){
    //   tabs.add(value)
    // }
    return DefaultTabController(
      length: widget.categories.length,
      child: TabBar(
        isScrollable: true,
        indicatorColor: Colors.transparent,
        tabAlignment: TabAlignment.start,
        onTap: (index) {
          selectedIndex = index;
          widget.onChanged(widget.categories[index]);
          setState(() {});
        },
        dividerColor: Colors.transparent,
        tabs: widget.categories.map(mapCategoryToWidget).toList(),
      ),
    );
  }

  Widget mapCategoryToWidget(CategoryDM category) {
    bool isSelected = selectedIndex == widget.categories.indexOf(category);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.blue: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(
            category.icon,
            color: isSelected ? AppColors.white : AppColors.blue,
          ),
          SizedBox(width: 8),
          Text(
            category.name,
            style: AppTextStyles.white18Medium.copyWith(
              color: isSelected ? AppColors.white : AppColors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
