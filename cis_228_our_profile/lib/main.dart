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
      year: '2025',
      section: 'BSIS - 3A',
      bio: 'Hardwork beats Talent.',
      imageUrl: 'assets/Peter.jpg',
    ),
    Member(
      name: 'Jhan Philip Sustiguer',
      year: '2025',
      section: 'BSIS - 3A',
      bio: 'All I wanted was happiness, backpain is what I got.',
      imageUrl: 'assets/kelly.jpg',
    ),
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
            onTap:
                () => Navigator.push(
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

class ProfileScreen extends StatefulWidget {
  final Member member;
  const ProfileScreen({super.key, required this.member});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final Map<String, bool> _interests = {
    'Music': false,
    'Sports': false,
    'Reading': false,
  };

  @override
  void initState() {
    super.initState();
    // Pre-fill the form with member data (if applicable)
    _nameController.text = widget.member.name;
  }

  void _submitData() {
    print('----- User Data -----');
    print('Name: ${_nameController.text}');
    print('Email: ${_emailController.text}');
    print('Selected Interests:');
    _interests.forEach((interest, selected) {
      if (selected) print('- $interest');
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.member.name}\'s Profile')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(widget.member.imageUrl),
                radius: 60,
              ),
              const SizedBox(height: 20),
              // Bio from the Member class
              Text(
                widget.member.bio,
                style: const TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 20),
              const Divider(),
              // Your previous form elements
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'pfp3.jpg',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ..._interests.keys.map(
                (interest) => CheckboxListTile(
                  title: Text(interest),
                  value: _interests[interest],
                  onChanged:
                      (value) => setState(() => _interests[interest] = value!),
                ),
              ),
              ElevatedButton(
                onPressed: _submitData,
                child: const Text('Submit'),
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
      theme: ThemeData(primarySwatch: Colors.blue),
      home: DashboardScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
