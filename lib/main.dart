// main.dart
// COMPLETE TARTANHABARI APP - SINGLE FILE VERSION
// 
// CUSTOMIZATION GUIDE:
// ===================
// 1. TO ADD YOUR OWN IMAGES/VIDEOS TO CAROUSEL (Line 370-380):
//    Replace the URLs in carouselImages list with:
//    - 'assets/images/carousel/slide1.jpg'
//    - 'assets/images/carousel/slide2.jpg'
//    - 'assets/videos/campus_tour.mp4' (for video)
//
// 2. TO ADD YOUR LOGO (Line 70-90):
//    Replace the Icon widget with:
//    Image.asset('assets/images/logo.png', width: 60, height: 60)
//
// 3. ASSET FOLDER STRUCTURE:
//    assets/
//    ├── images/
//    │   ├── logo.png
//    │   └── carousel/
//    │       ├── slide1.jpg
//    │       ├── slide2.jpg
//    │       └── slide3.jpg
//    └── videos/
//        └── campus_tour.mp4
//
// 4. UPDATE pubspec.yaml:
//    flutter:
//      assets:
//        - assets/images/
//        - assets/images/carousel/
//        - assets/videos/

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const TartanHabariApp());
}

class TartanHabariApp extends StatelessWidget {
  const TartanHabariApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TartanHabari',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFC41E3A),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFC41E3A),
          primary: const Color(0xFFC41E3A),
        ),
        scaffoldBackgroundColor: Colors.grey[50],
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFC41E3A),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const LoginPage(),
    );
  }
}

// ==================== LOGIN PAGE ====================
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  void _login() {
    setState(() => _isLoading = true);
    
    Future.delayed(const Duration(seconds: 1), () {
      if (_usernameController.text == 'tartancmu' && 
          _passwordController.text == 'password') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Invalid credentials. Use: tartancmu / password'),
            backgroundColor: Colors.red,
          ),
        );
      }
      setState(() => _isLoading = false);
    });
  }

  void _signUpWithGoogle() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Redirecting to Google Sign-Up...'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const SizedBox(height: 40),
                Image.asset('assets/images/logo.png', width: 120, height: 120),
                const SizedBox(height: 24),
                const Text(
                  'TartanHabari',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFC41E3A),
                  ),
                ),
                const Text(
                  'CMU Africa Campus Connect',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 48),
                
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC41E3A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: _isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                            'Login',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                  ),
                ),
                const SizedBox(height: 16),
                
                const Text('OR', style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 16),
                
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: OutlinedButton.icon(
                    onPressed: _signUpWithGoogle,
                    icon: const Icon(Icons.mail, color: Colors.red),
                    label: const Text('Sign Up with Andrew ID'),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.grey),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                
                const Text(
                  'To test our app just use this credentials: tartancmu / password',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ==================== HOME PAGE ====================
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeContentPage(),
    const AnnouncementsPage(),
    const SolidMindPage(),
    const SuggestionsPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        selectedItemColor: const Color(0xFFC41E3A),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'News'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Solid Mind'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Suggest'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}

// ==================== HOME CONTENT PAGE WITH DRAWER MENU ====================
class HomeContentPage extends StatelessWidget {
  const HomeContentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final List<String> carouselImages = [
      'assets/images/carousel/tart4.jpg',
      'assets/images/carousel/tartan2.jpg',
    ];

