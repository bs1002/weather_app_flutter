import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app_flutter/widgets/slider_indicator_dot.dart';
import '../models/weather_location.dart';
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

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          locationList[_currentPage].bgUrl,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        Container(decoration: const BoxDecoration(color: Colors.black38)),
        PageView.builder(
          controller: _pageController,
          itemBuilder: (context, position) {
            return WeatherDashboard(position);
          },
          itemCount: locationList.length,
          onPageChanged: _onPageChanged,
        ),
        Container(
          margin: const EdgeInsets.only(top: 140, left: 15),
          child: Row(
            children: [
              for (int i = 0; i < locationList.length; i++)
                if (i == _currentPage)
                  const SliderIndicatorDot(true)
                else
                  const SliderIndicatorDot(false)
            ],
          ),
        ),
      ],
    );
  }
}
