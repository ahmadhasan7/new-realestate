import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:realestate/core/class/stutusconntection.dart';
import 'package:realestate/core/constanat/colors.dart';
import 'package:shimmer/shimmer.dart';
import '../constanat/image.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;

  const HandlingDataView({
    Key? key,
    required this.statusRequest,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(AppImage.loading,
                width: 200, height: 200, repeat: true),
          )
        : statusRequest == StatusRequest.offlinefailure
            ? Center(
                child: Lottie.asset(AppImage.offlineimage,
                    width: 250, height: 250, repeat: true),
              )
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    child: Lottie.asset(AppImage.serverfalureimage,
                        width: 250, height: 250, repeat: true),
                  )
                : statusRequest == StatusRequest.failure
                    ? Center(
                        child: Lottie.asset(AppImage.falureimage,
                            width: 250, height: 250, repeat: true),
                      )
                    : widget;
  }
}

class HandlingDataViewShimmer extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  final Widget shimmerwidget;

  const HandlingDataViewShimmer({
    Key? key,
    required this.statusRequest,
    required this.widget,
    required this.shimmerwidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (statusRequest == StatusRequest.loading) {
      return Center(
        child: Shimmer.fromColors(
          child: shimmerwidget,
          baseColor: Colors.grey[400]!,
          highlightColor: Colors.grey[500]!,
        ),
      );
    } else if (statusRequest == StatusRequest.offlinefailure) {
      return  Center(
    child: Lottie.asset(AppImage.offlineimage,
    width: 250, height: 250));

    } else if (statusRequest == StatusRequest.serverfailure) {
      return Center(
          child: Lottie.asset(AppImage.serverfalureimage,
              width: 250, height: 250));
    } else if (statusRequest == StatusRequest.failure) {
      return Center(
          child: Lottie.asset(AppImage.serverfalureimage,
              width: 250, height: 250)
      );
    } else {
      return widget;
    }

  }
}

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;

  const HandlingDataRequest(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(AppImage.loading,
                width: 200, height: 200, repeat: true))
        : statusRequest == StatusRequest.offlinefailure
            ? Center(
                child: Lottie.asset(AppImage.offlineimage,
                    width: 250, height: 250))
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    child: Lottie.asset(AppImage.serverfalureimage,
                        width: 250, height: 250))
                : widget;
  }
}

class CoustomHandlingData extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;

  const CoustomHandlingData(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Stack(children: [
            widget,
            Stack(children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  color: Colors.black.withOpacity(0.1),
                ),
              ),
              Center(
                  child: Lottie.asset(AppImage.loading,
                      width: 200, height: 200, repeat: true)),
            ]),
          ])
        : statusRequest == StatusRequest.offlinefailure
            ? Center(
                child: Lottie.asset(AppImage.offlineimage,
                    width: 250, height: 250))
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    child: Lottie.asset(AppImage.serverfalureimage,
                        width: 250, height: 250))
                : widget;
  }
}

class CoustomDotedHandlingData extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;

  const CoustomDotedHandlingData(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Stack(children: [
            widget,
            Stack(children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  color: Colors.black.withOpacity(0.2),
                ),
              ),
              Center(
                  child: Lottie.asset(AppImage.dotedlottie,
                      width: 200, height: 200, repeat: true)),
            ]),
          ])
        : statusRequest == StatusRequest.offlinefailure
            ? Center(
                child: Lottie.asset(AppImage.offlineimage,
                    width: 250, height: 250))
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    child: Lottie.asset(AppImage.serverfalureimage,
                        width: 250, height: 250))
                : widget;
  }
}
