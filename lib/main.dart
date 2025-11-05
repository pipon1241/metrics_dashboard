import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Metrics Dashboard',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Dashboard(),
    );
  }
}

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<double> dailyUsageData = [];
  List<String> dailyUsageLabels = [];
  List<double> weeklyUsageData = [];
  List<String> categoryLabels = [];
  List<double> categoryData = [];

  @override
  void initState() {
    super.initState();
    fetchMetricsData();
  }

  Future<void> fetchMetricsData() async {
    await fetchDailyUsageMetrics();
    await fetchWeeklyUsageData();
    await fetchCategoryData();
  }

  Future<void> fetchDailyUsageMetrics() async {
    final response = await http.get(
      Uri.parse(
        'https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/ZA40HNE2G0l7ZUgnq5VO4Q/dataoveraweek.json',
      ),
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      setState(() {
        dailyUsageData = List<double>.from(
          (data['values'] as List)
              .map((e) => (e['value'] as num?)?.toDouble() ?? 0.0)
              .where((value) => value.isFinite),
        );
        dailyUsageLabels = List<String>.from(data['labels'] ?? []);

        // Fallback if data is empty
        if (dailyUsageData.isEmpty) {
          dailyUsageData = [0];
          dailyUsageLabels = ['No Data'];
        }
      });
    } else {
      throw Exception('Failed to load daily usage data');
    }
  }

  Future<void> fetchWeeklyUsageData() async {
    final response = await http.get(
      Uri.parse(
        'https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/4vOv2DroCvrpvIqvHjRq3w/weeklydata.json',
      ),
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      setState(() {
        weeklyUsageData = List<double>.from(
          (data['datasets'][0]['data'] as List)
              .map((e) => (e as num?)?.toDouble() ?? 0.0)
              .where((value) => value.isFinite),
        );

        // Fallback if data is empty
        if (weeklyUsageData.isEmpty) {
          weeklyUsageData = [0];
        }
      });
    } else {
      throw Exception('Failed to load weekly usage data');
    }
  }

  Future<void> fetchCategoryData() async {
    final response = await http.get(
      Uri.parse(
        'https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/Q4E2g7pKaK__9XII3C1GEQ/socialmedia.json',
      ),
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      setState(() {
        // Extract category labels from the 'name' field
        categoryLabels = List<String>.from(
          data.map((item) => item['name'] as String? ?? 'Unknown'),
        );

        // Extract category data from the 'population' field
        categoryData = List<double>.from(
          data.map((item) => (item['population'] as num?)?.toDouble() ?? 0.0),
        );

        // Fallback if data is empty
        if (categoryData.isEmpty) {
          categoryData = [0];
          categoryLabels = ["No Data"];
        }
      });
    } else {
      throw Exception('Failed to load category data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Metrics Dashboard')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('Daily App Usage', style: TextStyle(fontSize: 18)),
              SizedBox(
                height: 300,
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: true),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 22,
                          getTitlesWidget: (value, meta) {
                            int index = value.toInt();
                            if (index < 0 || index >= dailyUsageLabels.length) {
                              return Text('');
                            }
                            return Text(dailyUsageLabels[index]);
                          },
                        ),
                      ),
                    ),
                    borderData: FlBorderData(show: true),
                    lineBarsData: [
                      LineChartBarData(
                        spots: dailyUsageData
                            .asMap()
                            .entries
                            .map((e) => FlSpot(e.key.toDouble(), e.value))
                            .toList(),
                        isCurved: true,
                        color: Colors.blue,
                        belowBarData: BarAreaData(show: true),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text('Weekly App Usage', style: TextStyle(fontSize: 18)),
              SizedBox(
                height: 300,
                child: BarChart(
                  BarChartData(
                    barGroups: weeklyUsageData.asMap().entries.map((e) {
                      return BarChartGroupData(
                        x: e.key,
                        barRods: [
                          BarChartRodData(toY: e.value, color: Colors.green),
                        ],
                      );
                    }).toList(),
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: true),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text('App Usage by Category', style: TextStyle(fontSize: 18)),
              SizedBox(
                height: 300,
                child: PieChart(
                  PieChartData(
                    sections: categoryLabels.asMap().entries.map((e) {
                      if (categoryData.isNotEmpty &&
                          categoryLabels.isNotEmpty) {
                        return PieChartSectionData(
                          value: categoryData[e.key],
                          title: e.value,
                          color:
                              Colors.primaries[e.key % Colors.primaries.length],
                        );
                      } else {
                        return PieChartSectionData(
                          value: 1, // Default value
                          title: "No Data",
                          color: Colors.grey,
                        );
                      }
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
