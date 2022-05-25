import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:weather_app_flutter/app/core/constants/app_constants.dart';
import 'package:weather_app_flutter/app/modules/home/controllers/page_view_controller.dart';
import 'package:weather_app_flutter/app/modules/home/controllers/weather_controller.dart';
import 'package:weather_app_flutter/app/modules/home/models/weather_state.dart';
import 'package:weather_app_flutter/app/modules/home/widgets/slider_indicator_dot.dart';
import 'package:weather_app_flutter/app/modules/home/widgets/weather_dashboard.dart';

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
      body: Container(
        color: AppConstants.brandColor,
        child: WeatherPageView(),
      ),
    );
  }
}

class WeatherPageView extends StatelessWidget {
  WeatherPageView({Key? key}) : super(key: key);

  final pageController = Get.put(PageViewController());
  final weatherController = Get.put(WeatherController());

  @override
  Widget build(BuildContext context) {
    return GetX<WeatherController>(builder: (controller) {
      var state = controller.weatherState.value;
      if (state is WeatherLoading) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        );
      }
      if (state is WeatherLoaded) {
        final weatherInfoList = state.weatherInfoList;
        return GetX<PageViewController>(builder: ((controller) {
          var _currentPage = controller.currentPage.value;

          _onPageChanged(int position) {
            controller.onPageChanged(position);
          }

          return Stack(
            children: [
              Image.network(
                AppConstants.weatherApiBaseUrl +
                    weatherInfoList[_currentPage].bgUrl,
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
              Container(color: Colors.black38),
              PageView.builder(
                controller: PageController(initialPage: 0),
                itemBuilder: (context, index) {
                  return WeatherDashboard(weatherInfoList[index]);
                },
                itemCount: weatherInfoList.length,
                onPageChanged: _onPageChanged,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 140, left: 15),
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
        }));
      } else if (state is WeatherLoadFailed) {
        return Center(
          child: Text(
            "${state.error}",
            style: const TextStyle(color: Colors.white),
          ),
        );
      } else {
        return Container();
      }
    });
  }
}