import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:widget_maker_2_0/data/bs/widget_board/widget_board.dart';
import 'package:widget_maker_2_0/data/properties/wrappers/wrappers.dart';
import 'package:widget_maker_2_0/data/widget_elements/base/literal_widget.dart';
import 'package:widget_maker_2_0/data/widget_elements/generated/widgets/aaimporter.dart';
import 'package:widget_maker_2_0/data/widget_elements/base/widget_element.dart';
import 'package:flutter/cupertino.dart';
import 'package:widget_maker_2_0/data/widget_elements/wrappers/wrappers.dart';

class WidgetElementDeserializer2 {
  static WidgetBoard buildWidgetBoard(Widget widget) {
    Uuid uuid = Uuid();

    WidgetBoard board = WidgetBoard();

    var literalWidgetElement =
        LiteralWidgetElement(id: uuid.v1(), name: "Hello World Page");

    board.acceptNewChild(board.rootKey, literalWidgetElement);

    _deserializeWidgetElement(widget, board, literalWidgetElement.id, null);

    return board;
  }

  static void _deserializeWidgetElement(Widget? widget, WidgetBoard widgetBoard,
      String? parentId, SlotData? slotData) {
    switch (widget.runtimeType) {
      case Text:
        _parseText(widget as Text, widgetBoard, parentId, slotData);
        break;
      case AppBar:
        _parseAppBar(widget as AppBar, widgetBoard, parentId, slotData);
        break;
      case CupertinoNavigationBar:
        _parseCupertinoNavigationBar(
            widget as CupertinoNavigationBar, widgetBoard, parentId, slotData);
        break;
      case Icon:
        _parseIcon(widget as Icon, widgetBoard, parentId, slotData);
        break;
      case Form:
        _parseForm(widget as Form, widgetBoard, parentId, slotData);
        break;
      case Material:
        _parseMaterial(widget as Material, widgetBoard, parentId, slotData);
        break;
      case Flexible:
        _parseFlexible(widget as Flexible, widgetBoard, parentId, slotData);
        break;
      case TextFormField:
        _parseTextFormField(
            widget as TextFormField?, widgetBoard, parentId, slotData);
        break;
      case GestureDetector:
        _parseGestureDetector(
            widget as GestureDetector, widgetBoard, parentId, slotData);
        break;
      case WNetworkImage:
        _parseWNetworkImage(
            widget as WNetworkImage, widgetBoard, parentId, slotData);
        break;
      case SizedBox:
        _parseSizedBox(widget as SizedBox, widgetBoard, parentId, slotData);
        break;
      case CircularProgressIndicator:
        _parseCircularProgressIndicator(widget as CircularProgressIndicator,
            widgetBoard, parentId, slotData);
        break;
      case LinearProgressIndicator:
        _parseLinearProgressIndicator(widget as LinearProgressIndicator?,
            widgetBoard, parentId, slotData);
        break;
      case CupertinoActivityIndicator:
        _parseCupertinoActivityIndicator(widget as CupertinoActivityIndicator,
            widgetBoard, parentId, slotData);
        break;
      case FloatingActionButton:
        _parseFloatingActionButton(
            widget as FloatingActionButton, widgetBoard, parentId, slotData);
        break;
      case Scaffold:
        _parseScaffold(widget as Scaffold, widgetBoard, parentId, slotData);
        break;
      case ListTile:
        _parseListTile(widget as ListTile, widgetBoard, parentId, slotData);
        break;
      case Center:
        _parseCenter(widget as Center, widgetBoard, parentId, slotData);
        break;
      case Padding:
        _parsePadding(widget as Padding, widgetBoard, parentId, slotData);
        break;
      case RotatedBox:
        _parseRotatedBox(widget as RotatedBox, widgetBoard, parentId, slotData);
        break;
      case AspectRatio:
        _parseAspectRatio(
            widget as AspectRatio, widgetBoard, parentId, slotData);
        break;
      case TextField:
        _parseTextField(widget as TextField, widgetBoard, parentId, slotData);
        break;
      case FractionallySizedBox:
        _parseFractionallySizedBox(
            widget as FractionallySizedBox, widgetBoard, parentId, slotData);
        break;
      case Divider:
        _parseDivider(widget as Divider, widgetBoard, parentId, slotData);
        break;
      case Align:
        _parseAlign(widget as Align, widgetBoard, parentId, slotData);
        break;
      case UnconstrainedBox:
        _parseUnconstrainedBox(
            widget as UnconstrainedBox, widgetBoard, parentId, slotData);
        break;
      case ConstrainedBox:
        _parseConstrainedBox(
            widget as ConstrainedBox, widgetBoard, parentId, slotData);
        break;
      case WContainer:
        _parseWContainer(widget as WContainer, widgetBoard, parentId, slotData);
        break;
      case AbsorbPointer:
        _parseAbsorbPointer(
            widget as AbsorbPointer, widgetBoard, parentId, slotData);
        break;
      case WCircleAvatar:
        _parseWCircleAvatar(
            widget as WCircleAvatar, widgetBoard, parentId, slotData);
        break;
      case Card:
        _parseCard(widget as Card, widgetBoard, parentId, slotData);
        break;
      case Checkbox:
        _parseCheckbox(widget as Checkbox, widgetBoard, parentId, slotData);
        break;
      case Chip:
        _parseChip(widget as Chip, widgetBoard, parentId, slotData);
        break;
      case WPageView:
        _parseWPageView(widget as WPageView, widgetBoard, parentId, slotData);
        break;
      case Column:
        _parseColumn(widget as Column, widgetBoard, parentId, slotData);
        break;
      case Row:
        _parseRow(widget as Row, widgetBoard, parentId, slotData);
        break;
      case Expanded:
        _parseExpanded(widget as Expanded, widgetBoard, parentId, slotData);
        break;
      case MaterialButton:
        _parseMaterialButton(
            widget as MaterialButton, widgetBoard, parentId, slotData);
        break;
      case OutlinedButton:
        _parseOutlineButton(
            widget as OutlinedButton, widgetBoard, parentId, slotData);
        break;
      case ElevatedButton:
        _parseElevatedButton(
            widget as ElevatedButton, widgetBoard, parentId, slotData);
        break;
      case CupertinoButton:
        _parseCupertinoButton(
            widget as CupertinoButton, widgetBoard, parentId, slotData);
        break;
      case WAnimatedContainer:
        _parseWAnimatedContainer(
            widget as WAnimatedContainer, widgetBoard, parentId, slotData);
        break;
      default:
        if (widget != null) {
          throw Exception("Widget ${widget.runtimeType} not supported");
        }
    }
  }

