// import 'package:cubox/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../../profile/views/profile_view.dart';

class HomeView extends GetView<HomeController> {
  final TextEditingController _noResiTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // int _selectedIndex = 0; //New
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(onPressed: () {}, icon: Icon(Icons.logout_sharp),),
      //   centerTitle: true,
      // ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          selectedItemColor: Color(0xff136A5A),
          currentIndex: controller.selectedIndex.value,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
                // color: Color(0xff136A5A),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 30,
              ),
              label: 'Profile',
            ),
          ],
          onTap: (index) {
            controller.change(index);
          },
        ),
      ),
      body: SafeArea(
        child: Obx(
          () => IndexedStack(
            index: controller.selectedIndex.value,
            children: [
              SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 75),
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(125),
                          bottomRight: Radius.circular(125),
                        ),
                        // border: Border(
                        //   top: BorderSide.none,
                        //   bottom: BorderSide(
                        //       color: Color(0xff136A5A),
                        //       width: 3,
                        //       style: BorderStyle.solid),
                        // ),
                        color: Color(0xff7BD2C3),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Positioned(
                            // left: 12,
                            // top: 24,
                            child: GestureDetector(
                              onTap: () => Get.back(),
                              child: Image.asset('assets/icons/logout.png'),
                            ),
                          ),
                          Positioned(
                            // left: 112,
                            // top: 24,
                            child: GestureDetector(
                              onTap: () {},
                              child: Image.asset('assets/icons/cubox-icon.png'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 75,
                        left: 15,
                        right: 15,
                      ),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'A1234',
                              style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 70),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Add New Resi',
                                  style: TextStyle(
                                      color: Color(0xff136A5A),
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 300,
                                      child: TextField(
                                        controller: _noResiTextController,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff5C5C5C)),
                                        decoration: InputDecoration(
                                          hintText: 'No. Resi',
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
                                          contentPadding: const EdgeInsets.only(
                                              left: 10,
                                              bottom: 0,
                                              top: 0,
                                              right: 0),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        controller.onDelivery
                                            .add(_noResiTextController.text);
                                        _noResiTextController.text = '';
                                      },
                                      padding: EdgeInsets.zero,
                                      icon: Icon(
                                        Icons.add_box_outlined,
                                        size: 45,
                                        color: Color(0xff136A5A),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                //Tab Controller
                                DefaultTabController(
                                  length: 3, // length of tabs
                                  initialIndex: 0,
                                  child: Column(
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        child: TabBar(
                                          indicatorColor: Color(0xff136A5A),
                                          labelColor: Color(0xff136A5A),
                                          unselectedLabelColor:
                                              Color(0xff868788),
                                          tabs: [
                                            Tab(text: 'All Status'),
                                            Tab(text: 'On Delivery'),
                                            Tab(text: 'Received'),
                                          ],
                                        ),
                                      ),
                                      // SizedBox(height: 10),

                                      //TabBarView
                                      Container(
                                        padding: EdgeInsets.only(
                                            top: 20, bottom: 50),
                                        height: size.height *
                                            .5, //height of TabBarView
                                        decoration: BoxDecoration(
                                            border: Border(
                                                top: BorderSide(
                                                    color: Colors.grey,
                                                    width: 0.5))),
                                        child: Obx(
                                          () => TabBarView(
                                            children: <Widget>[
                                              // ALL STATUS - VIEW
                                              controller.onDelivery.isEmpty &
                                                      controller
                                                          .received.isEmpty
                                                  ? Text(
                                                      'No data',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          // fontSize: 18,
                                                          ),
                                                    )
                                                  : Container(
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          children: [
                                                            Column(
                                                              //All Status - received
                                                              children:
                                                                  controller
                                                                      .received
                                                                      .reversed
                                                                      .map(
                                                                (data) {
                                                                  return Column(
                                                                    children: [
                                                                      Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.all(
                                                                            Radius.circular(10),
                                                                          ),
                                                                          color:
                                                                              Color(0xffF1FDFB),
                                                                        ),
                                                                        child:
                                                                            ListTile(
                                                                          title:
                                                                              Text("${data['number']}"),
                                                                          subtitle:
                                                                              Text("${data['date']}"),
                                                                          trailing:
                                                                              GestureDetector(
                                                                            onLongPress: () =>
                                                                                controller.received.remove(data),
                                                                            child:
                                                                                Container(
                                                                              padding: EdgeInsets.all(10),
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0xff2F924B),
                                                                                borderRadius: BorderRadius.all(
                                                                                  Radius.circular(10),
                                                                                ),
                                                                              ),
                                                                              height: 40,
                                                                              child: Text(
                                                                                'Received',
                                                                                style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            10,
                                                                      )
                                                                    ],
                                                                  );
                                                                },
                                                              ).toList(),
                                                            ),
                                                            //All Status - ONDELIVERY
                                                            Column(
                                                              children:
                                                                  controller
                                                                      .onDelivery
                                                                      .reversed
                                                                      .map(
                                                                (data) {
                                                                  return SingleChildScrollView(
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.all(
                                                                              Radius.circular(10),
                                                                            ),
                                                                            color:
                                                                                Color(0xffF1FDFB),
                                                                          ),
                                                                          child:
                                                                              ListTile(
                                                                            title:
                                                                                Text(data),
                                                                            trailing:
                                                                                GestureDetector(
                                                                              onLongPress: () {
                                                                                controller.received.add({
                                                                                  'number': '$data',
                                                                                  'date': '5/5/2022'
                                                                                });
                                                                                controller.onDelivery.remove(data);
                                                                              },
                                                                              child: Container(
                                                                                padding: EdgeInsets.all(10),
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0xffF97B06),
                                                                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                                                                ),
                                                                                height: 40,
                                                                                child: Text(
                                                                                  'On Delivery',
                                                                                  style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              10,
                                                                        )
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              ).toList(),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                              // ONDELIVERY VIEW
                                              controller.onDelivery.isEmpty
                                                  ? Text(
                                                      'No data',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          // fontSize: 18,
                                                          ),
                                                    )
                                                  : Container(
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          children: controller
                                                              .onDelivery
                                                              .reversed
                                                              .map(
                                                            (data) {
                                                              return Column(
                                                                children: [
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .all(
                                                                        Radius.circular(
                                                                            10),
                                                                      ),
                                                                      color: Color(
                                                                          0xffF1FDFB),
                                                                    ),
                                                                    child:
                                                                        ListTile(
                                                                      title: Text(
                                                                          data),
                                                                      trailing:
                                                                          GestureDetector(
                                                                        onLongPress: () => controller
                                                                            .onDelivery
                                                                            .remove(data),
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              40,
                                                                          padding:
                                                                              EdgeInsets.all(10),
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xffF97B06),
                                                                            borderRadius:
                                                                                BorderRadius.all(Radius.circular(10)),
                                                                          ),
                                                                          child:
                                                                              Text(
                                                                            'On Delivery',
                                                                            style: TextStyle(
                                                                                color: Colors.white,
                                                                                fontSize: 15,
                                                                                fontWeight: FontWeight.w500),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  )
                                                                ],
                                                              );
                                                            },
                                                          ).toList(),
                                                        ),
                                                      ),
                                                    ),
                                              controller.received.isEmpty
                                                  ? Text(
                                                      'No data',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          // fontSize: 18,
                                                          ),
                                                    )
                                                  :
                                                  //RECEIVED VIEW
                                                  Container(
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          children: controller
                                                              .received.reversed
                                                              .map(
                                                            (data) {
                                                              return Column(
                                                                children: [
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .all(
                                                                        Radius.circular(
                                                                            10),
                                                                      ),
                                                                      color: Color(
                                                                          0xffF1FDFB),
                                                                    ),
                                                                    child:
                                                                        ListTile(
                                                                      title: Text(
                                                                          "${data['number']}"),
                                                                      subtitle:
                                                                          Text(
                                                                              "${data['date']}"),
                                                                      trailing:
                                                                          GestureDetector(
                                                                        onLongPress: () => controller
                                                                            .received
                                                                            .remove(data),
                                                                        child:
                                                                            Container(
                                                                          padding:
                                                                              EdgeInsets.all(10),
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xff2F924B),
                                                                            borderRadius:
                                                                                BorderRadius.all(
                                                                              Radius.circular(10),
                                                                            ),
                                                                          ),
                                                                          height:
                                                                              40,
                                                                          child:
                                                                              Text(
                                                                            'Received',
                                                                            style: TextStyle(
                                                                                color: Colors.white,
                                                                                fontSize: 15,
                                                                                fontWeight: FontWeight.w500),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  )
                                                                ],
                                                              );
                                                            },
                                                          ).toList(),
                                                        ),
                                                      ),
                                                    ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),

              // PROFILE
              ProfileView(),
            ],
          ),
        ),
      ),
    );
  }
}
