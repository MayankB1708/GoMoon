import 'package:flutter/material.dart';

class CustomDropdownButtonClass extends StatelessWidget {
  List<String> values;
  double width;

  CustomDropdownButtonClass({required this.values, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(
            53,
            53,
            53,
            1.0,
          ),
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        child: DropdownButton(
          value: values.first,
          //onChanged: A callback function that is triggered when a new item is selected. Here, it does nothing (empty callback).
          onChanged: (_) {},
          //items: This creates the dropdown items. values.map iterates over the values list, creating a DropdownMenuItem for each value.
          items: values.map(
            (e) {
              return DropdownMenuItem(
                child: Text(e),
                value: e,
              );
            },
          ).toList(),
          underline: Container(),
          dropdownColor: Color.fromRGBO(53, 53, 53, 1.0),
          style: const TextStyle(
            color: Colors.white,
          ),
        ));
  }
}