  static void _parseText(Text widget, WidgetBoard widgetBoard, String? parentId,
      SlotData? slotData) {
    var element = TextElement(
      id: Uuid().v1(),
      data: widget.data,
      overflow: widget.overflow,
      textAlign: widget.textAlign,
      style: widget.style,
    );

    widgetBoard.acceptNewChild(parentId, element, slotData);
  }

  static void _parseAppBar(AppBar widget, WidgetBoard widgetBoard,
      String? parentId, SlotData? slotData) {
    var element = AppBarElement(
      id: Uuid().v1(),
      automaticallyImplyLeading: widget.automaticallyImplyLeading,
      backgroundColor: widget.backgroundColor,
      brightness: widget.brightness,
      bottomOpacity: widget.bottomOpacity,
      toolbarOpacity: widget.toolbarOpacity,
      centerTitle: widget.centerTitle,
      titleSpacing: widget.titleSpacing,
      primary: widget.primary,
      elevation: widget.elevation,
    );

    widgetBoard.acceptNewChild(parentId, element, slotData);

    _deserializeWidgetElement(widget.title, widgetBoard, element.id,
        SlotData(slotName: 'title', data: null));
    //_deserializeWidgetElement(widget.title, widgetBoard, element.id, SlotData(slotName: 'title', data: null));
    _deserializeWidgetElement(widget.leading, widgetBoard, element.id,
        SlotData(slotName: 'leading', data: null));
    //_deserializeWidgetElement(widget.leading, widgetBoard, element.id, SlotData(slotName: 'leading', data: null));
  }

