import 'package:flutter/material.dart';

class OptionTile extends StatefulWidget {
  final String option, description, correctAnswer, optionSelected;

  const OptionTile(
      {Key key,
      @required this.option,
      @required this.description,
      @required this.correctAnswer,
      @required this.optionSelected})
      : super(key: key);

  @override
  _OptionTileState createState() => _OptionTileState();
}

class _OptionTileState extends State<OptionTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(38),
                border: Border.all(
                    width: 1.5,
                    color: widget.description == widget.optionSelected
                        ? widget.optionSelected == widget.correctAnswer
                            ? Colors.greenAccent
                            : Colors.red.withOpacity(0.7)
                        : Colors.grey)),
            child: Text(
              "${widget.option}",
              style: TextStyle(
                  fontSize: 16,
                  color: widget.optionSelected == widget.description
                      ? widget.correctAnswer == widget.optionSelected
                          ? Colors.green.withOpacity(0.7)
                          : Colors.red
                      : Colors.grey),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            widget.description,
            style: TextStyle(fontSize: 16, color: Colors.black54),
          )
        ],
      ),
    );
  }
}
