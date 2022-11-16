import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:weatherapp/provider/weather_provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController cityName = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //CurrentWeatherService("Kocaeli");
  }

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
                  suffixIcon: Consumer(
                    builder: (BuildContext context, WeatherProvider data,
                        Widget? child) {
                      return InkWell(
                          onTap: () {
                            data.getCurrentWeather(cityName.text);
                            data.getForecastWeather(cityName.text);
                            data.getDailyWeather(cityName.text);
                            data.refreshDate();
                            data.lastRefresh();

                            ;
                          },
                          child: Icon(Icons.search));
                    },
                  ),
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
                    Consumer(
                      builder: (BuildContext context, WeatherProvider data,
                          Widget? child) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(data.dayMonthYear),
                            const Spacer(),
                            Text(data.hourMin),
                          ],
                        );
                      },
                    ),
                    Row(
                      children: [
                        Consumer(
                          builder: (BuildContext context, WeatherProvider data,
                              widget) {
                            if (data.isCurrentLoaded == true) {
                              return Container(
                                height: 10.h,
                                width: 10.h,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "http://openweathermap.org/img/wn/" +
                                                data.currentWeather!.weather![0]
                                                    .icon! +
                                                "@2x.png"))),
                              );
                            } else {
                              return Text("");
                            }
                          },
                        ),
                        Consumer(
                          builder: (BuildContext context, WeatherProvider data,
                              Widget? child) {
                            if (data.currentWeather == null) {
                              return Text("data");
                            } else {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      data.currentWeather!.main!.temp!
                                          .toStringAsFixed(2),
                                      style: TextStyle(fontSize: 24)),
                                  Text(
                                    data.isCurrentLoaded
                                        ? data.currentWeather!.weather![0]
                                            .description!
                                            .toUpperCase()
                                        : "",
                                    style: TextStyle(fontSize: 16),
                                  )
                                ],
                              );
                            }
                          },
                        )
                      ],
                    ),
                    Spacer(),
                    Consumer(
                      builder: (BuildContext context, WeatherProvider data,
                          Widget? child) {
                        return Row(
                          children: [
                            Text(
                              "Güncelleme zamanı ",
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              data.lastUpdate == null ? "" : data.lastUpdate!,
                              style: TextStyle(fontSize: 16),
                            ),
                            Icon(
                              Icons.refresh,
                              size: 16,
                            )
                          ],
                        );
                      },
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
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(right: 1.h),
                        height: 10.h,
                        width: 10.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: Consumer(
                          builder: (BuildContext context, WeatherProvider data,
                              widget) {
                            return data.isForecastLoaded == false
                                ? CircularProgressIndicator(
                                    color: Colors.black,
                                  )
                                : Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: 5.h,
                                        width: 5.h,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    "http://openweathermap.org/img/wn/" +
                                                        data
                                                            .forecastWeather!
                                                            .liste![index]
                                                            .weather![0]
                                                            .icon! +
                                                        "@2x.png"))),
                                      ),
                                      Text(data.forecastWeather!.liste![index]
                                          .main!.temp!
                                          .toStringAsFixed(2)),
                                      Text(data
                                          .forecastWeather!.liste![index].dtTxt
                                          .toString()
                                          .substring(10, 16))
                                    ],
                                  );
                          },
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
              Consumer(
                builder: (BuildContext context, WeatherProvider value,
                    Widget? child) {
                   return value.isDailyLoaded==true
                      ? SizedBox(
                          height: 60.h,
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: value.dailyWeather!.dataList!.length,
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
                                          margin:
                                              EdgeInsets.only(bottom: 1.5.h),
                                          decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("http://openweathermap.org/img/wn/" +
                                                        value.dailyWeather!.dataList![index].weather![0].icon!+
                                                        "@2x.png"))),
                                    )),
                                    SizedBox(width: 5.w),
                                    SizedBox(
                                      height: 5.h,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(value.weekDays[(DateTime.now().weekday+index-1)%7]),
                                          Text("Fırtına")
                                        ],
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
                      : Text("data");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
