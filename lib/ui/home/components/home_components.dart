import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:weather/model/weather_response.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:weather/ui/home/provider/home_provider.dart';
import 'package:weather/shared/utils.dart';
import 'package:intl/intl.dart';

Widget buildHomeScreen(BuildContext context, WeatherResponse weatherResponse,
    HomeProvider homeProvider) {
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
                        const Icon(Icons.location_on),
                        Expanded(
                          child: Text(
                            homeProvider.currentAddress,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.0),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        Text(
                          "${DateFormat('MMMMd').format(DateTime.now())} | ${DateFormat('Hm').format(DateTime.now())}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image(
                          width: 120.0,
                          height: 120.0,
                          image: AssetImage(getWeatherStateIcon(
                              state:
                                  weatherResponse.hourly![0].weather?[0].main ??
                                      "",
                              fromHour: true,
                              timeInMilliseconds:
                                  weatherResponse.hourly![0].dt!)),
                        ),
                        const Expanded(
                          child: SizedBox(),
                        ),
                        Text(
                          "${weatherResponse.current!.temp!.toInt().toString()} ${homeProvider.unitSymbol}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 50.0),
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
                              "${weatherResponse.current!.windSpeed.toString()} mph",
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
                  return buildHourlyItem(
                      weatherResponse.hourly![index], homeProvider);
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
                return buildDailyItem(
                    weatherResponse.daily![index], context, homeProvider);
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

Widget buildHourlyItem(Hourly hourly, HomeProvider provider) {
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
            width: 40.0,
            height: 40.0,
            image: AssetImage(getWeatherStateIcon(
                state: hourly.weather?[0].main ?? "",
                fromHour: true,
                timeInMilliseconds: hourly.dt!)),
          ),
          const Expanded(child: SizedBox()),
          Text(
            "${hourly.temp!.toInt().toString()} ${provider.unitSymbol}",
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16.0),
          ),
        ],
      ),
    ),
  );
}

Widget buildDailyItem(
    Daily daily, BuildContext context, HomeProvider provider) {
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
            width: MediaQuery.of(context).size.width / 8,
            child: Text(
              convertDay(daily.dt!),
              style:
                  const TextStyle(fontWeight: FontWeight.w400, fontSize: 16.0),
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          Image(
              width: 45.0,
              height: 45.0,
              image: AssetImage(getWeatherStateIcon(
                  state: daily.weather?[0].description ?? "",
                  fromHour: false,
                  timeInMilliseconds: daily.dt!))),
          const Expanded(
            child: SizedBox(),
          ),
          Text(
            "${daily.temp!.max!.toInt()} / ${daily.temp!.min!.toInt()} ${provider.unitSymbol}",
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16.0),
          ),
        ],
      ),
    ),
  );
}
