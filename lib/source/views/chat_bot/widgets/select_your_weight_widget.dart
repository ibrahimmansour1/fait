import 'package:fait/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';

class SelectYourWeightWidget extends StatefulWidget {
  final VoidCallback onWeightSelected;
  const SelectYourWeightWidget({
    Key? key,
    required this.onWeightSelected,
  }) : super(key: key);
  @override
  _SelectYourWeightWidgetState createState() => _SelectYourWeightWidgetState();
}

class _SelectYourWeightWidgetState extends State<SelectYourWeightWidget> {
  RulerPickerController? _rulerPickerController;

  num? weight = 60;

  List<RulerRange> ranges = const [
    RulerRange(begin: 50, end: 180, scale: 0.5),
  ];

  @override
  void initState() {
    super.initState();
    _rulerPickerController = RulerPickerController(value: weight!);
  }

  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                weight!.toStringAsFixed(1),
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
              SizedBox(width: 5.h),
              const Text(
                'kg',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ],
          ),
          RulerPicker(
            controller: _rulerPickerController!,
            rulerBackgroundColor: Colors.transparent,
            onBuildRulerScaleText: (index, value) {
              return value.toInt().toString();
            },
            ranges: ranges,
            onValueChanged: (value) {
              setState(() {
                weight = value;
              });
              widget.onWeightSelected();
            },
            width: MediaQuery.of(context).size.width,
            height: 80,
            rulerMarginTop: 20,
            marker: Container(
                width: 2,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5))),
          ),
        ],
      ),
    );
  }
}
