import 'package:flutter/material.dart';
import 'package:high_school/Subjects/sub-math/subject_math.dart';
import 'package:high_school/Subjects/utils/app_colors.dart';
import 'package:high_school/account-1/account.dart';
import 'package:high_school/componet/crud.dart';
import 'package:high_school/constant/link.dart';
import 'package:high_school/contact_view.dart';
import 'package:high_school/login/sign/login.dart';
import 'package:high_school/main.dart';
import 'package:high_school/plan/plan_note_showbottom.dart';
import 'package:high_school/plan/planonly/staticplan.dart';
import 'package:lottie/lottie.dart';

class HomeMathematics extends StatefulWidget {
  @override
  State<HomeMathematics> createState() => _HomeMathematicsState();
}

class _HomeMathematicsState extends State<HomeMathematics> with Crud {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  _HomeMathematicsState();

  getNote() async {
    var response = await postRequest(linkViewNote, {
      "id": sharepref.getString("id"),
    });
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppColors.bluelight,
      drawer: _buildDrawer(context),
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.bluelight,
      elevation: 0,
      centerTitle: true,
      title: const Text(
        'EOL',
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          letterSpacing: 3,
          fontWeight: FontWeight.bold,
          fontFamily: 'Smooch-Regular',
        ),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.all(15.0),
          child: Icon(Icons.search),
        ),
      ],
    );
  }

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            _buildDrawerHeader(),
            _buildDrawerItem(
              title: "Account",
              icon: Icons.account_balance_rounded,
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: ((context) => const account())));
              },
            ),
            _buildDrawerItem(
              title: "Order",
              icon: Icons.check_box,
              onTap: () {},
            ),
            _buildDrawerItem(
              title: "Contact Us",
              icon: Icons.phone_android_outlined,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => const ContactView())));
              },
            ),
            _buildDrawerItem(
              title: "Logout",
              icon: Icons.exit_to_app,
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const Login()));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerHeader() {
    return Row(
      children: [
        SizedBox(
          width: 60,
          height: 60,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Image.asset('assets/images/face.PNG', fit: BoxFit.cover),
          ),
        ),
        const Expanded(
          child: ListTile(
            title: Text("ibrahim"),
            subtitle: Text(
              "ibrahimmahmed@gmail.com",
              maxLines: 1,
              style: TextStyle(fontSize: 13),
            ),
          ),
        ),
      ],
    );
  }

  ListTile _buildDrawerItem(
      {required String title,
      required IconData icon,
      required VoidCallback onTap}) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      onTap: onTap,
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 25.0, right: 25, top: 60, bottom: 90),
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          width: 350,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildRowItems(context),
              const SizedBox(
                height: 15,
              ),
              Center(
                  child: Lottie.asset(
                      'assets/images/Animation - 1701549531524.json',
                      width: 200,
                      height: 80)),
              _buildBottomRowItems(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRowItems(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 30),
          child: _buildMenuItem(
            title: "Subject",
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SubjectViewMath()));
            },
          ),
        ),
        const SizedBox(width: 5),
        Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 15),
          child: _buildMenuItem(
            title: "Community",
            onTap: () {
              Navigator.of(context).pushNamed("community");
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBottomRowItems(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 30),
          child: _buildMenuItem(
            title: "Plan/Note",
            onTap: () {
              scaffoldKey.currentState!.showBottomSheet(
                (context) => _buildBottomSheet(context),
              );
            },
          ),
        ),
        const SizedBox(width: 5),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 15),
          child: _buildMenuItem(
            title: "Make your plan/ask",
            onTap: () {
              Navigator.of(context).pushNamed("chooseplan_and_ask");
            },
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem({required String title, required VoidCallback onTap}) {
    bool isHovered = false;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: isHovered ? 160 : 140,
          decoration: BoxDecoration(
            color: AppColors.blue,
            borderRadius: BorderRadius.circular(15),
          ),
          width: 120,
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomSheet(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      color: const Color.fromARGB(255, 250, 250, 248),
      child: Column(
        children: [
          const SizedBox(height: 30),
          plan_note(
            title: "Plan",
            icon: Icons.calendar_today,
            onpress: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const StaticPaln()));
            },
          ),
          const SizedBox(height: 10),
          plan_note(
            title: "Note",
            icon: Icons.article,
            onpress: () {
              Navigator.of(context).pushNamed("addnote");
            },
          ),
          const SizedBox(height: 5),
          Container(
            height: 150,
            width: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xFF102C57)),
            child: MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed("Ur_Notes");
              },
              child: Text(
                "My notes",
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
