import 'package:flutter/material.dart';

class CustomDropDown {
  bool _isShow = false;

  OverlayEntry? _overlayEntry;

  insertCustomDropDown(BuildContext context, LayerLink link,
      {Widget? child, double? height}) {
    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          top: 0,
          child: CompositedTransformFollower(
            link: link,
            offset: const Offset(0, 50),
            child: Material(
              color: Colors.transparent,
              child: Container(
                height: height ?? 250,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[300]!,
                        spreadRadius: 2,
                        blurRadius: 20,
                        offset: const Offset(0, 4))
                  ],
                ),
                child: child,
              ),
            ),
          ),
        );
      },
    );
    _isShow = !_isShow;
    return Overlay.of(context)!.insert(_overlayEntry!);
  }

  removeCustomDropDown() {
    _overlayEntry!.remove();
    _isShow = !_isShow;
  }

  toggelCustomDropDown(BuildContext context, LayerLink link,
      {Widget? child, double? height}) {
    if (_isShow) {
      removeCustomDropDown();
    } else {
      insertCustomDropDown(context, link, child: child, height: height);
    }
  }
}
