import 'package:flutter/material.dart';

import 'package:foodie/dashboard/start_screen.dart';
import '../home_screen/bottom_navigation_bar/components/custom_outlined_button.dart';
import '../home_screen/components/custom_text_field.dart';
import '../home_screen/components/reusable_row.dart';
class AllListings extends StatefulWidget {
  const AllListings({super.key});

  @override
  State<AllListings> createState() => _AllListingsState();
}

class _AllListingsState extends State<AllListings>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
    return Scaffold(
      key: _scaffoldKey, // Assign the GlobalKey here
      appBar: AppBar(
        title: const Text(
          'FOODSTERS',
          style: TextStyle(
            color: Color(0xff2BB673),
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTextField(
              hintText: "Search for organization",
              borderRadius: 5,
              prefixIcon: Icon(Icons.search),
              fillColor: Colors.white,
            ),
            const SizedBox(
              height: 15,
            ),
            Text("All listings",
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 18, fontWeight: FontWeight.w500)),
            TabBar(
              controller: _tabController,
              indicatorColor: Colors.green,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: const [
                Tab(
                  child: Text(
                    "All",
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                ),
                Tab(
                  child: Text(
                    "Approved",
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                ),
                Tab(
                  child: Text(
                    "Rejected",
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  TabAll(
                    showConfirm: true,
                    showAction: true,
                    title: '',
                  ),
                  TabAll(
                    showConfirm: false,
                    showAction: false,
                    title: 'Approved',
                  ),
                  TabAll(
                    showConfirm: false,
                    showAction: false,
                    title: 'Rejected',
                    approveColor: Colors.white,
                    // Make sure it's white for "Reject"
                    rejectedColor: Colors.red,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TabAll extends StatelessWidget {
  const TabAll({super.key,
    required this.showConfirm,
    required this.showAction,
    required this.title,
    this.approveColor = Colors.greenAccent,
    this.rejectedColor = Colors.red});

  final bool showConfirm;
  final bool showAction;
  final String title;
  final Color? approveColor;
  final Color? rejectedColor;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            _buildCard(context, showConfirm, title, showAction, approveColor!,),
            const SizedBox(height: 10),
            _buildCard(context, showConfirm, title, showAction, approveColor!),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, bool showConfirmation,
      String buttonText, bool showAction, Color buttonColor) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image.asset(
              "assets/jjr.jpeg",
              fit: BoxFit.cover,
              width: double.infinity,
              height: 180,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                showConfirmation
                    ? const Text(
                  "Soups and Stews",
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w700),
                )
                    : Row(
                  children: [
                    const Text(
                      "Soups and Stews",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(width: 10),
                    TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: buttonColor),
                        onPressed: () {},
                        child: Text(buttonText)),
                  ],
                ),
                const SizedBox(height: 5),
                const Row(
                  children: [
                    ReusableRow(
                      title: "Feeding America",
                      icon: Icons.arrow_forward_ios,
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                const ReusableRow(
                  title: "23 Main St, New York, NY",
                  icon: Icons.location_on_outlined,
                ),
                const SizedBox(height: 5),
                const Row(
                  children: [
                    ReusableRow(
                      title: "Aug 15, 2024",
                      icon: Icons.calendar_month,
                    ),
                  ],
                ),
                showAction
                    ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomOutlinedButton(
                      title: "Reject",
                      onPress: () {},
                      isSelected: true,
                      fillColor: Colors.white,
                      textColor: Colors.red,
                      borderSideColor: Colors.red,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    CustomOutlinedButton(
                      title: "Approve",
                      onPress: () {},
                      isSelected: true,
                      fillColor: const Color(0xff2BB673),
                      textColor: Colors.white,
                    )
                  ],
                )
                    : const SizedBox.shrink()
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xffEAF8F1),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xff2BB673),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                        height: 60,
                        width: 62,
                        child: Image.asset("assets/Frame 2149.png")),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: const BoxDecoration(
                          color: Color(0xff668598),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.camera_alt_outlined,
                          size: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'Feeding America',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Feeding.america@example.com",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              children: [
                const CustomListTile(
                  title: 'Account Sitting',
                  textStyle:
                  TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                const CustomListTile(title: "Edit profile"),
                const Divider(color: Color(0xffBDE8D4)),
                const CustomListTile(title: "Change Password"),
                const Divider(color: Color(0xffBDE8D4)),
                const CustomListTile(title: "Update email"),
                const Divider(color: Color(0xffBDE8D4)),
                const CustomListTile(title: "Legal information"),
                const SizedBox(
                  height: 15,
                ),
                const CustomListTile(
                  title: 'More',
                  textStyle:
                  TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                const CustomListTile(title: "Privacy policy"),
                const Divider(color: Color(0xffBDE8D4)),
                const CustomListTile(title: "Term and condition"),
                const Divider(color: Color(0xffBDE8D4)),
                const CustomListTile(title: "Delete account"),
                const SizedBox(
                  height: 70,
                ),
                CustomElevatedButton(title: "Log out", onPress: () {})
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.title,
    this.textStyle,
  });

  final String title;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: const VisualDensity(vertical: -4),
      title: Text(title,
          style: textStyle ??
              Theme
                  .of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 16, fontWeight: FontWeight.w500)),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
