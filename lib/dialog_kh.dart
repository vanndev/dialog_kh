library dialog_kh;

import 'package:art_buttons_kh/art_buttons_kh.dart';
import 'package:flutter/material.dart';

/// Dialog kh
/// When you set auto close, you must be can not use button to click
/// Default => dialog auto close

class DialogKh {
  static Future<dynamic> alertDialogKh({
    required BuildContext context,
    bool? isAutoClosed = true,
    int? seconds,
    String? icon,
    String? title,
    Color? titleColor,
    String? fontFamily,
    String? description,
    Color? descColor,
    String? btnLabelR,
    String? btnLabelL,
    Color? backgroundColorBtnR,
    Color? backgroundColorBtnL,
    Color? labelColorBtnR,
    Color? labelColorBtnL,
    bool? isTextField = false,
    String? labelTextField,
    String? labelSubmit,
    Color? backgroundColorBtnSubmit,
    Function? onConfirm,
    Function? onCancel,
    Function? onSubmit,
    TextEditingController? txtEditController,
    Color? backgroundColor,
    Widget? header,
    bool? disableBtn = true,
    Widget? bottom,
    double? radius,
  }) async {
    showGeneralDialog(
      context: context,
      barrierDismissible: isAutoClosed ?? false,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      pageBuilder: (context, animation, secondaryAnimation) {
        return GestureDetector(
          onTap: (isAutoClosed ?? false)
              ? () {
                  isAutoClosed = false;
                  Navigator.pop(context);
                }
              : null,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black.withOpacity(0.1),
            child: AlertDialog(
              backgroundColor: backgroundColor ?? Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(radius ?? 20)),
              ),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    header ?? Container(),
                    const SizedBox(height: 20),
                    Text(
                      title ?? "Congratulations",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: titleColor ?? Colors.black,
                        fontWeight: FontWeight.w600,
                        fontFamily: fontFamily,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description ?? "Congratulation your work is good",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: fontFamily,
                        fontWeight: FontWeight.w400,
                        color: descColor ?? Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 20),

                    /// Have two buttons when auto close = true
                    if (disableBtn == false)
                      Row(
                        children: [
                          Expanded(
                            child: ArtButtonsKh(
                              fontFamily: fontFamily,
                              text: btnLabelL ?? "Cancel",
                              backgroundColor: backgroundColorBtnL ?? Colors.black,
                              onPressed: onCancel,
                              textColor: labelColorBtnL,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: ArtButtonsKh(
                              fontFamily: fontFamily,
                              text: btnLabelR ?? "Okay",
                              backgroundColor: backgroundColorBtnR ?? Theme.of(context).primaryColor,
                              onPressed: onConfirm,
                              textColor: labelColorBtnR,
                            ),
                          ),
                        ],
                      ),

                    /// text field is enable
                    if (isTextField ?? false)
                      TextFormField(
                        cursorColor: Theme.of(context).primaryColor,
                        controller: txtEditController,
                        style: TextStyle(fontSize: 12, color: descColor ?? Colors.grey, fontWeight: FontWeight.w400),
                        decoration: InputDecoration(
                          labelText: labelTextField ?? "Comment",
                          labelStyle: TextStyle(fontSize: 12, color: descColor ?? Colors.grey, fontWeight: FontWeight.w400),
                          contentPadding: const EdgeInsets.only(bottom: 10, top: 10, left: 10),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.grey.shade400),
                          ),
                        ),
                      ),
                    const SizedBox(height: 10),
                    if (isTextField ?? false)
                      ArtButtonsKh(
                        fontFamily: fontFamily,
                        text: labelSubmit ?? "Submit",
                        backgroundColor: backgroundColorBtnSubmit ?? Theme.of(context).primaryColor,
                        onPressed: onSubmit,
                      ),
                    bottom ?? Container(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );

    Future.delayed(Duration(seconds: seconds ?? 3), () {
      if (isAutoClosed ?? false) {
        Navigator.pop(context);
      }
    });
  }

  static Future<dynamic> messageKh({
    required BuildContext context,
    double? radius,
    String? title,
    Color? titleColor,
    String? description,
    Color? descColor,
    String? fontFamily,
    Widget? leading,
    Widget? trailing,
  }) async {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(radius ?? 20),
          topLeft: Radius.circular(radius ?? 20),
        ),
      ),
      builder: (context) {
        return Container(
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              leading ?? Container(),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title ?? 'Success',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: titleColor, fontFamily: fontFamily),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description ?? 'Your request successfully',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: descColor, fontFamily: fontFamily),
                  ),
                ],
              ),
              const SizedBox(width: 10),
              trailing ?? Container(),
            ],
          ),
        );
      },
    );
  }

  static Future<dynamic> bottomSheetKh({
    required BuildContext context,
    double? height,
    double? radius,
    String? title,
    Color? titleColor,
    String? description,
    Color? descColor,
    Widget? header,
    String? fontFamily,
    String? btnLabelR,
    String? btnLabelL,
    Color? backgroundColorBtnR,
    Color? backgroundColorBtnL,
    Function? onCancel,
    Function? onConfirm,
    bool? disableBtn = false,
    Color? labelColorBtnR,
    Color? labelColorBtnL,
  }) async {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(radius ?? 20),
          topLeft: Radius.circular(radius ?? 20),
        ),
      ),
      builder: (context) {
        return SizedBox(
          height: height ?? 280.00,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              header ?? Container(),
              const SizedBox(height: 20),
              Text(
                title ?? "Congratulations",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: titleColor ?? Colors.black,
                  fontWeight: FontWeight.w600,
                  fontFamily: fontFamily,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description ?? "Congratulation your work is good",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: fontFamily,
                  fontWeight: FontWeight.w400,
                  color: descColor ?? Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              if (disableBtn == false)
                Row(
                  children: [
                    Expanded(
                      child: ArtButtonsKh(
                        fontFamily: fontFamily,
                        text: btnLabelR ?? "Cancel",
                        textColor: labelColorBtnL,
                        backgroundColor: backgroundColorBtnL ?? Colors.black,
                        onPressed: onCancel,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: ArtButtonsKh(
                        fontFamily: fontFamily,
                        text: btnLabelL ?? "Okay",
                        textColor: labelColorBtnR,
                        backgroundColor: backgroundColorBtnR ?? Theme.of(context).primaryColor,
                        onPressed: onConfirm,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }
}
