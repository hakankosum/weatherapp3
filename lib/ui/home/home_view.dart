import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:weatherapp/services/geocoding_service.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController cityName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.h,
        margin: EdgeInsets.only(right: 5.w, left: 5.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5.h),
              TextField(
                controller: cityName,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.location_history),
                  suffixIcon: InkWell(
                      onTap: () {
                        GeocdoingService(cityName.text);
                      },
                      child: Icon(Icons.search)),
                  hintText: 'Location',
                ),
              ),
              Container(
                padding: EdgeInsets.all(5.w),
                height: 25.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          Color(0xff00D0E2),
                          Colors.blue,
                          Colors.blue,
                          Colors.blue,
                        ])),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Tarih bilgileri"),
                        Spacer(),
                        Text("Saat")
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 10.h,
                          width: 10.h,
                          child: Icon(
                            WeatherIcons.day_sunny_overcast,
                            size: 44,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("18 C", style: TextStyle(fontSize: 24)),
                            Text(
                              "Durum",
                              style: TextStyle(fontSize: 32),
                            )
                          ],
                        )
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          "Güncelleme zamanı 15.00",
                          style: TextStyle(fontSize: 16),
                        ),
                        Icon(
                          Icons.refresh,
                          size: 16,
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                "Saatlik hava durumu",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 2.h,
              ),
              SizedBox(
                child: Container(
                  height: 15.h,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(right: 1.h),
                        height: 10.h,
                        width: 10.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.sunny),
                            Text("20 C"),
                            Text("16:00")
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              Text(
                "Günlük",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 10.h,
                padding: EdgeInsets.all(2.h),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/daily_background.png"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Container(
                        height: 5.h, width: 5.h, child: Icon(Icons.sunny)),
                    SizedBox(
                      width: 2.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text("Hava durumu tahmini"), Text("Öneri")],
                    )
                  ],
                ),
              ),
              Container(
                height: 60.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 2.h),
                      height: 10.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xffD2DFFF)),
                      child: Row(
                        children: [
                          SizedBox(width: 3.w),
                          CircleAvatar(
                            backgroundColor: Color(0xff9AB6FF),
                            radius: 20,
                            child: Container(
                                margin: EdgeInsets.only(bottom: 1.5.h),
                                child: Icon(
                                  WeatherIcons.day_sunny_overcast,
                                  color: Colors.black,
                                )),
                          ),
                          SizedBox(width: 5.w),
                          SizedBox(
                            height: 5.h,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [Text("Salı"), Text("Fırtına")],
                            ),
                          ),
                          Spacer(),
                          Text("20 C"),
                          SizedBox(
                            width: 3.w,
                          ),
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 16,
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
