import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app_flutter/constants/app_constants.dart';
import 'package:weather_app_flutter/models/weather_info.dart';
import 'package:weather_app_flutter/services/weather_api_service.dart';
import 'package:weather_app_flutter/widgets/slider_indicator_dot.dart';
import '../widgets/weather_dashboard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(""),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 30,
              color: Colors.white,
            )),
        actions: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: SvgPicture.asset(
              'assets/menu.svg',
              height: 30,
              width: 30,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: const WeatherPageView(),
    );
  }
}

class WeatherPageView extends StatefulWidget {
  const WeatherPageView({Key? key}) : super(key: key);
  @override
  State<WeatherPageView> createState() => _WeatherPageViewState();
}

class _WeatherPageViewState extends State<WeatherPageView> {
  int _currentPage = 0;
  final _pageController = PageController(initialPage: 0);

  _onPageChanged(int position) {
    setState(() {
      _currentPage = position;
    });
  }

  Future<List<WeatherInfo>>? futureWeatherInfoList;

  @override
  void initState() {
    super.initState();

    //API call
    futureWeatherInfoList = WeatherApiService().getWeatherInfoList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<WeatherInfo>>(
      future: futureWeatherInfoList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var weatherInfoList = snapshot.data!;
          return Stack(
            children: [
              Image.network(
                AppConstants.weatherApiBaseUrl +
                    weatherInfoList[_currentPage].bgUrl,
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
              Container(decoration: const BoxDecoration(color: Colors.black38)),
              PageView.builder(
                controller: _pageController,
                itemBuilder: (context, index) {
                  return WeatherDashboard(weatherInfoList[index]);
                },
                itemCount: weatherInfoList.length,
                onPageChanged: _onPageChanged,
              ),
              Container(
                margin: const EdgeInsets.only(top: 140, left: 15),
                child: Row(
                  children: [
                    for (int i = 0; i < weatherInfoList.length; i++)
                      if (i == _currentPage)
                        const SliderIndicatorDot(true)
                      else
                        const SliderIndicatorDot(false)
                  ],
                ),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Something went wrong"),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