  static void _parseCupertinoNavigationBar(CupertinoNavigationBar widget,
      WidgetBoard widgetBoard, String? parentId, SlotData? slotData) {
    var element = CupertinoNavigationBarElement(
      id: Uuid().v1(),
      backgroundColor: widget.backgroundColor,
    );

    widgetBoard.acceptNewChild(parentId, element, slotData);

    _deserializeWidgetElement(widget.leading, widgetBoard, element.id,
        SlotData(slotName: 'leading', data: null));
    //_deserializeWidgetElement(widget.leading, widgetBoard, element.id, SlotData(slotName: 'leading', data: null));
    _deserializeWidgetElement(widget.middle, widgetBoard, element.id,
        SlotData(slotName: 'middle', data: null));
    //_deserializeWidgetElement(widget.middle, widgetBoard, element.id, SlotData(slotName: 'middle', data: null));
    _deserializeWidgetElement(widget.trailing, widgetBoard, element.id,
        SlotData(slotName: 'trailing', data: null));
    //_deserializeWidgetElement(widget.trailing, widgetBoard, element.id, SlotData(slotName: 'trailing', data: null));
  }

  static void _parseIcon(Icon widget, WidgetBoard widgetBoard, String? parentId,
      SlotData? slotData) {
    var element = IconElement(
      id: Uuid().v1(),
      icon: widget.icon,
      size: widget.size,
      color: widget.color,
    );

    widgetBoard.acceptNewChild(parentId, element, slotData);
  }

  static void _parseForm(Form widget, WidgetBoard widgetBoard, String? parentId,
      SlotData? slotData) {
    var element = FormElement(
      id: Uuid().v1(),
    );

    widgetBoard.acceptNewChild(parentId, element, slotData);

    _deserializeWidgetElement(widget.child, widgetBoard, element.id,
        SlotData(slotName: 'child', data: null));
    //_deserializeWidgetElement(widget.child, widgetBoard, element.id, SlotData(slotName: 'child', data: null));
  }

  static void _parseMaterial(Material widget, WidgetBoard widgetBoard,
      String? parentId, SlotData? slotData) {
    var element = MaterialElement(
      id: Uuid().v1(),
    );

    widgetBoard.acceptNewChild(parentId, element, slotData);

    _deserializeWidgetElement(widget.child, widgetBoard, element.id,
        SlotData(slotName: 'child', data: null));
    //_deserializeWidgetElement(widget.child, widgetBoard, element.id, SlotData(slotName: 'child', data: null));
  }

  static void _parseFlexible(Flexible widget, WidgetBoard widgetBoard,
      String? parentId, SlotData? slotData) {
    var element = FlexibleElement(
      id: Uuid().v1(),
      flex: widget.flex,
    );

    widgetBoard.acceptNewChild(parentId, element, slotData);

    _deserializeWidgetElement(widget.child, widgetBoard, element.id,
        SlotData(slotName: 'child', data: null));
    //_deserializeWidgetElement(widget.child, widgetBoard, element.id, SlotData(slotName: 'child', data: null));
  }

  static void _parseTextFormField(TextFormField? widget,
      WidgetBoard widgetBoard, String? parentId, SlotData? slotData) {
    var element = TextFormFieldElement(
      id: Uuid().v1(),
    );

    widgetBoard.acceptNewChild(parentId, element, slotData);
  }

  static void _parseGestureDetector(GestureDetector widget,
      WidgetBoard widgetBoard, String? parentId, SlotData? slotData) {
    var element = GestureDetectorElement(
      id: Uuid().v1(),
    );

    widgetBoard.acceptNewChild(parentId, element, slotData);

    _deserializeWidgetElement(widget.child, widgetBoard, element.id,
        SlotData(slotName: 'child', data: null));
    //_deserializeWidgetElement(widget.child, widgetBoard, element.id, SlotData(slotName: 'child', data: null));
  }

  static void _parseWNetworkImage(WNetworkImage widget, WidgetBoard widgetBoard,
      String? parentId, SlotData? slotData) {
    var element = WNetworkImageElement(
      id: Uuid().v1(),
      width: widget.width,
      height: widget.height,
      src: widget.src,
      fit: widget.fit,
    );

    widgetBoard.acceptNewChild(parentId, element, slotData);
  }

  static void _parseSizedBox(SizedBox widget, WidgetBoard widgetBoard,
      String? parentId, SlotData? slotData) {
    var element = SizedBoxElement(
      id: Uuid().v1(),
      width: widget.width,
      height: widget.height,
    );

    widgetBoard.acceptNewChild(parentId, element, slotData);

    _deserializeWidgetElement(widget.child, widgetBoard, element.id,
        SlotData(slotName: 'child', data: null));
    //_deserializeWidgetElement(widget.child, widgetBoard, element.id, SlotData(slotName: 'child', data: null));
  }

