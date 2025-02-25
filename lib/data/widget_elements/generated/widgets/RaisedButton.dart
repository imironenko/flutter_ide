import 'package:widget_maker_2_0/data/properties/basic_properties.dart';
import 'package:widget_maker_2_0/data/properties/icon_property.dart';
import 'package:widget_maker_2_0/data/widget_elements/base/widget_element.dart';
import 'package:widget_maker_2_0/data/widget_elements/widgets/base.dart';
import 'package:widget_maker_2_0/data/widget_elements/generated/properties/enums.dart';
import 'package:widget_maker_2_0/data/properties/decoration_property.dart';
import 'package:flutter/cupertino.dart';
import 'package:widget_maker_2_0/data/widget_elements/generated/properties/objects.dart';
import 'package:widget_maker_2_0/data/properties/wrappers/wrappers.dart';
import 'package:widget_maker_2_0/data/properties/enum_properties.dart';
import 'package:flutter/material.dart';
import 'package:widget_maker_2_0/data/widget_elements/wrappers/wrappers.dart';

class ElevatedButtonElement extends WidgetElement with SlotChildElementMixin {
  ElevatedButtonElement({
    required String? id,
    double? elevation,
    EdgeInsets? padding,
    Color? color,
  })  : elevation = MDoubleProperty(
            value: elevation ?? null, name: "elevation", defaultValue: null),
        padding = MEdgeInsetsProperty(
            value: padding ?? null, name: "padding", defaultValue: null),
        color = MColorProperty(
            value: color ?? null, name: "color", defaultValue: null),
        super(id);

  final MDoubleProperty elevation;
  final MEdgeInsetsProperty padding;
  final MColorProperty color;

  static const String CHILD = "child";

  @override
  List<ChildSlot> constructChildSlots() => [
        SingleChildSlot(slotName: CHILD),
      ];

  @override
  List<MProperty> get attributes => [
        elevation,
        padding,
        color,
      ];

  @override
  Widget generateWidget() {
    return ElevatedButtonElementWidget(
      id: id,
    );
  }

  factory ElevatedButtonElement.fromMap(Map<String, dynamic> map) {
    return ElevatedButtonElement(
      id: map["id"],
      elevation: map["elevation"],
      padding: map["padding"],
      color: map["color"],
    );
  }

  @override
  String get name => "ElevatedButton";
}

class ElevatedButtonElementWidget extends StatefulWidget
    with ElementWidgetMixin {
  ElevatedButtonElementWidget({this.id}) : super(key: ObjectKey(id));

  final String? id;

  @override
  _ElevatedButtonElementWidgetState createState() =>
      _ElevatedButtonElementWidgetState();
}

class _ElevatedButtonElementWidgetState
    extends State<ElevatedButtonElementWidget>
    with
        ElementWidgetStateMixin<ElevatedButtonElement,
            ElevatedButtonElementWidget> {
  @override
  Widget build(BuildContext context) {
    return wrapWithDefault(
        // child: RaisedButton(
        child: MaterialButton(
      onPressed: () {},
      child: getChildOrDragTarget(
          childId: element!.findIdForSlot(ElevatedButtonElement.CHILD),
          data: SlotData(slotName: ElevatedButtonElement.CHILD),
          widgetWrapper: (context, child) =>
              sizeWidgetWrapper(context, Size(100.0, 60.0), child)),
      elevation: element!.elevation.value,
      padding: element!.padding.value,
      color: element!.color.value,
    ))!;
  }
}
