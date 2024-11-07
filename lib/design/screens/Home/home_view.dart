import 'dart:math';
import 'package:expense_fusion/core/routes/app_pages.dart';
import 'package:expense_fusion/design/components/c_text.dart';
import 'package:expense_fusion/utils/extensions.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text_theme.dart';
import '../../../utils/constants.dart';
import '../../../utils/select_image.dart';
import '../../components/app_drawer.dart';
import '../../components/c_app_bar.dart';
import '../../components/shimmer_placeholder.dart';
import 'home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            drawer: AppDrawer(),
            appBar: CAppBar(
              showtrailing: true,
              title: 'insight',
              leading: Builder(
                builder: (context) {
                  return selectIcon(
                    AppIcon.userLogo,
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  );
                }, 
              ),
            ),
            backgroundColor: bg,
            body: Stack(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: defaultScrollablePhysics,
                  child: Column(
                    children: AnimationConfiguration.toStaggeredList(
                      duration: Duration(seconds: 2),
                      childAnimationBuilder: (widget) =>
                          SlideAnimation(child: FadeInAnimation(child: widget)),
                      children: [
                        const SizedBox(
                          height: 1,
                        ),
                        Center(
                          child: controller.isLoading
                              ? TextPlaceholder(
                                  width: 94,
                                  height: 19,
                                ).showShimmer()
                              : CText(
                                  'Total Amount',
                                  style: TextThemeX.text16
                                      .copyWith(fontWeight: FontWeight.w500),
                                ).showShimmer(),
                        ),
                        Center(
                          child: controller.isLoading
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextPlaceholder(
                                    width: 164,
                                    height: 38,
                                  ).showShimmer(),
                                )
                              : CText(
                                  '₹25,520.00',
                                  style: TextThemeX.text20.copyWith(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 32),
                                ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        controller.isLoading
                            ? Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16, right: 6),
                                      child: ContainerPlaceholder(
                                        height: 208,
                                        borderRadius: 16,
                                        width: 172,
                                      ).showShimmer(),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 6, right: 16),
                                      child: ContainerPlaceholder(
                                        height: 208,
                                        borderRadius: 16,
                                        width: 172,
                                      ).showShimmer(),
                                    ),
                                  ),
                                ],
                              )
                            : _buildincomeexpensecards(),
                        SizedBox(
                          height: 20,
                        ),
                        _buildChartInfoDropdown(context, controller),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: _buildbuttons(controller),
                )
              ],
            ),
          );
        });
  }
}

Widget _buildincomeexpensecards() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Expanded(
          child: _BuildCard(
              title: 'Income',
              color: Secondarycolor,
              currentmonth: '₹10,75,520',
              lastmonth: '₹8,58,520',
              icon: AppIcon.arrowDown,
              left: 16,
              right: 6,
              bgcolor: Colors.transparent)),
      Expanded(
          child: _BuildCard(
        title: 'Expense',
        color: LightPrimarycolor,
        currentmonth: '₹10,25,654',
        lastmonth: '₹6,25,562',
        icon: AppIcon.arrowUp,
        left: 6,
        right: 16,
        bgcolor: primaryblack,
      ))
    ],
  );
}