    final events = [
      {'title': 'Orientation Week', 'date': 'Aug 25-30, 2025', 'location': 'Main Campus'},
      {'title': 'Tech Innovation Summit', 'date': 'Sep 15, 2025', 'location': 'Conference Hall'},
      {'title': 'Mid-Semester Break', 'date': 'Oct 10-14, 2025', 'location': 'N/A'},
      {'title': 'Career Fair', 'date': 'Nov 20, 2025', 'location': 'Auditorium'},
      {'title': 'Final Exams', 'date': 'Dec 5-15, 2025', 'location': 'Exam Centers'},
      {'title': 'Graduation Ceremony', 'date': 'May 28, 2026', 'location': 'Main Hall'},
    ];

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: const Text('TartanHabari'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      
      // LEFT DRAWER MENU
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFFC41E3A),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: Color(0xFFC41E3A),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Student Portal',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'CMU Africa',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text('Home'),
                    onTap: () => Navigator.pop(context),
                  ),
                  ListTile(
                    leading: const Icon(Icons.notifications),
                    title: const Text('Announcements'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AnnouncementsPage()),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.favorite, color: Colors.green),
                    title: const Text('Solid Mind', style: TextStyle(fontWeight: FontWeight.w500)),
                    tileColor: Colors.green[50],
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SolidMindPage()),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.event),
                    title: const Text('Events Calendar'),
                    onTap: () => Navigator.pop(context),
                  ),
                  ListTile(
                    leading: const Icon(Icons.message),
                    title: const Text('Suggestions'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SuggestionsPage()),
                      );
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Settings'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SettingsPage()),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.info_outline),
                    title: const Text('About'),
                    onTap: () {
                      Navigator.pop(context);
                      _showAboutDialog(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.help_outline),
                    title: const Text('Help & Support'),
                    onTap: () => Navigator.pop(context),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.logout, color: Colors.red),
                    title: const Text('Logout', style: TextStyle(color: Colors.red)),
                    onTap: () {
                      Navigator.pop(context);
                      _showLogoutDialog(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Carousel Slider - CUSTOMIZE WITH YOUR IMAGES
            CarouselSlider(
              options: CarouselOptions(
                height: 200,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 0.9,
              ),
              items: carouselImages.map((url) {
                return Builder(
                  builder: (BuildContext context) {
                    final ImageProvider imageProvider = url.startsWith('http')
                        ? NetworkImage(url)
                        : AssetImage(url);
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            
            // Calendar Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Academic Calendar 2025-2026',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  ...events.map((event) => Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Color(0xFFC41E3A),
                        child: Icon(Icons.event, color: Colors.white),
                      ),
                      title: Text(event['title']!),
                      subtitle: Text(event['date']!),
                      trailing: Text(event['location']!, style: const TextStyle(fontSize: 12)),
                    ),
                  )),
                ],
              ),
            ),
            
            // Solid Mind Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                color: Colors.green[50],
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.lightbulb, color: Colors.green, size: 28),
                          SizedBox(width: 8),
                          Text(
                            'Solid Mind Tips',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        '📚 Preparing for AI for Engineers Exam?',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '• Break study sessions into 45-min blocks\n'
                        '• Practice neural network diagrams daily\n'
                        '• Join study groups for collaborative learning\n'
                        '• Take breaks to reduce stress',
                        style: TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        '💆 Stress Management: Deep breathing for 5 minutes can '
                        'reduce anxiety and improve focus.',
                        style: TextStyle(fontSize: 13, fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('About TartanHabari'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('TartanHabari', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Version 1.0.0'),
            SizedBox(height: 16),
            Text('CMU Africa Campus Connect Application'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  static void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
                (route) => false,
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}

// ==================== ANNOUNCEMENTS PAGE ====================
class AnnouncementsPage extends StatefulWidget {
  const AnnouncementsPage({Key? key}) : super(key: key);

  @override
  State<AnnouncementsPage> createState() => _AnnouncementsPageState();
}

class _AnnouncementsPageState extends State<AnnouncementsPage> {
  String _selectedFilter = 'All';
  DateTime? _selectedDate;

  final announcements = [
    {
      'title': 'Google Africa Internship Applications Open',
      'category': 'Opportunity',
      'date': DateTime(2025, 10, 15),
      'time': '2h ago'
    },
   
{
    'title': 'Panel session - Student Research at CMU (2 Years/Associates)',
    'category': 'Event',
    'date': DateTime(2025, 10, 3),
    'time': 'TBA',
    'location': 'Lecture Hall',
    'details': 'Panel featuring recent graduates and current students discussing their student research experiences at CMU.',
    'audience': 'Panel speakers listed'
  },
  {
    'title': 'Networking Mixer',
    'category': 'Event',
    'date': DateTime(2025, 9, 18),
    'time': '6:00 PM - 8:00 PM',
    'location': 'Student Lounge',
    'details': 'Informal networking event for researchers to connect, share ideas, and explore potential collaborations over refreshments.',
    'audience': 'Open to all members'
  },
  {
    'title': 'Virtual SIGCOM 25 - Virtual conference attendance',
    'category': 'Event',
    'date': DateTime(2025, 9, 9),
    'time': 'Sept 9 - Sept 11 (All-day)',
    'location': 'Virtual',
    'details': 'Join the virtual SIGCOM 25 conference. Sessions run through multiple days.',
    'audience': 'Open to members'
  }
  ];

  List<Map<String, dynamic>> get filteredAnnouncements {
    var filtered = announcements;
    
    if (_selectedFilter != 'All') {
      filtered = filtered.where((a) => a['category'] == _selectedFilter).toList();
    }
    
    if (_selectedDate != null) {
      filtered = filtered.where((a) {
        final date = a['date'] as DateTime;
        return date.year == _selectedDate!.year &&
               date.month == _selectedDate!.month &&
               date.day == _selectedDate!.day;
      }).toList();
    }
    
    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Announcements'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: ['All', 'Event', 'Opportunity', 'Campus News']
                              .map((filter) => Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: FilterChip(
                                      label: Text(filter),
                                      selected: _selectedFilter == filter,
                                      onSelected: (selected) {
                                        setState(() => _selectedFilter = filter);
                                      },
                                      selectedColor: const Color(0xFFC41E3A),
                                      labelStyle: TextStyle(
                                        color: _selectedFilter == filter ? Colors.white : Colors.black,
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.calendar_today,
                        color: _selectedDate != null ? const Color(0xFFC41E3A) : Colors.grey,
                      ),
                      onPressed: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2025),
                          lastDate: DateTime(2026),
                        );
                        setState(() => _selectedDate = date);
                      },
                    ),
                  ],
                ),
                if (_selectedDate != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      children: [
                        Text(
                          'Filtered by: ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                          style: const TextStyle(fontSize: 12),
                        ),
                        TextButton(
                          onPressed: () => setState(() => _selectedDate = null),
                          child: const Text('Clear'),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: filteredAnnouncements.length,
              itemBuilder: (context, index) {
                final announcement = filteredAnnouncements[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    title: Text(
                      announcement['title'] as String,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.blue[100],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                announcement['category'] as String,
                                style: const TextStyle(fontSize: 12),
                              ),
                            ),
                            const Spacer(),
                            Text(
                              announcement['time'] as String,
                              style: const TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ==================== SOLID MIND PAGE ====================
class SolidMindPage extends StatelessWidget {
  const SolidMindPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Solid Mind'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              color: Colors.green[50],
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: const [
                    Icon(Icons.self_improvement, size: 60, color: Colors.green),
                    SizedBox(height: 16),
                    Text(
                      '"You are braver than you believe, stronger than you seem, '
                      'and smarter than you think."',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              children: [
                _buildMindCard('Daily Tips', Icons.lightbulb, Colors.orange),
                _buildMindCard('Meditation', Icons.spa, Colors.purple),
                _buildMindCard('Counseling', Icons.people, Colors.blue),
                _buildMindCard('Resources', Icons.book, Colors.teal),
              ],
            ),
            const SizedBox(height: 20),
            Card(
              color: Colors.red[50],
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      '🆘 Need Immediate Support?',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text('24/7 Crisis Helpline: +250 788 XXX XXX'),
                    const SizedBox(height: 12),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.phone),
                      label: const Text('Contact Counselor'),  
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 206, 197, 197),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMindCard(String title, IconData icon, Color color) {
    return Card(
      child: InkWell(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: color),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

// ==================== SUGGESTIONS PAGE ====================
class SuggestionsPage extends StatefulWidget {
  const SuggestionsPage({Key? key}) : super(key: key);

  @override
  State<SuggestionsPage> createState() => _SuggestionsPageState();
}

class _SuggestionsPageState extends State<SuggestionsPage> {
  String? _selectedCategory;
  final _suggestionController = TextEditingController();

  final categories = [
    'Academic Programs',
    'Campus Facilities',
    'IT Services',
    'Student Life',
    'Cafeteria Services',
    'Library Resources',
    'Solid Mind Support',
    'Career Services',
  ];

  void _submitSuggestion() {
    if (_selectedCategory == null || _suggestionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Thank you! Your suggestion has been submitted anonymously.'),
        backgroundColor: Colors.green,
      ),
    );

    setState(() {
      _selectedCategory = null;
      _suggestionController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Suggestions'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.amber[50],
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(Icons.privacy_tip, color: Colors.amber),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'As a member of this community, your feedback is invaluable in helping us '
                        'Help us to improve our services and campus life. All suggestions are submitted anonymously to ensure your privacy.',
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Category',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Select a category',
              ),
              items: categories.map((category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (value) => setState(() => _selectedCategory = value),
            ),
            const SizedBox(height: 24),
            const Text(
              'Your Suggestion',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _suggestionController,
              maxLines: 8,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Here you can share your suggestions...',
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: _submitSuggestion,
                icon: const Icon(Icons.send),
                label: const Text('Submit Anonymously'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 211, 202, 204),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==================== SETTINGS PAGE ====================
class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _username = 'tartancmu';
  String _email = 'tartancmu@cmu.ac.rw';
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Profile Section
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: const Color(0xFFC41E3A),
                    child: const Icon(Icons.person, size: 50, color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _username,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(_email, style: const TextStyle(color: Colors.grey)),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () => _showEditProfileDialog(),
                    icon: const Icon(Icons.edit),
                    label: const Text('Edit Profile'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 221, 206, 209),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          
          // Settings List
          Card(
            child: Column(
              children: [
                SwitchListTile(
                  title: const Text('Push Notifications'),
                  subtitle: const Text('Receive updates and announcements'),
                  value: _notificationsEnabled,
                  activeColor: const Color(0xFFC41E3A),
                  onChanged: (value) {
                    setState(() => _notificationsEnabled = value);
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.language),
                  title: const Text('Language'),
                  subtitle: const Text('English'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {},
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.lock),
                  title: const Text('Change Password'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {},
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.info),
                  title: const Text('About'),
                  subtitle: const Text('Version 1.0.0'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('About TartanHabari'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'TartanHabari',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text('Version 1.0.0'),
                            SizedBox(height: 16),
                            Text('CMU Africa Campus Connect Application'),
                            SizedBox(height: 8),
                            Text(
                              'Stay connected with campus announcements, '
                              'events, and wellness resources.',
                              style: TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Close'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.help),
                  title: const Text('Help & Support'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          
          // Logout Button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Logout'),
                    content: const Text('Are you sure you want to logout?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancel'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginPage()),
                            (route) => false,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: const Text('Logout'),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.logout, color: Colors.red),
              label: const Text(
                'Logout',
                style: TextStyle(color: Colors.red),
              ),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.red),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showEditProfileDialog() {
    final usernameController = TextEditingController(text: _username);
    final emailController = TextEditingController(text: _email);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Profile'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _username = usernameController.text;
                _email = emailController.text;
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Profile updated successfully!'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFC41E3A),
            ),
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}

/*
=============================================================================
CUSTOMIZATION GUIDE FOR CAROUSEL IMAGES/VIDEOS
=============================================================================

1. FILE STRUCTURE:
   Create these folders in your Flutter project root:
   
   tartanhabari/
   └── assets/
       ├── images/
       │   ├── logo.png                    (Your CMU logo)
       │   └── carousel/
       │       ├── slide1.jpg              (Carousel image 1)
       │       ├── slide2.jpg              (Carousel image 2)
       │       └── slide3.jpg              (Carousel image 3)
       └── videos/
           └── campus_tour.mp4              (Campus video)

2. UPDATE pubspec.yaml:
   Add these lines under 'flutter:' section:
   
   flutter:
     uses-material-design: true
     assets:
       - assets/images/
       - assets/images/carousel/
       - assets/videos/

3. REPLACE CAROUSEL IMAGES (Line 370-375 in main.dart):
   Change from:
   final List<String> carouselImages = [
     'https://picsum.photos/800/400?random=1',
     'https://picsum.photos/800/400?random=2',
     'https://picsum.photos/800/400?random=3',
   ];
   
   To:
   final List<String> carouselImages = [
     'assets/images/carousel/slide1.jpg',
     'assets/images/carousel/slide2.jpg',
     'assets/images/carousel/slide3.jpg',
   ];

4. UPDATE IMAGE WIDGET (Line 490-495):
   Change from:
   image: NetworkImage(url),
   
   To:
   image: AssetImage(url),

5. REPLACE LOGO (Line 70-85):
   Change from:
   child: const Icon(
     Icons.newspaper,
     size: 60,
     color: Colors.white,
   ),
   
   To:
   child: Image.asset(
     'assets/images/logo.png',
     width: 80,
     height: 80,
   ),

6. FOR VIDEO IN CAROUSEL (Optional):
   Add video_player package to pubspec.yaml:
   dependencies:
     video_player: ^2.8.1
   
   Then create a custom widget for video player in carousel

=============================================================================
COMPLETE PUBSPEC.YAML EXAMPLE
=============================================================================

name: tartanhabari
description: CMU Africa Campus Connect Application
publish_to: 'none'
version: 1.0.0+1

environment:
  sdk: '>=3.0.0 <4.0.0'

dependencies:
  flutter:
    sdk: flutter
  carousel_slider: ^4.2.1
  video_player: ^2.8.1
  intl: ^0.18.1

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.0

flutter:
  uses-material-design: true
  
  assets:
    - assets/images/
    - assets/images/carousel/
    - assets/videos/

=============================================================================
KEY FEATURES IMPLEMENTED
=============================================================================

✅ Login Page with demo credentials (tartancmu/password)
✅ Home Page with LEFT drawer menu (hamburger icon)
✅ Carousel slider for images (customizable)
✅ Academic calendar 2025-2026
✅ Solid Mind tips section
✅ Announcements page with FILTERS:
   - Category filter (Event, Opportunity, Campus News)
   - Date picker filter
✅ Solid Mind wellness page
✅ Anonymous suggestions page with CMU-specific categories
✅ Settings page with profile editing
✅ All pages have BACK BUTTON (left) and CENTERED TITLE
✅ Bottom navigation bar

=============================================================================
*/