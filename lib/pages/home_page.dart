import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:go_moon/widgets/dropdownbutton.dart';

class HomePage extends StatelessWidget {
  late double _deviceHeight, _deviceWidth;
  HomePage({Key? key}) : super(key: key);

  @override
  //BuildContext is am abstract class which kind of gives us information about a widget's location in a widget tree(It's basically giving us a visual representation of how one widget connects with the other and how the widget hierarchy of application is formed.)
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    //The Scaffold widget provides the basic visual structure.
    return Scaffold(
      //Within the scaffold, a SafeArea widget ensures that the UI is not obstructed by system UI features like the notch or status bar.
      body: SafeArea(
        child: Container(
          height: _deviceHeight,
          width: _deviceWidth,
          padding: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.05),
          //Stack widget is used to overlay the astronaut image on the page title and booking section
          child: Stack(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _pageTitle(),
                _bookRide(),
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: _astroImageWidget(),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _pageTitle() {
    return const Text(
      "#GoMoon",
      style: TextStyle(
        color: Colors.white,
        fontSize: 70,
        fontWeight: FontWeight.w800, // TO MAKE TEXT BOLD
      ),
    );
  }
  // SAFE AREA IS A WIDGET THAT INSERTS ITS CHILD WITH SUFFICIENT PADDING TO AVOID INTRUSIONS BY
  //THE OPERATING SYSTEM OR YOU COULD SAY THE PHYSICAL DIMENSIONS OF THE DEVICE
  // IT GIVES US A SAFE CANVAS WITHIN OUR DEVICE'S ACTUAL SCREEN IN REAL STATE WHICH IS GOING TO BE UNHINDERED BY
  //THE PHYSICAL ASPECTS OF THE DEVICE SUCH AS THE NOTCH OR THE TOP BAR WHICH INCLUDES WIFI, BATTERY PERCENTAGE, ETC.

  // In Dart if an underscore is present before the name of a variable, a property or a method of a class,....
  //It shows that it is pivate and cannot be accessible from outside the scope of the class.
  Widget _astroImageWidget() {
    return Container(
      height: _deviceHeight * 0.65,
      width: _deviceWidth * 0.65,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.contain, // FIT OF THE IMAGE INSIDE THE WIDGET
          image: AssetImage("assets/images/astro_moon.png"),
        ),
      ),
    );
  }

  Widget _destinationDropDownWidget() {
    return CustomDropdownButtonClass(
      values: const [
        'James Web Station',
        'Preneure Station',
        'Alice Holt Station',
        'Mace Head Station'
      ],
      width: _deviceWidth * 5,
    );
  }

  Widget _travellersinfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomDropdownButtonClass(
          values: const ['1', '2', '3', '4', '5'],
          width: _deviceWidth * 3,
        ),
        CustomDropdownButtonClass(
          values: const ['Economy', 'Business', 'First', 'Private'],
          width: _deviceWidth * 3,
        ),
      ],
    );
  }

  Widget _bookRide() {
    return Container(
      height: _deviceHeight * 0.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _destinationDropDownWidget(),
          _travellersinfo(),
          _rideButton(),
        ],
      ),
    );
  }

  //COLUMN WIDGET IS A WIDGET THAT DISPLAYS ITS CHILDREN IN A CERTICAL ARRAY
  //THE COLUMN WIDGET HOWEVER DOES NOT SCROLL AND IN GENRAL IT IS CONSIDERED AN EROR TO HAVE MORE CHILDREN IN THE
  //THE COLUMN  THAN THE SPACE AVAILABLE TO FIT THEM.
  // SO CONSIDER USING A LIST VIEW WHERE YOU CAN SCROLL THROUGH THE WIDGETS.

  // CROSS AXIS AND MAIN AXIS
  // MAIN AXIS REFERS TO THE AXIS IN WHICH THE CHILDREN ARE BASICALLY ALLIGNED OR DISPLAYED.
  //SO THE MAIN AXIS OF A COLUMN WIDGET IS VERTICAL AXIS AND CROSS AXIS IS HORIZONTAL AXIS

// Material Button provides a lot of useful functionality and kind od freestyles the button for us
// It follows the material design schema.
// onPressed is the required attribute for the Material Button

  Widget _rideButton() {
    return Container(
      margin: EdgeInsets.only(
        bottom: _deviceHeight * 0.01,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      width: _deviceWidth,
      child: MaterialButton(
        onPressed: () {},
        child: const Text(
          "Book Ride",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
