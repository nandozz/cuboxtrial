import 'package:cubox/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/configuration_controller.dart';

class ConfigurationView extends GetView<ConfigurationController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Configuration',
            style: TextStyle(
              fontSize: 32,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Color(0xFF7BD2C3),
          actions: [
            Image.asset('assets/icons/cubox-connected.png'),
            SizedBox(
              width: 10,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 50),
                height: 20,
                decoration: BoxDecoration(
                  color: Color(0xFF7BD2C3),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
              ),
              Container(
                // color: Colors.amberAccent,
                padding: EdgeInsets.only(bottom: 30),
                margin: EdgeInsets.symmetric(vertical: 50, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Wi-Fi connection',
                      style: TextStyle(
                          fontSize: 24,
                          color: Color(0xff136A5A),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Enter credentials to your local network'),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Wi-Fi network',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: Color(0xff136A5A),
                          width: 3,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.wifi,
                            color: Color(0xff136A5A),
                          ),
                          Obx(
                            () => Container(
                              width: Get.width - 100,
                              height: 50,
                              child: DropdownButton(
                                hint: Text('Please select Your Wi-Fi'),
                                onChanged: (newValue) {
                                  controller.setLocation = newValue.toString();
                                },
                                isExpanded: true,
                                value: controller.selectedLocation,
                                items: controller.location.map(
                                  (location) {
                                    return DropdownMenuItem(
                                      child: new Text(location),
                                      value: location,
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Password Wi-Fi',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Obx(
                      //PASSWORD
                      () => TextField(
                        obscureText: controller.isHidPass.value,
                        controller: controller.passwordWifi,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Color(0xff136A5A),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () => controller.isHidPass.toggle(),
                            color: Color(0xff136A5A),
                            icon: Icon(
                              controller.isHidPass.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color: Color(0xff9C9C9C),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff136A5A),
                              width: 3,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff136A5A),
                              width: 3,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Access Key',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Obx(
                      () => TextField(
                        obscureText: controller.isAccKey.value,
                        controller: controller.accessKey,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          prefixIcon:
                              Image.asset('assets/icons/cubox-accesskey.png'),
                          suffixIcon: IconButton(
                            onPressed: () => controller.isAccKey.toggle(),
                            color: Color(0xff136A5A),
                            icon: Icon(
                              controller.isAccKey.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                          hintText: 'Create to Login',
                          hintStyle: TextStyle(
                            color: Color(0xff9C9C9C),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff136A5A),
                              width: 3,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff136A5A),
                              width: 3,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: const Color(0xff136A5A),
            child: InkWell(
              onTap: () {
                Get.offAllNamed(Routes.COMPLETE_REGISTER);
              },
              child: const SizedBox(
                height: kToolbarHeight,
                width: double.infinity,
                child: Center(
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
