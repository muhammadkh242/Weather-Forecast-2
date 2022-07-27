import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:weather/model/weather_response.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:weather/shared/utils.dart';

Widget buildHomeScreen(BuildContext context, WeatherResponse weatherResponse) {
  return ConditionalBuilder(
    condition: weatherResponse.timezoneOffset != null,
    builder: (context) => SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: (MediaQuery.of(context).size.height -
                      (AppBar().preferredSize.height) * 3) /
                  2,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                borderRadius: const BorderRadius.all(Radius.circular(25.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${weatherResponse.timezone}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                        const Expanded(
                          child: SizedBox(),
                        ),
                        const Text(
                          "27 July | 9:38",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Image(
                          width: 130.0,
                          height: 130.0,
                          image: AssetImage("assets/images/sun.png"),
                        ),
                        const Expanded(
                          child: SizedBox(),
                        ),
                        Text(
                          "${weatherResponse.current!.temp!.toInt().toString()}°",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 60.0),
                        ),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            const Image(
                              width: 26.0,
                              height: 26.0,
                              image: AssetImage("assets/images/barometer.png"),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              "${weatherResponse.current!.pressure.toString()} hpa",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.0),
                            ),
                            const SizedBox(
                              height: 4.0,
                            ),
                            const Text(
                              "Pressure",
                              style: TextStyle(
                                fontSize: 13.0,
                              ),
                            ),
                          ],
                        ),
                        const Expanded(
                          child: SizedBox(),
                        ),
                        Column(
                          children: [
                            const Image(
                              width: 26.0,
                              height: 26.0,
                              image: AssetImage("assets/images/wind.png"),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              "${weatherResponse.current!.windSpeed.toString()} km/h",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.0),
                            ),
                            const SizedBox(
                              height: 4.0,
                            ),
                            const Text(
                              "Wind",
                              style: TextStyle(
                                fontSize: 13.0,
                              ),
                            ),
                          ],
                        ),
                        const Expanded(
                          child: SizedBox(),
                        ),
                        Column(
                          children: [
                            const Image(
                              width: 26.0,
                              height: 26.0,
                              image: AssetImage("assets/images/humidity.png"),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              "${weatherResponse.current!.humidity.toString()} %",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.0),
                            ),
                            const SizedBox(
                              height: 4.0,
                            ),
                            const Text(
                              "Humidity",
                              style: TextStyle(
                                fontSize: 13.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.height -
                      (AppBar().preferredSize.height) * 3) /
                  5,
              child: ListView.separated(
                itemBuilder: (BuildContext context, index) {
                  return buildHourlyItem(weatherResponse.hourly![index]);
                },
                itemCount: weatherResponse.hourly!.length,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 10.0,
                  );
                },
                physics: const BouncingScrollPhysics(),
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  return buildDailyItem(weatherResponse.daily![index], context);
                },
                itemCount: weatherResponse.daily!.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 10.0,
                  );
                },
            )

          ],
        ),
      ),
    ),
    fallback: (context) => const Center(
      child: CircularProgressIndicator(),
    ),
  );
}

Widget buildHourlyItem(Hourly hourly) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(25.0)),
      color: Colors.white.withOpacity(0.4),
    ),
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Text(
            convertTime(hourly.dt!),
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16.0),
          ),
          const Expanded(child: SizedBox()),
          Image(
            width: 45.0,
            height: 45.0,
            image: AssetImage(getWeatherStateIcon(hourly.weather?[0].main ?? "")),
          ),
          const Expanded(child: SizedBox()),
          Text(
            hourly.temp!.toInt().toString(),
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16.0),
          ),
        ],
      ),
    ),
  );
}

Widget buildDailyItem(Daily daily, BuildContext context){
  
  return Container(
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(22.0)),
      color: Colors.white.withOpacity(0.4),
    ),

    child: Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 15.0,
      ),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width /8,

            child: Text(
              convertDay(daily.dt!),
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16.0),
            ),
          ),
          const Expanded(
            child: SizedBox(
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width /6,

            child: Image(
              width: 45.0,
              height: 45.0,
              image: AssetImage(getWeatherStateIcon(daily.weather?[0].description ?? ""))),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width /6,

            child: Text(
              "${daily.temp!.max!.toInt()} / ${daily.temp!.max!.toInt()}",
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16.0),
            ),
          ),
        ],
      ),
    ),
  );

}