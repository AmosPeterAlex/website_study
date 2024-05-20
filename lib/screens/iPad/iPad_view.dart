import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:nexteons_internship_task/constants/color_constants.dart';
import 'package:nexteons_internship_task/widgets/save_button.dart';
import 'package:nexteons_internship_task/widgets/text_field_widget.dart';

class IPadView extends StatefulWidget {
  IPadView({
    super.key,
  });

  @override
  State<IPadView> createState() => _IPadViewState();
}

class _IPadViewState extends State<IPadView> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController secondNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController userIdController = TextEditingController();

  final TextEditingController districtController = TextEditingController();

  final TextEditingController phoneNoController = TextEditingController();

  final TextEditingController pinCodeController = TextEditingController();

  final TextEditingController countryController = TextEditingController();

  String? addValidation(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    return null;
  }

  String? nameValidation(String? value) {
    if (value == null || value.length < 3) {
      return 'Min 3 letter required';
    }
    return null;
  }

  // String? emailValidation(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return null;
  //   }
  //   if (!value.contains('@')) {
  //     return 'Type a valid email';
  //   }
  //   return null;
  // }

  String? emailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(value)) {
      return 'Type a valid email';
    }
    return null;
  }

  String? idValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'User Id is required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var allTextFields = [
      {
        "title": "First Name",
        "controller": firstNameController,
        "validation": nameValidation,
        "input_format": null,
        "keyboard_type": null
      },
      {
        "title": "Last Name",
        "controller": secondNameController,
        "validation": addValidation,
        "input_format": null,
        "keyboard_type": null
      },
      {
        "title": "Email Address",
        "controller": emailController,
        "validation": emailValidation,
        "input_format": null,
        "keyboard_type": null
      },
      {
        "title": "User ID",
        "controller": userIdController,
        "validation": idValidation,
        "input_format": null,
        "keyboard_type": null
      },
      {
        "title": "District",
        "controller": districtController,
        "validation": addValidation,
        "input_format": null,
        "keyboard_type": null
      },
      {
        "title": "Phone No",
        "controller": phoneNoController,
        "validation": addValidation,
        "input_format": [FilteringTextInputFormatter.digitsOnly],
        "keyboard_type": TextInputType.number
      },
      {
        "title": "Pincode",
        "controller": pinCodeController,
        "validation": addValidation,
        "input_format": [FilteringTextInputFormatter.digitsOnly],
        "keyboard_type": TextInputType.number
      },
      {
        "title": "Country",
        "controller": countryController,
        "validation": addValidation,
        "input_format": null,
        "keyboard_type": null
      },
    ];
    return Scaffold(
      body: Row(
        children: [
          Container(
            color: ColorConstants.primaryColor,
            height: size.height,
            width: size.width * .3,
            child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 35, horizontal: 25),
                  child: Image.asset("assets/images/nexteons_logo.png"),
                )),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * .06,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: size.width * .045,
                    ),
                    Text(
                      "BASIC DETAILS",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                    ),
                  ],
                ),
                Form(
                  key: formKey,
                  child: SizedBox(
                    height: size.height * .64,
                    width: size.width * .68,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * .045), //ee
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: allTextFields.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: size.height * .1,
                            childAspectRatio: 2,
                            mainAxisSpacing: size.height * .015,
                            crossAxisSpacing: size.width * .025),
                        itemBuilder: (context, index) {
                          var title = allTextFields[index]['title'];
                          var controller = allTextFields[index]['controller']
                          as TextEditingController?;
                          var validator = allTextFields[index]['validation']
                          as String? Function(String?)?;
                          return Column(
                            children: [
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text("$title")),
                              SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                child: TextFieldWidget(
                                  controller: controller,
                                  validation: validator,
                                  keyBoardType: allTextFields[index]
                                  ["keyboard_type"] as TextInputType?,
                                  inputFormatters: allTextFields[index]
                                  ["input_format"]
                                  as List<TextInputFormatter>?,
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * .12,
                  width: size.width * .62,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            firstNameController.clear();
                            secondNameController.clear();
                            emailController.clear();
                            userIdController.clear();
                            districtController.clear();
                            phoneNoController.clear();
                            pinCodeController.clear();
                            countryController.clear();
                          },
                          child: Text(
                            "Reset all",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        SaveButton(
                          onPressed: () {
                            final valid = formKey.currentState?.validate();
                            if (valid == true) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Good"),
                                backgroundColor: Colors.green,
                              ));
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Failed"),
                                backgroundColor: Colors.red,
                              ));
                            }
                          },
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
