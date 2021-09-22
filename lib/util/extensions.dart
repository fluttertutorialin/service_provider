import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../ui/widget/popup_window.dart';
import '../resource/value.dart';
import 'package:url_launcher/url_launcher.dart';
import '../resource/colors.dart';
import '../resource/style.dart';
import '../resource/font.dart';
import '../resource/validation.dart';

extension DynamicUtil on dynamic {
  void progressBarDialogShowController() {
    Get.dialog(
        Container(
            alignment: FractionalOffset.center,
            child: CircularProgressIndicator(strokeWidth: 2)),
        barrierColor: Colors.transparent);
  }

  void progressBarDialogHideController() => Get.back();

  void toast(
      {String title,
      message,
      Color backgroundColor = toastBackgroundColor,
      Color textColor = toastMessageColor,
      SnackPosition flushBarPosition = SnackPosition.BOTTOM}) {
    Get.rawSnackbar(
        animationDuration: Duration(seconds: 2),
        message: '',
        title: '',
        isDismissible: true,
        snackStyle: SnackStyle.FLOATING,
        snackPosition: flushBarPosition,
        backgroundColor: Colors.black.withOpacity(0.2),
        duration: Duration(milliseconds: 2000),
        overlayColor: Colors.black,
        overlayBlur: 0,
        backgroundGradient: LinearGradient(
            colors: [
              Colors.white,
              primarySwatchColor.withOpacity(0.8),
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(0.0, 2.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
        barBlur: 6,
        titleText: Text(title == null ? 'appName'.tr : title,
            style: flushBarTitleStyle(toastTitleColor)),
        messageText: Text(message, style: flushBarMessageStyle(textColor)));
  }
}

extension ContextExtensions on BuildContext {
  double heightInPercent(double percent) {
    var toDouble = percent / 100;
    return MediaQuery.of(this).size.height * toDouble;
  }

  showProgress() {
    Container(
        alignment: FractionalOffset.center,
        child: CircularProgressIndicator(strokeWidth: 1));
  }

  void hideProgress() {
    Navigator.pop(this);
  }

  dropDown({RenderObject renderObject, Widget widget}) {
    FocusScope.of(this).unfocus();

    RenderBox renderBox = renderObject;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    showPopupWindow(
        context: this,
        fullWidth: false,
        isShowBg: true,
        position:
            RelativeRect.fromLTRB(0, offset.dy + renderBox.size.height, 0, 0),
        child: widget);
  }
}

extension ValiationExtensions on String {
  mobileCalling() => launch('tel:' + this);

  validateOptionalEmail() {
    var regExp = RegExp(emailPattern);
    if (this.isEmpty) {
      return null;
    } else if (!regExp.hasMatch(this)) {
      return 'Invalid email';
    } else {
      return null;
    }
  }

  validateEmail() {
    var regExp = RegExp(emailPattern);
    if (this.isEmpty) {
      return 'Email is required';
    } else if (!regExp.hasMatch(this)) {
      return 'Invalid email';
    } else {
      return null;
    }
  }

  validateMobile() {
    var regExp = RegExp(mobilePattern);
    if (this.replaceAll(" ", "").isEmpty) {
      return 'Mobile is required';
    } else if (this.replaceAll(" ", "").length != 10) {
      return 'Mobile number must 10 digits';
    } else if (!regExp.hasMatch(this.replaceAll(" ", ""))) {
      return 'Mobile number must be digits';
    }
    return null;
  }

  String validUserName() {
    var regExp = RegExp(userNamePattern);
    if (this.isEmpty) {
      return 'Name is required';
    } else if (!regExp.hasMatch(this)) {
      return 'Name must be a-z and A-Z';
    }
    return null;
  }

  String validBusinessName() {
    var regExp = RegExp(businessNamePattern);
    if (this.isEmpty) {
      return 'Business name is required';
    } else if (!regExp.hasMatch(this)) {
      return 'Business name must be numeric and alphabet';
    }
    return null;
  }

  String validOwnerName() {
    var regExp = RegExp(ownerNamePattern);
    if (this.isEmpty) {
      return 'Owner name is required';
    } else if (!regExp.hasMatch(this)) {
      return 'Owner name must be a-z and A-Z';
    }
    return null;
  }

  String validDeviceName() {
    var regExp = RegExp(deviceNamePattern);
    if (this.isEmpty) {
      return 'Bio metric device name is required';
    } else if (!regExp.hasMatch(this)) {
      return 'Business name must be a-z and A-Z';
    }
    return null;
  }

  String validDeviceId() {
    var regExp = RegExp(deviceIdPattern);
    if (this.isEmpty) {
      return 'Device load id is required';
    } else if (!regExp.hasMatch(this)) {
      return 'Device load id must be a-z and A-Z';
    }
    return null;
  }

  String validDepartmentName() {
    var regExp = RegExp(businessNamePattern);
    if (this.isEmpty) {
      return 'Department name is required';
    } else if (!regExp.hasMatch(this)) {
      return 'Department name must be numeric and alphabet';
    }
    return null;
  }

  String validEmployeeName() {
    var regExp = RegExp(employeeNamePattern);
    if (this.isEmpty) {
      return 'Employee name is required';
    } else if (!regExp.hasMatch(this)) {
      return 'Employee name must be alphabet and number';
    }
    return null;
  }

  String validRuleName() {
    var regExp = RegExp(employeeNamePattern);
    if (this.isEmpty) {
      return 'Rule name is required';
    } else if (!regExp.hasMatch(this)) {
      return 'Rule name must be alphabet and number';
    }
    return null;
  }

  validateEmployeeMobile() {
    var regExp = RegExp(mobilePattern);
    if (this.replaceAll(" ", "").isEmpty) {
      return 'Employee mobile is required';
    } else if (this.replaceAll(" ", "").length != 10) {
      return 'Employee mobile number must 10 digits';
    } else if (!regExp.hasMatch(this.replaceAll(" ", ""))) {
      return 'Employee mobile number must be digits';
    }
    return null;
  }

  String validEmployeeSalaryAmount() {
    if (this.isEmpty) {
      return 'Salary amount is required';
    }
    return null;
  }

  String validAmount() {
    if (this.isEmpty) {
      return 'Amount is required';
    }
    return null;
  }

  String validNote() {
    if (this.isEmpty) {
      return 'Note is required';
    }
    return null;
  }

  String validRemark() {
    if (this.isEmpty) {
      return 'Remark is required';
    }
    return null;
  }

  bool validationEqual(String currentValue, String checkValue) {
    if (currentValue == checkValue) {
      return true;
    } else {
      return false;
    }
  }
}

extension WidgetExtensions on Widget {
  circleProgressIndicator() => Container(
      alignment: FractionalOffset.center,
      child: CircularProgressIndicator(strokeWidth: 1));

  emptyWidget({String message}) =>
      Center(child: Text(message, style: dataNotAvailableStyle));

  datePicker(
      {BuildContext context,
      ValueChanged<DateTime> onChanged,
      DateTime initialDate,
      DateTime firstDate,
      DateTime lastDate}) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: firstDate,
        lastDate: lastDate);
    if (picked != null) {
      onChanged(picked);
    }
  }

  inputFieldBorder(TextEditingController textEditingController,
          {ValueChanged<String> onChanged,
          int maxLength,
          TextInputType keyboardType,
          String hintText,
          String labelText,
          Widget suffix,
          int maxLines = 1,
          bool readOnly = false,
          TextAlign textAlign = TextAlign.left,
          bool obscureText = false,
          InkWell inkWell,
          FormFieldValidator<String> validation}) =>
      TextFormField(
          controller: textEditingController,
          //cursorColor: appBarTitleColor,
          obscureText: obscureText,
          keyboardType: keyboardType,
          maxLength: maxLength,
          textAlign: textAlign,
          style: TextStyle(fontFamily: mediumFont),
          maxLines: maxLines,
          onChanged: onChanged,
          readOnly: readOnly,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(15),
              border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue, width: 0.5)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 0.5)),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 0.5)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.5)),

              //focusedBorder: InputBorder.none,
              errorStyle: TextStyle(fontFamily: mediumFont, color: Colors.red),
              labelStyle: TextStyle(fontFamily: mediumFont),
              suffixStyle:
                  TextStyle(fontFamily: mediumFont, color: Colors.black),
              prefixStyle:
                  TextStyle(fontFamily: mediumFont, color: Colors.black),
              counterStyle:
                  TextStyle(fontFamily: mediumFont, color: Colors.black),
              helperStyle:
                  TextStyle(fontFamily: mediumFont, color: Colors.black),
              hintText: hintText,
              labelText: labelText,
              suffixIcon: suffix,
              counterText: '',
              //labelText: labelText,
              suffix: inkWell),
          validator: validation);

  inputField(TextEditingController textEditingController,
          {ValueChanged<String> onChanged,
          int maxLength,
          TextInputType keyboardType,
          String hintText,
          int maxLines = 1,
          bool obscureText = false,
          InkWell inkWell,
          FormFieldValidator<String> validation}) =>
      TextFormField(
          controller: textEditingController,
          //cursorColor: appBarTitleColor,
          obscureText: obscureText,
          keyboardType: keyboardType,
          maxLength: maxLength,
          style: TextStyle(fontFamily: mediumFont),
          maxLines: maxLines,
          onChanged: onChanged,
          decoration: InputDecoration(
              border: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorStyle: TextStyle(fontFamily: mediumFont, color: Colors.red),
              labelStyle:
                  TextStyle(fontFamily: mediumFont, color: Colors.black),
              suffixStyle:
                  TextStyle(fontFamily: mediumFont, color: Colors.black),
              prefixStyle:
                  TextStyle(fontFamily: mediumFont, color: Colors.black),
              counterStyle:
                  TextStyle(fontFamily: mediumFont, color: Colors.black),
              helperStyle:
                  TextStyle(fontFamily: mediumFont, color: Colors.black),
              hintText: hintText,
              counterText: '',
              //labelText: labelText,
              suffix: inkWell),
          validator: validation);

  size({double widthScale = 0.0, double heightScale = 0.0}) =>
      SizedBox(width: widthScale, height: heightScale);

  socialIcon({Icon icon, backgroundColor: Colors, VoidCallback voidCallback}) =>
      Container(
          width: 40.0,
          height: 40.0,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: backgroundColor),
          child: RawMaterialButton(
              shape: CircleBorder(), onPressed: voidCallback, child: icon));

  textButton(
          {VoidCallback voidCallback,
          String buttonName,
          double radius = 0.0,
          Color backgroundColor}) =>
      FlatButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        /*style: ButtonStyle(
                padding:
                    MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(13)),
                backgroundColor:
                    MaterialStateProperty.all<Color>(backgroundColor),
                //foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: shape),*/

        padding: EdgeInsets.all(14),
        color: backgroundColor,
        child:
            Text(buttonName, style: buttonStyle, textAlign: TextAlign.center),
        onPressed: voidCallback,
      );

  textButtonIcon(
          {VoidCallback voidCallback,
          String buttonName,
          IconData iconName,
          double radius = 0.0,
          Color backgroundColor}) =>
      FlatButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        /*style: ButtonStyle(
                padding:
                    MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(13)),
                backgroundColor:
                    MaterialStateProperty.all<Color>(backgroundColor),
                //foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: shape),*/

        padding: EdgeInsets.all(10),
        color: backgroundColor,
        child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(iconName, color: Colors.white, size: 18),
              SizedBox(width: 10),
              Text(buttonName, style: buttonStyle, textAlign: TextAlign.center),
              SizedBox(width: 10),
            ]),
        onPressed: voidCallback,
      );

  floatingActionButton(
          {IconData iconData, Color color, VoidCallback voidCallback}) =>
      FloatingActionButton(
          child: Icon(iconData),
          backgroundColor: color,
          onPressed: voidCallback);

  appBar(
          {Color backgroundColor = Colors.white,
          Color themeDataColor = Colors.black,
          Color titleTextColor = Colors.black,
          double elevation = appBarElevation,
          String title,
          List<Widget> actions}) =>
      AppBar(
        elevation: elevation,
        backgroundColor: backgroundColor,
        iconTheme: IconThemeData(color: themeDataColor),
        title: Text(title, style: appBarTitleStyle(color: titleTextColor)),
        actions: actions,
      );

  moreOperationAddDelete(IconData icon) => CircleAvatar(
      radius: 15,
      child: Icon(icon, color: Colors.black.withOpacity(0.7), size: 15),
      backgroundColor: Colors.grey.withOpacity(0.1));
}
