import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

/// Creates a Widget representing the day.
class DayItem extends StatelessWidget {
  const DayItem({
    Key? key,
    required this.dayNumber,
    required this.shortName,
    required this.onTap,
    this.isSelected = false,
    this.dayColor,
    this.activeDayColor,
    this.activeDayBackgroundColor,
    this.available = true,
    this.dotsColor,
    this.dayNameColor,
    this.shrink = false,
    required this.heightOfContainer,
    required this.heighBetweenItemInContainer,
    required this.widthOfContainer,
    this.selectedTextColor,
    this.unSelectedTextColor,
    required this.dayNumberFontSize,
    required this.shortNameFontSize,
  }) : super(key: key);
  final int dayNumber;
  final String shortName;
  final bool isSelected;
  final Function onTap;
  final Color? dayColor;
  final Color? activeDayColor;
  final Color? activeDayBackgroundColor;
  final Color? selectedTextColor;
  final Color? unSelectedTextColor;
  final bool available;
  final Color? dotsColor;
  final Color? dayNameColor;
  final bool shrink;
  final double heightOfContainer;
  final double heighBetweenItemInContainer;
  final double widthOfContainer;
  final double dayNumberFontSize;
  final double shortNameFontSize;

  GestureDetector _buildDay(BuildContext context) {
    final textStyle = TextStyle(
      color: available
          ? dayColor ?? Theme.of(context).colorScheme.secondary
          : dayColor?.withOpacity(0.5) ??
              Theme.of(context).colorScheme.secondary.withOpacity(0.5),
      fontSize: shrink ? 14 : 20.sp,
      fontWeight: FontWeight.normal,
    );
    final selectedStyle = TextStyle(
      color: activeDayColor ?? Colors.white,
      fontSize: shrink ? 14 : 20.sp, /////
      fontWeight: FontWeight.w500,
      // height: 0.8,
    );

    return GestureDetector(
      onTap: available ? onTap as void Function()? : null,
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Container(
          decoration: isSelected
              ? BoxDecoration(
                  color: activeDayBackgroundColor ??
                      Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(5),
                )
              : BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ), //change color of inactive date container
          height: heightOfContainer,
          width: widthOfContainer,
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              if (isSelected) ...[
                SizedBox(height: shrink ? 6 : 9.h),
                // if (!shrink) _buildDots(),
                // SizedBox(height: shrink ? 9 : 12),
              ] else
                SizedBox(height: shrink ? 10 : 9.h),
              if (isSelected) ...[
                Text(
                  shortName,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: selectedTextColor,
                      fontWeight: FontWeight.w500,
                      fontSize: shortNameFontSize,
                    ),
                  ),
                ),
              ] else
                Text(
                  shortName,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: unSelectedTextColor,
                      fontWeight: FontWeight.w500,
                      fontSize: shortNameFontSize,
                    ),
                  ),
                ),
              SizedBox(
                height: heighBetweenItemInContainer,
              ),
              Text(
                dayNumber.toString(),
                style: isSelected
                    ? GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: selectedTextColor,
                          fontWeight: FontWeight.w500,
                          fontSize: dayNumberFontSize,
                        ),
                      )
                    : GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: isSelected
                              ? selectedTextColor
                              : unSelectedTextColor,
                          fontWeight: FontWeight.w600,
                          fontSize: dayNumberFontSize,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _buildDots() {
  //   final dot = Container(
  //     height: 5,
  //     width: 5,
  //     decoration: BoxDecoration(
  //       color: dotsColor ?? activeDayColor ?? Colors.white,
  //       shape: BoxShape.circle,
  //     ),
  //   );

  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //     children: [dot, dot],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return _buildDay(context);
  }
}
