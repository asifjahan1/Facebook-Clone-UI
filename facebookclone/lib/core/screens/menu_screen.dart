// import 'package:flutter/material.dart';

// class MenuScreen extends StatefulWidget {
//   String menuScreenRoute = '/menu';

//   @override
//   _MenuScreenState createState() => _MenuScreenState();
// }

// class _MenuScreenState extends State<MenuScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 1, // Change the length according to your number of tabs
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Menu'),
//           actions: [
//             IconButton(
//               icon: Icon(Icons.search),
//               onPressed: () {
//                 // Implement search functionality here
//               },
//             ),
//           ],
//           bottom: TabBar(
//             tabs: [
//               Tab(
//                 text: 'Menu', // Change the text according to your tab
//               ),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             ListView(
//               children: [
//                 ListTile(
//                   leading: Icon(Icons.save),
//                   title: Text('Saved'),
//                   onTap: () {
//                     // Handle Saved item tap
//                   },
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.rss_feed),
//                   title: Text('Feeds'),
//                   onTap: () {
//                     // Handle Feeds item tap
//                   },
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.people),
//                   title: Text('Friends'),
//                   onTap: () {
//                     // Handle Friends item tap
//                   },
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.group),
//                   title: Text('Groups'),
//                   onTap: () {
//                     // Handle Groups item tap
//                   },
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.video_library),
//                   title: Text('Videos'),
//                   onTap: () {
//                     // Handle Videos item tap
//                   },
//                 ),
//                 ListTile(
//                   title: Text(
//                     'See More',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Colors.blue,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   onTap: () {
//                     // Handle See More item tap
//                   },
//                 ),
//               ],
//             ),
//           ],
//         ),
//         bottomNavigationBar: BottomAppBar(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 TextButton(
//                   onPressed: () {
//                     // Implement logout functionality here
//                   },
//                   child: Text(
//                     'Log Out',
//                     style: TextStyle(
//                       color: Colors.red,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  static const routeName = '/menu';

  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Implement search functionality here
            },
          ),
        ],
        bottom: const TabBar(
          tabs: [
            Tab(
              text: 'Menu', // Change the text according to your tab
            ),
          ],
        ),
      ),
      body: TabBarView(
        children: [
          ListView(
            children: [
              ListTile(
                leading: const Icon(Icons.save),
                title: const Text('Saved'),
                onTap: () {
                  // Handle Saved item tap
                },
              ),
              ListTile(
                leading: const Icon(Icons.feed),
                title: const Text('Feeds'),
                onTap: () {
                  // Handle Feeds item tap
                },
              ),
              ListTile(
                leading: const Icon(Icons.people_outline),
                title: const Text('Friends'),
                onTap: () {
                  // Handle Friends item tap
                },
              ),
              ListTile(
                leading: const Icon(Icons.groups_2),
                title: const Text('Groups'),
                onTap: () {
                  // Handle Groups item tap
                },
              ),
              ListTile(
                leading: const Icon(Icons.video_library),
                title: const Text('Videos'),
                onTap: () {
                  // Handle Videos item tap
                },
              ),
              ListTile(
                title: const Text(
                  'See More',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  // Handle See More item tap
                },
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  // Implement logout functionality here
                },
                child: const Text(
                  'Log Out',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    // Your MenuScreen widget implementation
  }
}