  static void _parseCircularProgressIndicator(CircularProgressIndicator widget,
      WidgetBoard widgetBoard, String? parentId, SlotData? slotData) {
    var element = CircularProgressIndicatorElement(
      id: Uuid().v1(),
      strokeWidth: widget.strokeWidth,
      backgroundColor: widget.backgroundColor,
    );

    widgetBoard.acceptNewChild(parentId, element, slotData);
  }

  static void _parseLinearProgressIndicator(LinearProgressIndicator? widget,
      WidgetBoard widgetBoard, String? parentId, SlotData? slotData) {
    var element = LinearProgressIndicatorElement(
      id: Uuid().v1(),
    );

    widgetBoard.acceptNewChild(parentId, element, slotData);
  }

  static void _parseCupertinoActivityIndicator(
      CupertinoActivityIndicator widget,
      WidgetBoard widgetBoard,
      String? parentId,
      SlotData? slotData) {
    var element = CupertinoActivityIndicatorElement(
      id: Uuid().v1(),
      animating: widget.animating,
      radius: widget.radius,
    );

    widgetBoard.acceptNewChild(parentId, element, slotData);
  }

  static void _parseFloatingActionButton(FloatingActionButton widget,
      WidgetBoard widgetBoard, String? parentId, SlotData? slotData) {
    var element = FloatingActionButtonElement(
      id: Uuid().v1(),
      elevation: widget.elevation,
      tooltip: widget.tooltip,
      foregroundColor: widget.foregroundColor,
      backgroundColor: widget.backgroundColor,
      focusColor: widget.focusColor,
      hoverColor: widget.hoverColor,
      onPressed: widget.onPressed,
    );

    widgetBoard.acceptNewChild(parentId, element, slotData);

    _deserializeWidgetElement(widget.child, widgetBoard, element.id,
        SlotData(slotName: 'child', data: null));
    //_deserializeWidgetElement(widget.child, widgetBoard, element.id, SlotData(slotName: 'child', data: null));
  }

  static void _parseScaffold(Scaffold widget, WidgetBoard widgetBoard,
      String? parentId, SlotData? slotData) {
    var element = ScaffoldElement(
      id: Uuid().v1(),
      backgroundColor: widget.backgroundColor,
    );

    widgetBoard.acceptNewChild(parentId, element, slotData);

    _deserializeWidgetElement(widget.body, widgetBoard, element.id,
        SlotData(slotName: 'body', data: null));
    //_deserializeWidgetElement(widget.body, widgetBoard, element.id, SlotData(slotName: 'body', data: null));
    _deserializeWidgetElement(widget.appBar, widgetBoard, element.id,
        SlotData(slotName: 'appBar', data: null));
    //_deserializeWidgetElement(widget.appBar, widgetBoard, element.id, SlotData(slotName: 'appBar', data: null));
    _deserializeWidgetElement(widget.floatingActionButton, widgetBoard,
        element.id, SlotData(slotName: 'floatingActionButton', data: null));
    //_deserializeWidgetElement(widget.floatingActionButton, widgetBoard, element.id, SlotData(slotName: 'floatingActionButton', data: null));
  }

  static void _parseListTile(ListTile widget, WidgetBoard widgetBoard,
      String? parentId, SlotData? slotData) {
    var element = ListTileElement(
      id: Uuid().v1(),
      isThreeLine: widget.isThreeLine,
      dense: widget.dense,
      contentPadding: widget.contentPadding as EdgeInsets?,
      enabled: widget.enabled,
    );

    widgetBoard.acceptNewChild(parentId, element, slotData);

    _deserializeWidgetElement(widget.leading, widgetBoard, element.id,
        SlotData(slotName: 'leading', data: null));
    //_deserializeWidgetElement(widget.leading, widgetBoard, element.id, SlotData(slotName: 'leading', data: null));
    _deserializeWidgetElement(widget.title, widgetBoard, element.id,
        SlotData(slotName: 'title', data: null));
    //_deserializeWidgetElement(widget.title, widgetBoard, element.id, SlotData(slotName: 'title', data: null));
    _deserializeWidgetElement(widget.subtitle, widgetBoard, element.id,
        SlotData(slotName: 'subtitle', data: null));
    //_deserializeWidgetElement(widget.subtitle, widgetBoard, element.id, SlotData(slotName: 'subtitle', data: null));
    _deserializeWidgetElement(widget.trailing, widgetBoard, element.id,
        SlotData(slotName: 'trailing', data: null));
    //_deserializeWidgetElement(widget.trailing, widgetBoard, element.id, SlotData(slotName: 'trailing', data: null));
  }

