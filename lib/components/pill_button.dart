import 'package:flutter/material.dart';

class TradewindButton extends StatelessWidget {
  final String buttonText;
  final Function callBack;
  const TradewindButton(this.buttonText, this.callBack, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: Theme.of(context).colorScheme.secondary,
      onPressed: () {
        callBack;
      },
      child: Text(
        buttonText,
        style: Theme.of(context).textTheme.button.merge(
              TextStyle(
                color: Colors.white,
              ),
            ),
      ),
    );
  }
}
