import 'package:flutter/material.dart';
import 'package:flutter_widget/data/continent.dart';
import 'package:grouped_list/grouped_list.dart';

class GroupedListviewWidget extends StatefulWidget {
  const GroupedListviewWidget({Key? key}) : super(key: key);

  @override
  State<GroupedListviewWidget> createState() => _GroupedListviewWidgetState();
}

class _GroupedListviewWidgetState extends State<GroupedListviewWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: null,
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Scaffold(
            body: GroupedListView<dynamic, String>(
              useStickyGroupSeparators: true,
              floatingHeader: false,
              itemComparator: (item1, item2) =>
                  (item1['country'].compareTo(item2['country'])),
              groupComparator: (value1, value2) => (value1.compareTo(value2)),
              elements: continents,
              groupBy: (continent) => continent['continent'],
              groupSeparatorBuilder: (value) => Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                color: Colors.black,
                child: SizedBox(
                  height: MediaQuery.of(context).padding.top,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      '$value Continent',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              itemBuilder: (context, continents) => Card(
                elevation: 4,
                child: countryListTile(continents),
              ),
            ),
          ),
        ),
      );
}

Widget countryListTile(continents) => ListTile(
      contentPadding: const EdgeInsets.all(12),
      leading: SizedBox(
        height: 60,
        width: 60,
        child: CircleAvatar(
          backgroundImage: NetworkImage(continents['countryInfo']['flag']),
        ),
      ),
      title: Text(
        continents['country'],
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        'Lat: ${continents['countryInfo']['lat']} & Long: ${continents['countryInfo']['long']}',
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ),
    );

void print(Object object) {
  debugPrint(object.toString());
}
