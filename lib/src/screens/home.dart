import 'package:flutter/material.dart';
import 'package:flutter_animation/src/widgets/cat.dart';

class Home extends StatefulWidget {
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with TickerProviderStateMixin {
  Animation<double> catAnimation;
  AnimationController catController;

  initState() {
    super.initState();

    catController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    catAnimation = Tween(begin: 0.0, end: 100.00).animate(
      CurvedAnimation(
        parent: catController,
        curve: Curves.easeIn,
      ),
    );
  }

  animateCat() {
    // https://api.flutter.dev/flutter/animation/AnimationController-class.html
    if (catController.isDismissed) {
      catController.forward();
    } else {
      catController.reverse();
    }
  }

  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
      ),
      body: GestureDetector(
        child: buildAnimation(),
        onTap: animateCat,
      ),
    );
  }

  Widget buildAnimation() {
    return AnimatedBuilder(
      animation: catAnimation,
      builder: (context, child) {
        return Container(
          child: child,
          margin: EdgeInsets.only(top: catAnimation.value),
        );
      },
      child: Cat(),
    );
  }
}
