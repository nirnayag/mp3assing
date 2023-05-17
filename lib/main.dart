import 'package:flutter/material.dart';
import 'package:mp3assing/searchcard.dart';

import 'carddata.dart';
import 'cards.dart';

// import 'dart:ui';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      debugShowCheckedModeBanner: false,
      color: Color(0xff2a2444),
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
   int _currentIndex = 0;
  List<String> categories = [
    'Trending Right Now',
    'Rock',
    'Hip Hop',
    'Electro'
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        backgroundColor: const Color(0xff2a2444),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    MenuBtn(),
                    SearCh(),
                  ],
                ),

                const SizedBox(
                  height: 15,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Treanding Right now',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),

                // Expanded(child: CardsData())
                Container(
                  height: 200,
                  child:  Expanded(child: ListofCard()),
                ),

                 const SizedBox(
                  height: 20,
                ),

                Togglebtn(),
                const SizedBox(
                  height: 10,
                ),

                Container(
                  child: Expanded(child: HorizontlCrd()),
                )
              ],
            ),
          ),
        ),
         bottomNavigationBar: FloatingBottomBar(),
        
        );
  }

  SingleChildScrollView Togglebtn() {
    return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: List.generate(
        categories.length,
        (index) {
          if (index == selectedIndex) {
            return Container(
              margin: const EdgeInsets.all(8.0),
              child: Material(
                elevation: 4.0, // Apply elevation to the active button
                borderRadius: BorderRadius.circular(10.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFF4A299A),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      categories[index],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Container(
              margin: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Text(
                  categories[index],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }
        },
      ),
    ),
  );
  }
}

class SearCh extends StatelessWidget {
  const SearCh({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 40,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 62, 50, 98),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search),
          hintText: 'Search...',
        ),
      ),
    );
  }
}

class MenuBtn extends StatelessWidget {
  const MenuBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            const Color.fromARGB(255, 62, 50, 98)),
      ),
      onPressed: () {},
      child: const Icon(
        Icons.menu,
      ),
    );
  }
}

class FloatingBottomBar extends StatefulWidget {
  @override
  _FloatingBottomBarState createState() => _FloatingBottomBarState();
}

class _FloatingBottomBarState extends State<FloatingBottomBar> {
  int _selectedIndex = 0;


 void _onTabTapped(int index) {
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SearchPage(),
        ),
      ).then((_) {
        setState(() {
          _selectedIndex = 1; // Activate the "Search" tab
        });
      });
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0), // Adjust the spacing as needed
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Color(0xff2a2450), // More transparent color (adjust the opacity as needed)
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Color(0xff3a3d51),
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () => _onTabTapped(0),
              icon: Icon(Icons.home),
              color: _selectedIndex == 0 ? Colors.white : Colors.white10,
            ),
            IconButton(
              onPressed: () => _onTabTapped(1),
              icon: Icon(Icons.search),
              color: _selectedIndex == 1 ? Colors.white : Colors.white10,
            ),
            IconButton(
              onPressed: () => _onTabTapped(2),
              icon: Icon(Icons.music_note),
              color: _selectedIndex == 2 ? Colors.white : Colors.white10,
            ),
            IconButton(
              onPressed: () => _onTabTapped(3),
              icon: Icon(Icons.person),
              color: _selectedIndex == 3 ? Colors.white : Colors.white10,
            ),
          ],
        ),
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
    
    onBackButtonPressed: () {
      Navigator.pop(context);
    },
    onLikeButtonPressed: () {
      // Add your like button logic here
    },
  ),
     backgroundColor: Color(0xff2a2444),
      body: Column(
        children: [
          Text('Recent Favorate',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
          Expanded(child: SearchCards()),
        ],
      ),
         bottomNavigationBar: FloatingBottomBar(),

    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final VoidCallback onBackButtonPressed;
  final VoidCallback onLikeButtonPressed;

  const CustomAppBar({super.key, this.height = kToolbarHeight,
    required this.onBackButtonPressed,
    required this.onLikeButtonPressed,});

  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: height,
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              const Color.fromARGB(255, 62, 50, 98)),
        ),
        onPressed: onBackButtonPressed,
        
        child: const Icon(
          Icons.arrow_back,
        ),
      ),
            ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              const Color.fromARGB(255, 62, 50, 98)),
        ),
        onPressed: onLikeButtonPressed,
        child: const Icon(
          Icons.favorite,
        ),
      ),
       
           
           
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

