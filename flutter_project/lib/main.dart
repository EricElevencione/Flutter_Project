import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Member {
  final String name;
  final String year;
  final String section;
  final String bio;
  final String imageUrl;

  Member({
    required this.name,
    required this.year,
    required this.section,
    required this.bio,
    this.imageUrl = 'https://via.placeholder.com/150',
  });
}

class DashboardScreen extends StatelessWidget {
  final List<Member> members = [
    Member(
        name: 'Eric Elevencione',
        year: '2023',
        section: 'IS - 3A',
        bio:
            'A passionate developer with 3 years of experience in mobile app development.',
        imageUrl: 'assets/Peter.jpg'),
    Member(
        name: 'Jhan Philip Sustiguer',
        year: '2024',
        section: 'IS - 3A',
        bio:
            'UI/UX designer specializing in creating beautiful user interfaces.',
        imageUrl: 'assets/372555b0-13ad-49dc-87bf-dfc73fd9e543.jpg'),
    // Add more members as needed
  ];

  DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Team Members')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.8,
        ),
        itemCount: members.length,
        itemBuilder: (context, index) {
          final member = members[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileScreen(member: member),
              ),
            ),
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(member.imageUrl),
                      radius: 30,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      member.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Year: ${member.year}'),
                    Text('Section: ${member.section}'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  final Member member;

  const ProfileScreen({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${member.name}\'s Profile')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(member.imageUrl),
                radius: 60,
              ),
              const SizedBox(height: 20),
              Text(
                member.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Year: ${member.year} | Section: ${member.section}',
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'About Me',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                member.bio,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Team Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DashboardScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
