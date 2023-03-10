import 'dart:async';

import 'package:bhaile/controllers/homeScreenController.dart';
import 'package:bhaile/services/network/globalApi.dart';
import 'package:bhaile/view/homeScreen/homeScreen.dart';
import 'package:bhaile/view/homeScreen/widgets/Botton_Sheet.dart';
import 'package:bhaile/widgets/boldText.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../Constants/AppColors.dart';
import '../../Widgets/Texts.dart';
import '../../widgets/circularButton.dart';
import 'Preferable_one.dart';

class Location_one extends StatefulWidget {
  Location_one({Key? key}) : super(key: key);
  static const CameraPosition _islamabad = CameraPosition(
    target: LatLng(33.7077, 73.0498),
    zoom: 12.4746,
  );

  @override
  State<Location_one> createState() => _Location_oneState();
}

class _Location_oneState extends State<Location_one> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  Future<void> gotoTarget(LatLng target) async {
    final GoogleMapController controller = await _controller.future;
    setState(() {
      marker = Marker(markerId: MarkerId("Location"), position: target);
    });

    controller.animateCamera(CameraUpdate.newLatLngZoom(target, 14));
    // controller.animateCamera(CameraUpdate.newCameraPosition(
    //     CameraPosition(target: target, zoom: 13)));
  }

  Marker marker = Marker(
      markerId: MarkerId('Location'), position: LatLng(33.7077, 73.0498));

  var locationKey = GlobalKey<FormState>();

  TextEditingController locationDetailCtrl = TextEditingController();
  FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    var ctrl = context.read<HomeScreenController>();
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: width / 50),
                          child: const CircleAvatar(
                            backgroundColor: AppColors.GREY,
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: AppColors.WHITE,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(width / 40),
                        child: CircularButton(
                            ontap: () {},
                            heightDivididedBy: 25,
                            radius: 20,
                            color: AppColors.GREY,
                            text: 'Skip',
                            fontSize: 8.sp,
                            widthDividedBy: 6),
                      )
                    ],
                  ),
                  SizedBox(
                    height: height / 15,
                  ),
                  Rich_Text(texta: "Add your", textb: " location", size: 20.sp),
                  SizedBox(
                    height: height / 30,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: width / 20, right: width / 20),
                    child: SimpleText(
                        align: TextAlign.center,
                        text:
                            "You can change this later on your account setting ",
                        size: 10.sp,
                        color: Colors.black),
                  ),
                ],
              ),
              Container(
                width: width,
                height: height / 3.4,
                child: GoogleMap(
                  markers: {marker},
                  mapType: MapType.normal,
                  initialCameraPosition: Location_one._islamabad,
                  onCameraMove: (position) async {
                    setState(() {
                      marker = Marker(
                          markerId: MarkerId("Location"),
                          position: LatLng(position.target.latitude,
                              position.target.longitude));
                    });

                    // LatLng l = LatLng(
                    //     position.target.latitude,);
                  },
                  onCameraIdle: () async {
                    List<Placemark> placemarks = await placemarkFromCoordinates(
                        marker.position.latitude, marker.position.longitude);
                    if (placemarks != null && placemarks.isNotEmpty) {
                      Placemark placemark = placemarks[0];
                      locationDetailCtrl.clear();
                      locationDetailCtrl.text =
                          "${placemark.street}, ${placemark.locality}, ${placemark.administrativeArea} ${placemark.postalCode}, ${placemark.country}";
                      // print(address);
                    }
                  },
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
              ),

              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(20.sp),
                    child: Column(
                      children: [
                        Form(
                          key: locationKey,
                          child: TextFormField(
                            focusNode: _focusNode,
                            controller: locationDetailCtrl,
                            onEditingComplete: () async {
                              if (locationKey.currentState!.validate()) {
                                try {
                                  List<Location> locations =
                                      await locationFromAddress(
                                          locationDetailCtrl.text);

                                  _focusNode.unfocus();
                                  gotoTarget(LatLng(locations[0].latitude,
                                      locations[0].longitude));
                                } on NoResultFoundException catch (e) {
                                  locationDetailCtrl.clear();
                                  sshowSnackBar(
                                      "Sorry! The address was wrong\\n Please enter another address");
                                  _focusNode.unfocus();
                                }
                              } else {
                                _focusNode.unfocus();
                              }
                            },
                            validator: (a) {
                              if (a!.isEmpty) {
                                return "Please fill the address filed";
                              }
                              return null;
                            },
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[300],
                              hintText: 'Location Details',
                              prefixIcon: Icon(Icons.location_on_sharp),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(12)),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 21.sp, horizontal: 10.sp),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height / 12,
                        ),
                        CircularButton(
                          ontap: () {
                            if (locationKey.currentState!.validate()) {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: Text(
                                          'Confirm',
                                        ),
                                        content: Text(
                                            'Are you sure this is the correct address?'),
                                        actions: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: BoldText(
                                              text: 'No',
                                              size: 10.sp,
                                              color: AppColors.PRIMARY_DARK,
                                            ),
                                          ),
                                          SizedBox(
                                            width: width / 50,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              ctrl.screenState == 0
                                                  ? Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Preferable_one()))
                                                  : showModalBottomSheet(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return CustomBottomSheet();
                                                      },
                                                    );
                                            },
                                            child: BoldText(
                                              text: 'Yes',
                                              size: 10.sp,
                                              color: AppColors.PRIMARY_DARK,
                                            ),
                                          ),
                                          SizedBox(
                                            width: width / 50,
                                          ),
                                        ],
                                      ));
                            }
                          },
                          heightDivididedBy: 12,
                          text: 'Next',
                          widthDividedBy: 1.35,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              //TextButton(onPressed: , child: child)
            ],
          ),
        ),
      ),
    );
  }
}
