//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import '../../utils/color_constants.dart';
// import '../../utils/shared_pref_instance.dart';
//
// import 'expension_tile.dart';
//
// class CustomAppDrawer extends StatefulWidget {
//   bool? rmDrawer = true;
//   CustomAppDrawer({super.key, this.rmDrawer});
//   @override
//   State<CustomAppDrawer> createState() => _CustomAppDrawerState();
// }
//
// class _CustomAppDrawerState extends State<CustomAppDrawer> {
//   @override
//   Widget build(BuildContext context) {
//     return widget.rmDrawer == true
//         ? Drawer(
//             child: Container(
//               color: ColorConstants.rmPrimary,
//               child: ListView(
//                 padding: EdgeInsets.zero,
//                 children: [
//                   SizedBox(
//                     height: 140,
//                     child: DrawerHeader(
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.transparent),
//                         color: ColorConstants.rmPrimary,
//                       ),
//                       child: Align(
//                           alignment: Alignment.topLeft,
//                           child: Image.asset(
//                             'assets/images/rm_logo.png',
//                             height: 170,
//                             width: 170,
//                           )),
//                     ),
//                   ),
//
//                   CustomExpansionTile(
//                     leading: const Icon(
//                       Icons.dashboard,
//                       color: Colors.white,
//                     ),
//                     title: 'Dashboard',
//                     subChild: true,
//                     drawerItems: [
//                       DrawerItem(
//                           title: 'Unternehmensdaten',
//                           screen: CompanyDataScreen.routeName),
//                       DrawerItem(
//                           title: 'Betriebsbesichtigung',
//                           screen: ThirdScreen.routeName),
//                       DrawerItem(
//                           title: 'Risikoanalyse Kompakt',
//                           screen: ThirdScreen.routeName),
//                       DrawerItem(
//                           title: 'Risikoanalyse 360°',
//                           screen: ThirdScreen.routeName),
//                       DrawerItem(
//                           title: 'DIN 77235-Beratung',
//                           screen: ThirdScreen.routeName),
//                       DrawerItem(
//                           title: 'Quick Check Analyse',
//                           screen: QuickCheck.routeName),
//                       DrawerItem(
//                           title: 'Risikoszenarien',
//                           screen: ThirdScreen.routeName),
//                       DrawerItem(
//                           title: 'Server Security',
//                           screen: ThirdScreen.routeName),
//                       DrawerItem(
//                           title: 'Track Metrics',
//                           screen: ThirdScreen.routeName),
//                       DrawerItem(
//                           title: 'Integration Guides',
//                           screen: ThirdScreen.routeName),
//                     ],
//                   ),
//                   CustomExpansionTile(
//                     leading: const Icon(
//                       Icons.home_outlined,
//                       color: Colors.white,
//                     ),
//                     title: 'Über uns',
//                     subChild: true,
//                     drawerItems: [
//                       DrawerItem(
//                           title: 'Unternehmensrisiken erfassen',
//                           screen: ThirdScreen.routeName),
//                     ],
//                   ),
//                   CustomExpansionTile(
//                     leading: const Icon(
//                       Icons.cancel_outlined,
//                       color: Colors.white,
//                     ),
//                     title: 'Main-Risikomanagement',
//                     subChild: true,
//                     drawerItems: [
//                       DrawerItem(
//                           title: 'Unternehmensrisiken erfassen',
//                           screen: ThirdScreen.routeName),
//                       DrawerItem(
//                           title: '2 Versicherungen erfassen',
//                           screen: InsuranceCompaniesRecord.routeName),
//                       DrawerItem(
//                           title: 'Statusubersicht',
//                           screen: ThirdScreen.routeName),
//                     ],
//                   ),
//                   CustomExpansionTile(
//                     leading: const Icon(
//                       Icons.info_outline,
//                       color: Colors.white,
//                     ),
//                     title: 'Risk Management Light',
//                     subChild: true,
//                     drawerItems: [
//                       CustomExpansionTile(
//                         title: 'Bedarfscheck',
//                         subChild: true,
//                         drawerItems: [
//                           DrawerItem(
//                               title: 'Tätigkeiten',
//                               screen: NeedsCheck.routeName),
//                           DrawerItem(
//                               title: 'Grunddaten',
//                               screen: NeedCheckDetailsScreen.routeName),
//                           DrawerItem(
//                               title: 'Standorte',
//                               screen: LocationScreen.routeName),
//                           DrawerItem(
//                               title: 'Sachrisiken',
//                               screen: LocationScreen.routeName),
//                           DrawerItem(
//                               title: 'Forderungsausfall',
//                               screen: LocationScreen.routeName),
//                           DrawerItem(
//                               title: 'Haftungs-Risiken',
//                               screen: LocationScreen.routeName),
//                           DrawerItem(
//                               title: 'Ertrags-Risiken',
//                               screen: LocationScreen.routeName),
//                           DrawerItem(
//                               title: 'Vorsorge-Risiken',
//                               screen: LocationScreen.routeName),
//                         ],
//                       ),
//                       CustomExpansionTile(
//                         title: 'Absicherungen',
//                         subChild: true,
//                         drawerItems: [
//                           DrawerItem(
//                               title: 'Absicherungen	erfassen',
//                               screen: RecordHedges.routeName),
//                         ],
//                       ),
//                       CustomExpansionTile(
//                         title: 'Beratungscockpit',
//                         subChild: true,
//                         drawerItems: [
//                           DrawerItem(
//                               title: 'bAV', screen: CockpitScreen.routeName),
//                           DrawerItem(
//                               title: 'Betriebsschliebung',
//                               screen: CockpitScreen.routeName),
//                           DrawerItem(
//                               title: 'CyberVersicherung',
//                               screen: CockpitScreen.routeName),
//                           DrawerItem(
//                               title: 'DO', screen: CockpitScreen.routeName),
//                           DrawerItem(
//                               title: 'Elektronik',
//                               screen: CockpitScreen.routeName),
//                           DrawerItem(
//                               title: 'Inhalt', screen: CockpitScreen.routeName),
//                           DrawerItem(
//                               title: 'Kraftfahrt',
//                               screen: CockpitScreen.routeName),
//                           DrawerItem(
//                               title: 'Betriebliche-Krankenversicherung',
//                               screen: CockpitScreen.routeName),
//                           DrawerItem(
//                               title: 'Praxisausfall',
//                               screen: CockpitScreen.routeName),
//                           DrawerItem(
//                               title: 'Produkthaftpflicht',
//                               screen: CockpitScreen.routeName),
//                           DrawerItem(
//                               title: 'Rechtsschutz',
//                               screen: CockpitScreen.routeName),
//                           DrawerItem(
//                               title: 'Transport',
//                               screen: CockpitScreen.routeName),
//                           DrawerItem(
//                               title: 'Gruppenunfall',
//                               screen: CockpitScreen.routeName),
//                         ],
//                       ),
//                       DrawerItem(
//                           title: 'Konzeptseite', screen: ConceptPage.routeName),
//                       DrawerItem(
//                           title: 'Nächste Schritte',
//                           screen: NextStep.routeName),
//                     ],
//                   ),
//
//                   const CustomExpansionTile(
//                     title: 'Hilife',
//                     subChild: false,
//                     drawerItems: [],
//                   ),
//                   const CustomExpansionTile(
//                     title: 'Kontakt',
//                     subChild: false,
//                     drawerItems: [],
//                   ),
//                   const CustomExpansionTile(
//                     title: 'Ausloggen',
//                     subChild: false,
//                     drawerItems: [],
//                   ),
//
//                   //
//                 ],
//               ),
//             ),
//           )
//         : Drawer(
//             elevation: 0,
//             child: Container(
//               color: ColorConstants.primary,
//               child: ListView(
//                 children: [
//                   DrawerHeader(
//                       child: Center(
//                     child: ClipOval(
//                       child: Image.asset(
//                         'assets/images/app_icon.png',
//                         width: 120.0,
//                         height: 120.0,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   )),
//                   GestureDetector(
//                       onTap: () {},
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 18.0, vertical: 10),
//                         child: Text(
//                           "Hi , ${SharedPreference.instance.getData("name").toString()}",
//                           style: const TextStyle(
//                               color: Colors.white, fontSize: 16),
//                         ),
//                       )),
//                   const Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 18.0),
//                     child: Divider(
//                       color: Colors.white30,
//                     ),
//                   ),
//                   GestureDetector(
//                       onTap: () {
//                         Navigator.pushNamed(
//                             context, SetTwoFactorAuth.routeName);
//                       },
//                       child: const Padding(
//                         padding: EdgeInsets.symmetric(
//                             horizontal: 18.0, vertical: 10),
//                         child: Text(
//                           'Two-Factor Authentication',
//                           style: TextStyle(color: Colors.white, fontSize: 16),
//                         ),
//                       )),
//                   const Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 18.0),
//                     child: Divider(
//                       color: Colors.white30,
//                     ),
//                   ),
//                   // GestureDetector(
//                   //     onTap: () {
//                   //
//                   //
//                   //     },
//                   //     child: const Padding(
//                   //       padding: EdgeInsets.symmetric(horizontal: 18.0,vertical: 10),
//                   //       child: Text('Lizenzvertrag',style: TextStyle(color: Colors.white,fontSize: 16),),
//                   //     )
//                   // ),
//                   // const Padding(
//                   //   padding: EdgeInsets.symmetric(horizontal: 18.0),
//                   //   child: Divider(
//                   //     color: Colors.white30,
//                   //   ),
//                   // ),
//                   // GestureDetector(
//                   //     onTap: () {
//                   //
//                   //
//                   //     },
//                   //     child: const Padding(
//                   //       padding: EdgeInsets.symmetric(horizontal: 18.0,vertical: 10),
//                   //       child: Text('AgentSetting',style: TextStyle(color: Colors.white,fontSize: 16),),
//                   //     )
//                   // ),
//                   // const Padding(
//                   //   padding: EdgeInsets.symmetric(horizontal: 18.0),
//                   //   child: Divider(
//                   //     color: Colors.white30,
//                   //   ),
//                   // ),
//                   GestureDetector(
//                       onTap: () {
//                         if (kDebugMode) {
//                           print("taped");
//                         }
//                         Navigator.pushNamed(context, SaveNewPassword.routeName);
//                       },
//                       child: const Padding(
//                         padding: EdgeInsets.symmetric(
//                             horizontal: 18.0, vertical: 10),
//                         child: Text(
//                           'Passwort ändern',
//                           style: TextStyle(color: Colors.white, fontSize: 16),
//                         ),
//                       )),
//                   const Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 18.0),
//                     child: Divider(
//                       color: Colors.white30,
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       ref.read(authProvider).logout(context);
//
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(
//                           content: Text('Sie wurden abgemeldet.'),
//                           duration: Duration(seconds: 2),
//                         ),
//                       );
//                     },
//                     child: const Padding(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
//                       child: Row(
//                         children: [
//                           Text('Logout',
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 16)),
//                           SizedBox(width: 5),
//                         ],
//                       ),
//                     ),
//                   )
//
//                   //
//                 ],
//               ),
//             ),
//           );
//   }
// }
