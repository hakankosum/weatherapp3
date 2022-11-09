import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:weather_icons/weather_icons.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({super.key});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(right: 5.w, left: 5.w),
          height: 40.h,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xff4F80FA),
            Color(0xff3764D7),
            Color(0xff335FD1)
          ])),
          child: Column(
            children: [
              SizedBox(height: 5.h),
              Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ),
                  Spacer(),
                  Text("Location",
                      style: TextStyle(color: Colors.white, fontSize: 14)),
                  Spacer(),
                  Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                  )
                ],
              ),
              SizedBox(height: 3.h),
              Text(
                "tarih-saat",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 3.h),
              Icon(
                WeatherIcons.day_sunny_overcast,
                color: Colors.white,
              ),
              SizedBox(height: 3.h),
              Text(
                "18 C",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 1.h),
              Text(
                "Durum",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 3.h),
              Container(
                width: 40.w,
                child: Row(
                  children: [
                    Text(
                      "Güncelleme zamanı",
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.refresh,
                      color: Colors.white,
                      size: 14,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 3.h,
        ),
        Container(
          padding: EdgeInsets.only(right: 5.w, left: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  child: Text(
                "Saatlik",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
              SizedBox(
                height: 1.h,
              ),
              SizedBox(
                height: 12.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 1.w),
                      width: 20.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(WeatherIcons.day_sunny_overcast),
                          Text("20 C"),
                          Text("15:00")
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                "Detay bilgiler",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                height: 10.h,
                margin: EdgeInsets.only(left: 5.w),
                child: Row(children: [
                  SizedBox(
                    height: 8.h,
                    width: 8.h,
                    child: Stack(
                      children: [
                        Center(
                            child: Text(
                          "12",
                          style: TextStyle(color: Colors.green, fontSize: 24),
                        )),
                        Center(
                          child: SizedBox(
                            height: 8.h,
                            width: 8.h,
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.grey.withOpacity(.5),
                              color: Colors.green[600],
                              value: .12,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 5.w,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("AQ - çok iyi",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14)),
                        Text("asdasdasdasjdkajdaksasdasdasdadjasdasdasdasjdkajdaksasdasdasdadj")
                  
                      ],
                    ),
                  )
                ]),
              ),
              
            ],
          ),
        ),
      ],
    );
  }
}
