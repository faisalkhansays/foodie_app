import 'package:flutter/material.dart';
import 'package:foodie/constants_color.dart';
import 'package:foodie/listingpages/create_listing.dart';
import '../location_screen.dart';
import '../components/custom_card.dart';
import '../components/custom_text_field.dart';
import '../components/reusable_row.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateListing()));
          },
          backgroundColor: primary,
          child: const Icon(Icons.add, color: Colors.white),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    // Custom Row with Location
                    Row(
                      children: [
                        const ReusableRow(
                          title: "Beverly Hills, LA",
                          icon: Icons.location_on_outlined,
                          iconColor: Colors.green,
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const LocationScreen()));
                          },
                            child: const Icon(Icons.arrow_drop_down, size: 30)),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const CustomTextField(
                      hintText: "Search for items",
                      borderRadius: 15,
                      prefixIcon: Icon(Icons.search),
                    ),
                    const SizedBox(height: 20),
                    TabBar(
                      controller: _tabController,
                      indicatorColor: Colors.green,
                      indicatorSize: TabBarIndicatorSize.tab,
                      tabs: const [
                        Tab(
                          child: Text(
                            "Kitchen",
                            style: TextStyle(color: Colors.black, fontSize: 17),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Pantry",
                            style: TextStyle(color: Colors.black, fontSize: 17),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Closet",
                            style: TextStyle(color: Colors.black, fontSize: 17),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    TabViewOne(),
                    TabViewTwo(),
                    TabViewThree(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TabViewOne extends StatelessWidget {
  const TabViewOne({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            CustomCard(context), // Custom card with existing design
            const SizedBox(height: 10),
            CustomCard(context),
          ],
        ),
      ),
    );
  }
}

class TabViewTwo extends StatelessWidget {
  const TabViewTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Pantry Items'));
  }
}

class TabViewThree extends StatelessWidget {
  const TabViewThree({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Closet Items'));
  }
}
