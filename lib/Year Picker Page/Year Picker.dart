import 'package:flutter/material.dart';

enum PickerDateComponent { day, month, year }

class DatePicker extends StatefulWidget {
  DateTime? upperLimit;
  DateTime? lowerLimit;

  Function dateChangedCallback;

  DatePicker({
    this.upperLimit,
    this.lowerLimit,
    required this.dateChangedCallback,
  });

  DatePicker.upperLimit({this.upperLimit, required this.dateChangedCallback});

  DatePicker.lowerLimit({this.lowerLimit, required this.dateChangedCallback});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime currentDate = DateTime.now().toLocal();
  DateTime today = DateTime.now().toLocal();

  String get _yesterYear {
    return (currentDate.year - 1).toString();
  }

  String get _year {
    return currentDate.year.toString();
  }

  String get _nextYear {
    return (currentDate.year + 1).toString();
  }

  @override
  Widget build(BuildContext context) {
    return datePickerContainer();
  }

  Widget datePickerContainer() {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Row(
        children: [
          // Day
          // _dates(_yesterDay, _day, _nextDay, PickerDateComponent.day),
          // Month
          // _dates(_yesterMonth, _month, _nextMonth, PickerDateComponent.month),
          // Year
          _dates(_yesterYear, _year, _nextYear, PickerDateComponent.year),
        ],
      ),
    );
  }

  Widget _dates(String yesterData, String todayData, String tomorrowData,
      PickerDateComponent comp) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Up Arrow
          InkWell(
            child: const Icon(Icons.arrow_drop_up),
            /*const Image(
              image: AssetImage("resources/images/top_arrow.png"),
              height: 14,
              width: 24,
            ),*/
            onTap: () {
              final lLimit = widget.lowerLimit;

              if (comp == PickerDateComponent.year) {
                DateTime tempDate = DateTime(currentDate.year - 1);

                setState(() {
                  if (lLimit == null) {
                    currentDate = tempDate;
                    widget.dateChangedCallback(currentDate);
                  } else if (tempDate.compareTo(lLimit) >= 0) {
                    currentDate = tempDate;
                    widget.dateChangedCallback(currentDate);
                  }
                });
              }
            },
          ),
          const SizedBox(
            height: 15,
          ),

          Text(
            yesterData,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              //rgba(25, 25, 25, 0.25)
              color: Theme.of(context).disabledColor,
            ),
          ),
          // Divider rgba(238, 117, 24, 1)
          const SizedBox(
            height: 10,
          ),

          //Text
          const SizedBox(
            height: 10,
          ),

          Text(
            todayData,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          //Divider
          const SizedBox(
            height: 10,
          ),
          // Text
          const SizedBox(
            height: 10,
          ),

          Text(
            tomorrowData,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              //rgba(25, 25, 25, 0.25)
              color: Theme.of(context).disabledColor,
            ),
          ),
          const SizedBox(
            height: 15,
          ),

          InkWell(
            child: const Icon(Icons.arrow_drop_down),
            /*const Image(
              image: AssetImage("resources/images/bottom_arrow.png"),
              height: 14,
              width: 24,
            )*/
            onTap: () {
              Future.delayed(
                Duration(seconds: 1),
                    () {
                  final uLimit = widget.upperLimit;

                  if (comp == PickerDateComponent.year) {
                    DateTime tempDate = DateTime(currentDate.year + 1);
                    setState(() {
                      if (uLimit == null) {
                        currentDate = tempDate;
                        widget.dateChangedCallback(currentDate);
                      } else if (tempDate.compareTo(uLimit) <= 0) {
                        currentDate = tempDate;
                        widget.dateChangedCallback(currentDate);
                      }
                    });
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
