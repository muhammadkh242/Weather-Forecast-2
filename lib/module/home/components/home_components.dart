import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:weather/model/weather_response.dart';
import 'package:conditional_builder/conditional_builder.dart';

Widget buildHomeScreen(BuildContext context, WeatherResponse weatherResponse) {
  return ConditionalBuilder(
    condition: weatherResponse.timezoneOffset != null,
    builder: (context) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: (MediaQuery.of(context).size.height -
                    (AppBar().preferredSize.height) * 3) /
                2,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
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
          const SizedBox(height: 40.0,),
          SizedBox(
            height: (MediaQuery.of(context).size.height -
                    (AppBar().preferredSize.height) * 3) /
                5,
            child: ListView.separated(
              itemBuilder: (BuildContext context, index) {
                return buildHourlyItem();
              },
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (BuildContext context, int index) { return const SizedBox(width: 10.0,); },
              physics: const BouncingScrollPhysics(),
            ),
          )
        ],
      ),
    ),
    fallback: (context) => const Center(
      child: CircularProgressIndicator(),
    ),
  );
}

Widget buildHourlyItem() {
  return Container(
    height: double.infinity,
    width: 60.0,
    color: Colors.grey,
  );
}
