import 'package:fait/utils/size_utils.dart';
import 'package:flutter/material.dart';

bool isSelected = false;

class GenderWidget extends StatefulWidget {
  final String type;
  final IconData icon;

  const GenderWidget({
    Key? key,
    required this.type,
    required this.icon,
  }) : super(key: key);

  @override
  _GenderWidgetState createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: InkWell(
        onTap: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
        child: Container(
          // width: 160.h,
          // height: 180.v,
          padding: const EdgeInsets.only(
            top: 18,
            left: 37,
            right: 36,
            bottom: 20,
          ),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: const Color(0xFF353767),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 3,
                color: isSelected
                    ? const Color(0xFF4C5A81)
                    : const Color(0xFF17D1E0),
              ),
              borderRadius: BorderRadius.circular(16.adaptSize),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 62.h,
                height: 62.v,
                decoration: ShapeDecoration(
                  color: isSelected
                      ? const Color(0xFF4C5A81)
                      : const Color(0xFF17D1E0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child: Icon(
                  widget.icon,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              SizedBox(height: 18.v),
              Text(
                widget.type,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
