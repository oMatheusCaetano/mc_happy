import 'package:flutter/material.dart';
import 'package:mc_happy/data/models/orphanage.dart';
import 'package:mc_happy/data/repositories/orphanage_repository.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Orphanage>? _orphanages;

  @override
  void initState() {
    super.initState();
    _loadOrphanages();
  }

  Future<List<Orphanage>> _loadOrphanages() async {
    final orphanages = await OrphanageRepository().all();
    setState(() {
      _orphanages = orphanages;
    });
    return orphanages;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orfanatos'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add_location_alt_rounded),
      ),
      body: _orphanages == null
          ? SizedBox()
          : ListView.builder(
              itemCount: _orphanages!.length,
              itemBuilder: (_, i) {
                final item = _orphanages![i];

                return Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                    color: Color(0xFFF9FAFC),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                        BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(0, 1), // changes position of shadow
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          item.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF4D6F80)
                          ),
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          item.about ?? '',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF5C8599)
                          ),
                        ),
                      ),
                      Divider(),
                      TextButton(
                        onPressed: () {}, 
                        child: Row(
                          children: [
                            Spacer(),
                            Text('Ver informações'),
                            Icon(Icons.navigate_next_rounded)
                          ]
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
