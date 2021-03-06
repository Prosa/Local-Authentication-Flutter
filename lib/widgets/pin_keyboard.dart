import 'package:flutter/material.dart';
import 'package:test_pin/constants/color_constants.dart';
import 'package:test_pin/constants/view_constants.dart';

class PinKeyboard extends StatelessWidget {
  final Function(int digit)? onDigitTapped;
  final Function()? onBackspace;
  final Function()? onComplete;
  final Color? backspaceIconColor;
  final Color? completeIconColor;
  final Widget? completeIcon;
  final Icon? backspaceIcon;

  const PinKeyboard({
    Key? key,
    required this.onDigitTapped,
    required this.onBackspace,
    required this.onComplete,
    this.backspaceIconColor,
    this.backspaceIcon,
    this.completeIconColor,
    this.completeIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 1,
            child: Row(
              children: [
                _SingleDigitWidget(digit: 1, onDigitTapped: onDigitTapped),
                _SingleDigitWidget(digit: 2, onDigitTapped: onDigitTapped),
                _SingleDigitWidget(digit: 3, onDigitTapped: onDigitTapped),
              ],
            )),
        Expanded(
            flex: 1,
            child: Row(
              children: [
                _SingleDigitWidget(digit: 4, onDigitTapped: onDigitTapped),
                _SingleDigitWidget(digit: 5, onDigitTapped: onDigitTapped),
                _SingleDigitWidget(digit: 6, onDigitTapped: onDigitTapped),
              ],
            )),
        Expanded(
            flex: 1,
            child: Row(
              children: [
                _SingleDigitWidget(digit: 7, onDigitTapped: onDigitTapped),
                _SingleDigitWidget(digit: 8, onDigitTapped: onDigitTapped),
                _SingleDigitWidget(digit: 9, onDigitTapped: onDigitTapped),
              ],
            )),
        Expanded(
            flex: 1,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                _KeyboardIconWidget(
                  onPressed: onBackspace,
                  icon: backspaceIcon ??
                      Icon(Icons.backspace_outlined,
                          color: backspaceIconColor ?? Colors.black, size: 30),
                ),
                _SingleDigitWidget(digit: 0, onDigitTapped: onDigitTapped),
                _KeyboardIconWidget(
                  onPressed: onComplete,
                  icon: completeIcon ??
                      Icon(Icons.check,
                          color: completeIconColor ?? Colors.black, size: 30),
                ),
              ],
            )),
      ],
    );
  }
}

class _KeyboardIconWidget extends StatelessWidget {
  final Function()? onPressed;
  final Widget icon;

  const _KeyboardIconWidget(
      {Key? key, required this.onPressed, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: TextButton(
        style: TextButton.styleFrom(
          fixedSize: const Size.square(double.maxFinite),
        ),
        onPressed: onPressed,
        child: icon,
      ),
    );
  }
}

class _SingleDigitWidget extends StatelessWidget {
  final int digit;
  final Function(int digit)? onDigitTapped;

  const _SingleDigitWidget(
      {Key? key, required this.digit, required this.onDigitTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: TextButton(
        style: TextButton.styleFrom(
          fixedSize: const Size.square(double.maxFinite),
        ),
        onPressed: onDigitTapped != null ? () {
          onDigitTapped!(digit);
        } : null,
        child: Text(
          digit.toString(),
          style: ViewConstants.pinKeyboardTextStyle,
        ),
      ),
    );
  }
}

class PinInput extends StatelessWidget {
  final bool showInput;

  const PinInput({
    Key? key,
    required this.showInput,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(ViewConstants.normalMargin),
      height: 45,
      width: 45,
      padding: const EdgeInsets.all(ViewConstants.normalPadding),
      decoration: BoxDecoration(
        color: ColorConstants.whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: showInput ? Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(100),
        ),
      ) : const SizedBox(),
    );
  }
}