Widget _BuildCard({
  required String title,
  required Color color,
  required String currentmonth,
  required double left,
  required double right,
  required Color bgcolor,
  required String icon,
  required String lastmonth, // Add isLoading parameter
}) {
  return Container(
    height: 208,
    width: 172,
    margin: EdgeInsets.only(left: left, right: right),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: bgcolor,
      border: Border.all(color: color),
    ),
    child: Column(
      children: [
        Container(
          height: 48,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16),
              topLeft: Radius.circular(16),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              selectIcon(icon),
              CText(
                title,
                style: TextThemeX.text18,
              ),
            ],
          ),
        ),
        Center(
          child: Container(
            padding: EdgeInsets.only(top: 16, left: 16, right: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  // Add padding here
                  padding: const EdgeInsets.only(
                      bottom: 4.0), // Space between shimmer and text
                  child: CText(
                    'Current month',
                    style: TextThemeX.text16,
                  ).showShimmer(),
                ),
                CText(
                  currentmonth,
                  style: TextThemeX.text20,
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  // Add padding here
                  padding: const EdgeInsets.only(
                      bottom: 4.0), // Space between shimmer and text
                  child: CText(
                    'Last month',
                    style: TextThemeX.text16,
                  ).showShimmer(),
                ),
                CText(
                  lastmonth,
                  style: TextThemeX.text20,
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildChartInfoDropdown(
    BuildContext context, HomeController controller) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
        color: primaryblack,
        border: Border(top: BorderSide(style: BorderStyle.solid, color: grey1)),
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(24), topLeft: Radius.circular(24))),
    child: Column(
      children: [
        controller.isLoading
            ? Padding(
                padding: const EdgeInsets.all(16),
                child: ContainerPlaceholder(
                  height: 48,
                  borderRadius: 16,
                ).showShimmer(),
              )
            : Container(
                margin: EdgeInsets.all(16),
                height: 48,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: grey1)),
                child: Row(
                  children: [
                    _builddropdown1(
                        text: '',
                        boarder: Border(right: BorderSide(color: grey1))),
                    _builddropdown2(text: ''),
                  ],
                ),
              ),
        controller.isLoading
            ? ContainerPlaceholder(
                height: 39,
                width: 189,
                borderRadius: 24,
                padding: EdgeInsets.only(top: 10),
              ).showShimmer()
            : Container(
                height: 39,
                width: 189,
                decoration: BoxDecoration(
                    color: secondaryblack,
                    borderRadius: BorderRadius.circular(24)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CText(
                      '₹22,556',
                      style: TextThemeX.text16.copyWith(color: Secondarycolor),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    CText(
                      '|',
                      style: TextThemeX.text16.copyWith(color: grey1),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    CText(
                      '₹16,425',
                      style:
                          TextThemeX.text16.copyWith(color: LightPrimarycolor),
                    )
                  ],
                ),
              ),
        _buildchart(controller),
        _buildList(controller),
      ],
    ),
  );
}

Widget _buildchart(HomeController controller) {
  final List<FlSpot> dummyData1 = List.generate(8, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });

  // This will be used to draw the orange line
  final List<FlSpot> dummyData2 = List.generate(8, (index) {
    return FlSpot(index.toDouble(), index * Random().nextDouble());
  });
  return controller.isLoading
      ? Padding(
          padding: const EdgeInsets.all(10),
          child: ContainerPlaceholder(
            height: 208,
            borderRadius: 16,
          ).showShimmer(),
        )
      : Container(
          height: 208,
          width: double.infinity,
          child: LineChart(LineChartData(
              gridData: FlGridData(show: false),
              titlesData: FlTitlesData(
                  leftTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      switch (value.toInt()) {
                        case 1:
                          return CText(
                            'Week 1',
                            style: TextThemeX.text16.copyWith(fontSize: 14),
                          );
                        case 2:
                          return CText(
                            'Week 2',
                            style: TextThemeX.text16.copyWith(fontSize: 14),
                          );
                        case 3:
                          return CText(
                            'Week 3',
                            style: TextThemeX.text16.copyWith(fontSize: 14),
                          );
                        case 4:
                          return CText(
                            'Week 4',
                            style: TextThemeX.text16.copyWith(fontSize: 14),
                          );
                        case 5:
                          return CText(
                            'Week 5',
                            style: TextThemeX.text16.copyWith(fontSize: 14),
                          );
                        default:
                          return Text('');
                      }
                    },
                  ))),
              borderData: FlBorderData(show: false),
              lineBarsData: [
                LineChartBarData(
                  preventCurveOverShooting: true,
                  spots: dummyData1,
                  belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: [firstchartcolor, Colors.transparent],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )),
                  dotData: FlDotData(
                    show: false,
                  ),
                  isCurved: true,
                  barWidth: 2,
                  color: firstchartcolor,
                ),
                LineChartBarData(
                  spots: dummyData2,
                  belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: [lightprimarygrad, Colors.transparent],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )),
                  dotData: FlDotData(show: false),
                  isCurved: true,
                  barWidth: 2,
                  color: LightPrimarycolor,
                ),
              ])));
}