  static void _parseCenter(Center widget, WidgetBoard widgetBoard,
      String? parentId, SlotData? slotData) {
    var element = CenterElement(
      id: Uuid().v1(),
    );

    widgetBoard.acceptNewChild(parentId, element, slotData);

    _deserializeWidgetElement(widget.child, widgetBoard, element.id,
        SlotData(slotName: 'child', data: null));
    //_deserializeWidgetElement(widget.child, widgetBoard, element.id, SlotData(slotName: 'child', data: null));
  }

  static void _parsePadding(Padding widget, WidgetBoard widgetBoard,
      String? parentId, SlotData? slotData) {
    var element = PaddingElement(
      id: Uuid().v1(),
      padding: widget.padding as EdgeInsets?,
    );

    widgetBoard.acceptNewChild(parentId, element, slotData);

    _deserializeWidgetElement(widget.child, widgetBoard, element.id,
        SlotData(slotName: 'child', data: null));
    //_deserializeWidgetElement(widget.child, widgetBoard, element.id, SlotData(slotName: 'child', data: null));
  }

  static void _parseRotatedBox(RotatedBox widget, WidgetBoard widgetBoard,
      String? parentId, SlotData? slotData) {
    var element = RotatedBoxElement(
      id: Uuid().v1(),
      quarterTurns: widget.quarterTurns,
    );

    widgetBoard.acceptNewChild(parentId, element, slotData);

    _deserializeWidgetElement(widget.child, widgetBoard, element.id,
        SlotData(slotName: 'child', data: null));
    //_deserializeWidgetElement(widget.child, widgetBoard, element.id, SlotData(slotName: 'child', data: null));
  }

  static void _parseAspectRatio(AspectRatio widget, WidgetBoard widgetBoard,
      String? parentId, SlotData? slotData) {
    var element = AspectRatioElement(
      id: Uuid().v1(),
      aspectRatio: widget.aspectRatio,
    );

    widgetBoard.acceptNewChild(parentId, element, slotData);

    _deserializeWidgetElement(widget.child, widgetBoard, element.id,
        SlotData(slotName: 'child', data: null));
    //_deserializeWidgetElement(widget.child, widgetBoard, element.id, SlotData(slotName: 'child', data: null));
  }

  static void _parseTextField(TextField widget, WidgetBoard widgetBoard,
      String? parentId, SlotData? slotData) {
    var element = TextFieldElement(
      id: Uuid().v1(),
      obscureText: widget.obscureText,
    );

    widgetBoard.acceptNewChild(parentId, element, slotData);
  }

  static void _parseFractionallySizedBox(FractionallySizedBox widget,
      WidgetBoard widgetBoard, String? parentId, SlotData? slotData) {
    var element = FractionallySizedBoxElement(
      id: Uuid().v1(),
      heightFactor: widget.heightFactor,
      widthFactor: widget.widthFactor,
      alignment: widget.alignment as Alignment?,
    );

    widgetBoard.acceptNewChild(parentId, element, slotData);

    _deserializeWidgetElement(widget.child, widgetBoard, element.id,
        SlotData(slotName: 'child', data: null));
    //_deserializeWidgetElement(widget.child, widgetBoard, element.id, SlotData(slotName: 'child', data: null));
  }

  static void _parseDivider(Divider widget, WidgetBoard widgetBoard,
      String? parentId, SlotData? slotData) {
    var element = DividerElement(
      id: Uuid().v1(),
      height: widget.height,
      indent: widget.indent,
      endIndent: widget.endIndent,
      color: widget.color,
    );

    widgetBoard.acceptNewChild(parentId, element, slotData);
  }

  static void _parseAlign(Align widget, WidgetBoard widgetBoard,
      String? parentId, SlotData? slotData) {
    var element = AlignElement(
      id: Uuid().v1(),
      heightFactor: widget.heightFactor,
      widthFactor: widget.widthFactor,
      alignment: widget.alignment as Alignment?,
    );

    widgetBoard.acceptNewChild(parentId, element, slotData);

    _deserializeWidgetElement(widget.child, widgetBoard, element.id,
        SlotData(slotName: 'child', data: null));
    //_deserializeWidgetElement(widget.child, widgetBoard, element.id, SlotData(slotName: 'child', data: null));
  }

