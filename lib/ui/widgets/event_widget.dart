import 'package:evently_c17/ui/event_dm.dart';
import 'package:evently_c17/ui/utils/app_colors.dart';
import 'package:evently_c17/ui/utils/app_styles.dart';
import 'package:flutter/material.dart';

class EventWidget extends StatelessWidget {
  final EventDM eventDM;

  const EventWidget({super.key, required this.eventDM});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .24,
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              eventDM.categoryDM.imagePath,
              fit: BoxFit.fill,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [buildDateContainer(), buildTitleContainer()],
          ),
        ],
      ),
    );
  }

  buildDateContainer() {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.offWhite,
        ),
        child: Text(
          "${eventDM.dateTime.day} Jan",
          textAlign: TextAlign.start,
          style: AppTextStyles.blue14SemiBold,
        ),
      ),
    );
  }

  buildTitleContainer() => Container(
    padding: EdgeInsets.all(8),
    margin: EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: AppColors.offWhite,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            eventDM.title,
            style: AppTextStyles.blue14SemiBold,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Icon(eventDM.isFavorite ? Icons.favorite : Icons.favorite_border, color: AppColors.blue,),
      ],
    ),
  );
}
