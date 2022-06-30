import 'package:fabb/pages/home_app/home_pages/Equipe_detail/equipe_page2.dart';
import 'package:fabb/pages/home_app/home_pages/classment/classment_page2.dart';
import 'package:fabb/pages/home_app/home_pages/joueur_detail/joueur_page2.dart';
import 'package:fabb/pages/home_app/home_pages/match_detail/match_page2.dart';
import 'package:fabb/pages/home_app/home_pages/morePage/more_page2.dart';
import 'package:fabb/pages/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';
import '../Login/login.dart';
import 'home_pages/classment/classement_page.dart';
import 'home_pages/Equipe_detail/equipes_page.dart';
import 'home_pages/joueur_detail/joueurs_page.dart';
import 'home_pages/match_detail/matches_page.dart';
import 'home_pages/morePage/more_page.dart';

class Home2 extends StatefulWidget {
  const Home2({Key? key}) : super(key: key);

  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  int _selectedIndex = 0;
  final screens = [
    EquipePage2(),
    JoueursPage2(),
    ClassementPage2(),
    MatchesPage2(),
    MorePage()
  ] ;

  var bottomTextStyle =
  GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 
      body: screens[_selectedIndex],
      backgroundColor: mBackgroundColor,
      bottomNavigationBar:Container(
        height: 64,
        decoration: BoxDecoration(
          color: mFillColor,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 15,
                offset: Offset(0, 5))
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: _selectedIndex == 0
                  ? SvgPicture.asset(
                'asset/icons/crown.svg',
                fit: BoxFit.cover,
                height: 22,
                width: 22,
                color: Color.fromARGB(255, 138, 19, 15),
              )
                  : SvgPicture.asset(
                'asset/icons/crown.svg',
                fit: BoxFit.cover,
                height: 22,
                width: 22,
              ),
              label: "Equipes",
            ),
            BottomNavigationBarItem(
                icon: _selectedIndex == 1
                    ? SvgPicture.asset('asset/icons/personfiled.svg',
                    fit: BoxFit.cover,
                    height: 22,
                    width: 22,
                    color: Color.fromARGB(255, 138, 19, 15))
                    : SvgPicture.asset(
                  'asset/icons/person.svg',
                  fit: BoxFit.cover,
                  height: 22,
                  width: 22,
                ),
                label: "Joueurs"),
            BottomNavigationBarItem(
                icon: _selectedIndex == 2
                    ? SvgPicture.asset('asset/icons/chartfiled.svg',
                    fit: BoxFit.cover,
                    height: 22,
                    width: 22,
                    color: Color.fromARGB(255, 138, 19, 15))
                    : SvgPicture.asset(
                  'asset/icons/chart.svg',
                  fit: BoxFit.cover,
                  height: 22,
                  width: 22,
                ),
                label: "Classement"),
            BottomNavigationBarItem(
                icon: _selectedIndex == 3
                    ? SvgPicture.asset('asset/icons/court.svg',
                    fit: BoxFit.cover,
                    height: 22,
                    width: 22,
                    color: Color.fromARGB(255, 138, 19, 15))
                    : SvgPicture.asset(
                  'asset/icons/court.svg',
                  fit: BoxFit.cover,
                  height: 22,
                  width: 22,
                ),
                label: "Matches"),
            BottomNavigationBarItem(
                icon: _selectedIndex == 4
                    ? SvgPicture.asset('asset/icons/morefiled.svg',
                    fit: BoxFit.cover,
                    height: 22,
                    width: 22,
                    color: Color.fromARGB(255, 138, 19, 15))
                    : SvgPicture.asset(
                  'asset/icons/more.svg',
                  fit: BoxFit.cover,
                  height: 22,
                  width: 22,
                ),
                label: "More"),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color.fromARGB(255, 138, 19, 15),
          unselectedItemColor: mSubtitleColor,
          onTap: _onItemTapped,
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12,
          showUnselectedLabels: true,
          elevation: 0,
          unselectedLabelStyle: bottomTextStyle,
          selectedLabelStyle: bottomTextStyle,
        ),
      ),
    );
  }
}

