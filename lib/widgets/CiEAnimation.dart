import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:cie_team1/utils/staticVariables.dart';

class AnimatedLogo extends AnimatedWidget {
  // Make the Tweens static because they don't change.
  static final _opacityTween = new Tween<double>(begin: 0.1, end: 1.0);
  static final _sizeTween = new Tween<double>(begin: 0.0, end: 300.0);

  AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Center(
      child: new Opacity(
        opacity: _opacityTween.evaluate(animation),
        child: new Container(
          margin: new EdgeInsets.symmetric(vertical: 10.0),
          height: _sizeTween.evaluate(animation),
          width: _sizeTween.evaluate(animation),
          child: new Image.asset(StaticVariables.IMAGE_PATH + 'hm_logo.png'),
        ),
      ),
    );
  }
}



