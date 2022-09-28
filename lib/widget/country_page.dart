import 'package:flutter/material.dart';
import 'package:flutter_widget/data/CountryInfo.dart';

class CountryPage extends StatelessWidget {
  final CountryInfo countryInfo;

  const CountryPage({Key? key, required this.countryInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            countryInfo.name,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            color: const Color(0xFF000000),
            child: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                children: [
                  Container(
                    height: 120,
                    width: 200,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 5,
                        color: Colors.white38,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.network(
                        countryInfo.flag,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Lat: ${countryInfo.lat} \nLong: ${countryInfo.long} \nISO2: ${countryInfo.iso2} \nISO3: ${countryInfo.iso3}',
                      textAlign: TextAlign.center,
                      textScaleFactor: 1.5,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
