import 'package:cubox/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
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
                      'Setup your cubox',
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
                                  controller.setSSID = newValue.toString();
                                },
                                isExpanded: true,
                                value: controller.selectedSSID,
                                items: controller.ssid.map(
                                  (ssid) {
                                    return DropdownMenuItem(
                                      child: new Text(ssid),
                                      value: ssid,
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
                      'PIN Access',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'PIN to unlock ',
                        children: [
                          TextSpan(
                            text: 'cubox',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff136A5A),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Obx(
                      () => TextField(
                        keyboardType: TextInputType.number,
                        maxLength: 5,
                        onChanged: (String val) {
                          final v = int.tryParse(val);
                          if (v == null || val.length < 5) {
                            controller.numberInputValid.value = false;
                          } else {
                            controller.numberInputValid.value = true;
                          }
                        },
                        obscureText: controller.isPinAccess.value,
                        controller: controller.pinAccess,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        decoration: InputDecoration(
                          errorText: controller.numberInputValid.value
                              ? null
                              : 'Please enter 5 digits number',
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          prefixIcon:
                              Image.asset('assets/icons/cubox-accesskey.png'),
                          suffixIcon: IconButton(
                            onPressed: () => controller.isPinAccess.toggle(),
                            color: Color(0xff136A5A),
                            icon: Icon(
                              controller.isPinAccess.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                          hintText: 'Create new PIN',
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
            color: controller.numberInputValid.value
                ? const Color(0xff136A5A)
                : Color(0xffb5b5b5),
            child: InkWell(
              onTap: () async {
                if (controller.numberInputValid.value &&
                    controller.selectedSSID!.isNotEmpty) {
                  // final url = 'http://192.168.4.1/';
                  final url = 'http://192.168.4.1';

                  ///setting?groupid=-465154529&ssid=${controller.selectedSSID}&pass=${controller.passwordWifi.text}&address=-&pin=${controller.pinAccess.text}&key=cas';
                  if (await canLaunch(url)) {
                    await launch(url,
                            enableJavaScript: true, forceWebView: false)
                        .then(
                      (_) {
                        Get.offAllNamed(Routes.COMPLETE_REGISTER);
                      },
                    );
                  } else {
                    print('error..');
                  }
                } else {
                  null;
                }
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
