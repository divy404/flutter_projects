import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/additional_info_item.dart';
import 'package:weather_app/hourly_forecast_item.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build( BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
           onPressed:() {} ,
            icon: const Icon(Icons.refresh),
             ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // main card 
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            '300°F',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Icon(
                            Icons.cloud,
                            size: 65,
                      
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Rain',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
             Text ('Weather Forecast',
               style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
               ),
               ),
               const SizedBox(height: 16),
                const SingleChildScrollView(
                scrollDirection: Axis.horizontal,

                 child: Row(
                  children: [
                    HourlyForecastItem(),
                    HourlyForecastItem(),
                    HourlyForecastItem(),
                    HourlyForecastItem(),
                    HourlyForecastItem(),
                  ],
                 ),
               ),
            
            // weather forecast cards
            const SizedBox(height: 20),

           
            Text ('Additional Information',
               style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
               ),
               ),
               const SizedBox(height: 16),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AdditionalInfoItem(
                    icon: Icons.water_drop,
                    label: 'Humidity',
                    value: '91',
                  ),
                  AdditionalInfoItem(
                     icon: Icons.air,
                    label: 'Wind Speed',
                    value: '7.5',
                  ),
                  AdditionalInfoItem(
                     icon: Icons.beach_access,
                    label: 'Pressure',
                    value: '1000',
                  ),
                ],

               ),
           
           
           
          ],
        ),
      ),


    );
  }
}