  static void _parseUnconstrainedBox(UnconstrainedBox widget,
      WidgetBoard widgetBoard, String? parentId, SlotData? slotData) {
    var element = UnconstrainedBoxElement(
      id: Uuid().v1(),
      constrainedAxis: widget.constrainedAxis,
      textDirection: widget.textDirection,
      alignment: widget.alignment as Alignment?,
    );

    widgetBoard.acceptNewChild(parentId, element, slotData);

    _deserializeWidgetElement(widget.child, widgetBoard, element.id,
        SlotData(slotName: 'child', data: null));
    //_deserializeWidgetElement(widget.child, widgetBoard, element.id, SlotData(slotName: 'child', data: null));
  }

  static void _parseConstrainedBox(ConstrainedBox widget,
      WidgetBoard widgetBoard, String? parentId, SlotData? slotData) {
    var element = ConstrainedBoxElement(
      id: Uuid().v1(),
      constraints: widget.constraints,
    );

    widgetBoard.acceptNewChild(parentId, element, slotData);

    _deserializeWidgetElement(widget.child, widgetBoard, element.id,
        SlotData(slotName: 'child', data: null));
    //_deserializeWidgetElement(widget.child, widgetBoard, element.id, SlotData(slotName: 'child', data: null));
  }

  static void _parseWContainer(WContainer widget, WidgetBoard widgetBoard,
      String? parentId, SlotData? slotData) {
    var element = WContainerElement(
      id: Uuid().v1(),
      width: widget.width,
      height: widget.height,
      color: widget.color,
      alignment: widget.alignment,
      padding: widget.padding as EdgeInsets?,
      decoration: widget.decoration,
      foregroundDecoration: widget.foregroundDecoration,
      constraints: widget.constraints,
      margin: widget.margin as EdgeInsets?,
      transform: widget.transform,
    );

    widgetBoard.acceptNewChild(parentId, element, slotData);

    _deserializeWidgetElement(widget.child, widgetBoard, element.id,
        SlotData(slotName: 'child', data: null));
    //_deserializeWidgetElement(widget.child, widgetBoard, element.id, SlotData(slotName: 'child', data: null));
  }

  static void _parseAbsorbPointer(AbsorbPointer widget, WidgetBoard widgetBoard,
      String? parentId, SlotData? slotData) {
    var element = AbsorbPointerElement(
      id: Uuid().v1(),
    );

    widgetBoard.acceptNewChild(parentId, element, slotData);

    _deserializeWidgetElement(widget.child, widgetBoard, element.id,
        SlotData(slotName: 'child', data: null));
    //_deserializeWidgetElement(widget.child, widgetBoard, element.id, SlotData(slotName: 'child', data: null));
  }

  static void _parseWCircleAvatar(WCircleAvatar widget, WidgetBoard widgetBoard,
      String? parentId, SlotData? slotData) {
    var element = WCircleAvatarElement(
      id: Uuid().v1(),
      radius: widget.radius,
      imageUrl: widget.imageUrl,
    );

    widgetBoard.acceptNewChild(parentId, element, slotData);

    _deserializeWidgetElement(widget.child, widgetBoard, element.id,
        SlotData(slotName: 'child', data: null));
    //_deserializeWidgetElement(widget.child, widgetBoard, element.id, SlotData(slotName: 'child', data: null));
  }

  static void _parseCard(Card widget, WidgetBoard widgetBoard, String? parentId,
      SlotData? slotData) {
    var element = CardElement(
      id: Uuid().v1(),
      clipBehavior: widget.clipBehavior,
      color: widget.color,
      elevation: widget.elevation,
      margin: widget.margin as EdgeInsets?,
      semanticContainer: widget.semanticContainer,
    );

    widgetBoard.acceptNewChild(parentId, element, slotData);

    _deserializeWidgetElement(widget.child, widgetBoard, element.id,
        SlotData(slotName: 'child', data: null));
    //_deserializeWidgetElement(widget.child, widgetBoard, element.id, SlotData(slotName: 'child', data: null));
  }

