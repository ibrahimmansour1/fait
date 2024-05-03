import 'package:fait/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';

class SelectYourHeightWidget extends StatefulWidget {
  final VoidCallback onHeightSelected;
  const SelectYourHeightWidget({
    Key? key,
    required this.onHeightSelected,
  }) : super(key: key);
  @override
  _SelectYourHeightWidgetState createState() => _SelectYourHeightWidgetState();
}

class _SelectYourHeightWidgetState extends State<SelectYourHeightWidget> {
  RulerPickerController? _rulerPickerController;

  num? height = 160;

  List<RulerRange> ranges = const [
    RulerRange(begin: 100, end: 240, scale: 0.5),
  ];

  @override
  void initState() {
    super.initState();
    _rulerPickerController = RulerPickerController(value: height!);
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
                height!.toStringAsFixed(1),
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
              SizedBox(width: 5.h),
              const Text(
                'cm',
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
                height = value;
              });
              widget.onHeightSelected();
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