Widget _buildList(HomeController controller) {
  return Container(
    height: 419,
    width: double.infinity,
    margin: EdgeInsets.only(left: 16, right: 16, top: 16),
    decoration: BoxDecoration(
        border: Border(
            top: BorderSide(
      style: BorderStyle.solid,
      color: Primarycolor,
    ))),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.all(2),
            height: 39,
            width: double.infinity,
            child:controller.isLoading
                ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextPlaceholder(
                width: 157,
                height: 23,
              ).showShimmer(),
            )
                :  CText(
              'Account Overview',
              style: TextThemeX.text20.copyWith(fontWeight: FontWeight.w400),
            )),
        Expanded(
          child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      border: Border.symmetric(
                          vertical: BorderSide.none,
                          horizontal: BorderSide(color: bg))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      controller.isLoading
                          ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextPlaceholder(
                          width: 78,
                          height: 14,
                        ).showShimmer(),
                      )
                          :  CText(
                        'Office Expense',
                        style: TextThemeX.text16
                            .copyWith(color: Primarycolor, fontSize: 12),
                      ),
                      ListTile(
                        title:controller.isLoading
                            ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextPlaceholder(
                            width: 79,
                            height: 19,
                          ).showShimmer(),
                        )
                            :  CText(
                          'HDFC Bank',
                          style: TextThemeX.text16.copyWith(color: white),
                        ),
                        trailing:controller.isLoading
                            ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextPlaceholder(
                            width: 78,
                            height: 19,
                          ).showShimmer(),
                        )
                            :
                        CText(
                          '₹10,25,645',
                          style: TextThemeX.text16.copyWith(
                              color: Primarycolor, fontWeight: FontWeight.w600),
                        ),
                      ),
                      ListTile(
                        title: controller.isLoading
                            ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextPlaceholder(
                            width: 79,
                            height: 19,
                          ).showShimmer(),
                        )
                            :CText(
                          'Cash',
                          style: TextThemeX.text16.copyWith(color: white),
                        ),
                        trailing: controller.isLoading
                            ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextPlaceholder(
                            width: 78,
                            height: 19,
                          ).showShimmer(),
                        )
                            :CText(
                          '₹4,32,322',
                          style: TextThemeX.text16.copyWith(
                              color: Primarycolor, fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                );
              }),
        )
      ],
    ),
  );
}

Widget _buildbuttons(HomeController controller) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Expanded(
        child: Container(
          margin: EdgeInsets.all(5),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Secondarycolor, fixedSize: Size(150, 52)),
              onPressed: () {
                Get.toNamed(Routes.INCOME);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  selectIcon(AppIcon.add, width: 14),
                  SizedBox(
                    width: 5,
                  ),
                  CText(
                    'Income',
                    style: TextThemeX.text18
                        .copyWith(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ],
              )),
        ),
      ),
      selectIcon(AppIcon.transactionLogo),
      Expanded(
        child: Container(
          margin: EdgeInsets.all(5),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: LightPrimarycolor, fixedSize: Size(150, 52)),
              onPressed: () {
                Get.toNamed(Routes.Expense);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  selectIcon(AppIcon.add, width: 14),
                  SizedBox(
                    width: 5,
                  ),
                  CText(
                    'Expense',
                    style: TextThemeX.text18
                        .copyWith(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ],
              )),
        ),
      )
    ],
  );
}

Widget _builddropdown1({required String text, Border? boarder}) {
  return Expanded(
    child: Container(
      decoration: BoxDecoration(border: boarder),
      child: Center(
        child: DropdownButton<String>(
            value: 'Home Expenses',
            dropdownColor: primaryblack,
            icon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: selectIcon(AppIcon.dropDown, width: 24),
            ),
            items: <String>['Home Expenses', 'Other'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(color: white),
                ),
              );
            }).toList(),
            onChanged: (_) {},
            underline: SizedBox.shrink()),
      ),
    ),
  );
}

Widget _builddropdown2({required String text, Border? boarder}) {
  return Expanded(
    child: Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(border: boarder),
      child: Center(
        child: DropdownButton<String>(
            value: 'Current Month',
            dropdownColor: primaryblack,
            icon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: selectIcon(AppIcon.dropDown, width: 24),
            ),
            items: <String>['Current Month', 'Other'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(color: white),
                ),
              );
            }).toList(),
            onChanged: (_) {},
            underline: SizedBox.shrink()),
      ),
    ),
  );
}