  static void _parseCheckbox(Checkbox widget, WidgetBoard widgetBoard,
      String? parentId, SlotData? slotData) {
    var element = CheckboxElement(
      id: Uuid().v1(),
      activeColor: widget.activeColor,
      checkColor: widget.checkColor,
      tristate: widget.tristate,
      value: widget.value,
    );

    widgetBoard.acceptNewChild(parentId, element, slotData);
  }

  static void _parseChip(Chip widget, WidgetBoard widgetBoard, String? parentId,
      SlotData? slotData) {
    var element = ChipElement(
      id: Uuid().v1(),
      backgroundColor: widget.backgroundColor,
      clipBehavior: widget.clipBehavior,
      deleteButtonTooltipMessage: widget.deleteButtonTooltipMessage,
      deleteIconColor: widget.deleteIconColor,
      elevation: widget.elevation,
      labelPadding: widget.labelPadding as EdgeInsets?,
      labelStyle: widget.labelStyle,
      padding: widget.padding as EdgeInsets?,
      shadowColor: widget.shadowColor,
    );

    widgetBoard.acceptNewChild(parentId, element, slotData);

    _deserializeWidgetElement(widget.avatar, widgetBoard, element.id,
        SlotData(slotName: 'avatar', data: null));
    //_deserializeWidgetElement(widget.avatar, widgetBoard, element.id, SlotData(slotName: 'avatar', data: null));
    _deserializeWidgetElement(widget.deleteIcon, widgetBoard, element.id,
        SlotData(slotName: 'deleteIcon', data: null));
    //_deserializeWidgetElement(widget.deleteIcon, widgetBoard, element.id, SlotData(slotName: 'deleteIcon', data: null));
    _deserializeWidgetElement(widget.label, widgetBoard, element.id,
        SlotData(slotName: 'label', data: null));
    //_deserializeWidgetElement(widget.label, widgetBoard, element.id, SlotData(slotName: 'label', data: null));
  }

  static void _parseWPageView(WPageView widget, WidgetBoard widgetBoard,
      String? parentId, SlotData? slotData) {
    var element = WPageViewElement(
      id: Uuid().v1(),
      pageSnapping: widget.pageSnapping,
    );

    widgetBoard.acceptNewChild(parentId, element, slotData);

    int i = 0;
    for (Widget widget in widget.children) {
      _deserializeWidgetElement(widget, widgetBoard, element.id,
          SlotData(slotName: 'children', data: i));
      i++;
    }

    //_deserializeWidgetElement(widget.children, widgetBoard, element.id, SlotData(slotName: 'children', data: null));
  }

  static void _parseColumn(Column widget, WidgetBoard widgetBoard,
      String? parentId, SlotData? slotData) {
    var element = ColumnElement(
      id: Uuid().v1(),
      crossAxisAlignment: widget.crossAxisAlignment,
      mainAxisSize: widget.mainAxisSize,
      mainAxisAlignment: widget.mainAxisAlignment,
    );

    widgetBoard.acceptNewChild(parentId, element, slotData);

    int i = 0;
    for (Widget widget in widget.children) {
      _deserializeWidgetElement(widget, widgetBoard, element.id,
          SlotData(slotName: 'children', data: i));
      i++;
    }

    //_deserializeWidgetElement(widget.children, widgetBoard, element.id, SlotData(slotName: 'children', data: null));
  }

  static void _parseRow(Row widget, WidgetBoard widgetBoard, String? parentId,
      SlotData? slotData) {
    var element = RowElement(
      id: Uuid().v1(),
      crossAxisAlignment: widget.crossAxisAlignment,
      mainAxisSize: widget.mainAxisSize,
      mainAxisAlignment: widget.mainAxisAlignment,
      textBaseline: widget.textBaseline,
      textDirection: widget.textDirection,
    );

    widgetBoard.acceptNewChild(parentId, element, slotData);

    int i = 0;
    for (Widget widget in widget.children) {
      _deserializeWidgetElement(widget, widgetBoard, element.id,
          SlotData(slotName: 'children', data: i));
      i++;
    }

    //_deserializeWidgetElement(widget.children, widgetBoard, element.id, SlotData(slotName: 'children', data: null));
  }

  static void _parseExpanded(Expanded widget, WidgetBoard widgetBoard,
      String? parentId, SlotData? slotData) {
    var element = ExpandedElement(
      id: Uuid().v1(),
      flex: widget.flex,
    );

    widgetBoard.acceptNewChild(parentId, element, slotData);

    _deserializeWidgetElement(widget.child, widgetBoard, element.id,
        SlotData(slotName: 'child', data: null));
    //_deserializeWidgetElement(widget.child, widgetBoard, element.id, SlotData(slotName: 'child', data: null));
  }

  static void _parseMaterialButton(MaterialButton widget,
      WidgetBoard widgetBoard, String? parentId, SlotData? slotData) {
    var element = MaterialButtonElement(
      id: Uuid().v1(),
      color: widget.color,
      elevation: widget.elevation,
      padding: widget.padding as EdgeInsets?,
    );

    widgetBoard.acceptNewChild(parentId, element, slotData);

    _deserializeWidgetElement(widget.child, widgetBoard, element.id,
        SlotData(slotName: 'child', data: null));
    //_deserializeWidgetElement(widget.child, widgetBoard, element.id, SlotData(slotName: 'child', data: null));
  }

  static void _parseOutlineButton(OutlinedButton widget,
      WidgetBoard widgetBoard, String? parentId, SlotData? slotData) {
    var element = OutlineButtonElement(
      id: Uuid().v1(),
      color:
          widget.style?.backgroundColor?.resolve(MaterialState.values.toSet()),
      padding: widget.style?.padding?.resolve(MaterialState.values.toSet())
          as EdgeInsets?,
    );

    widgetBoard.acceptNewChild(parentId, element, slotData);

    _deserializeWidgetElement(widget.child, widgetBoard, element.id,
        SlotData(slotName: 'child', data: null));
    //_deserializeWidgetElement(widget.child, widgetBoard, element.id, SlotData(slotName: 'child', data: null));
  }

  static void _parseElevatedButton(ElevatedButton widget,
      WidgetBoard widgetBoard, String? parentId, SlotData? slotData) {
    var element = ElevatedButtonElement(
      id: Uuid().v1(),
      elevation: widget.style?.elevation?.resolve(MaterialState.values.toSet()),
      padding: widget.style?.padding?.resolve(MaterialState.values.toSet())
          as EdgeInsets,
      color:
          widget.style?.backgroundColor?.resolve(MaterialState.values.toSet()),
    );
    widgetBoard.acceptNewChild(parentId, element, slotData);

    _deserializeWidgetElement(widget.child, widgetBoard, element.id,
        SlotData(slotName: 'child', data: null));
    //_deserializeWidgetElement(widget.child, widgetBoard, element.id, SlotData(slotName: 'child', data: null));
  }

  static void _parseCupertinoButton(CupertinoButton widget,
      WidgetBoard widgetBoard, String? parentId, SlotData? slotData) {
    var element = CupertinoButtonElement(
      id: Uuid().v1(),
      color: widget.color,
      disabledColor: widget.disabledColor,
      minSize: widget.minSize,
      padding: widget.padding as EdgeInsets?,
      pressedOpacity: widget.pressedOpacity,
    );

    widgetBoard.acceptNewChild(parentId, element, slotData);

    _deserializeWidgetElement(widget.child, widgetBoard, element.id,
        SlotData(slotName: 'child', data: null));
    //_deserializeWidgetElement(widget.child, widgetBoard, element.id, SlotData(slotName: 'child', data: null));
  }

  static void _parseWAnimatedContainer(WAnimatedContainer widget,
      WidgetBoard widgetBoard, String? parentId, SlotData? slotData) {
    var element = WAnimatedContainerElement(
      id: Uuid().v1(),
      duration: widget.duration as WDuration?,
      width: widget.width,
      height: widget.height,
      color: widget.color,
      alignment: widget.alignment,
      padding: widget.padding as EdgeInsets?,
      decoration: widget.decoration,
      foregroundDecoration: widget.foregroundDecoration,
      constraints: widget.constraints,
      margin: widget.margin as EdgeInsets?,
      transform: widget.transform,
    );

    widgetBoard.acceptNewChild(parentId, element, slotData);

    _deserializeWidgetElement(widget.child, widgetBoard, element.id,
        SlotData(slotName: 'child', data: null));
    //_deserializeWidgetElement(widget.child, widgetBoard, element.id, SlotData(slotName: 'child', data: null));
  }
}
