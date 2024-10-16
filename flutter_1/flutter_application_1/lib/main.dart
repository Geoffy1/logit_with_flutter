import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Import Font Awesome package

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rural_edu App',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: Login(), // Start with login page
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      final username = emailController.text;
      final password = passwordController.text;

      // Hardcoded authentication for simplicity
      if (username == "user34412@aol.com" && password == " ") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Home(email: username), // Navigate to Home after login
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid Credentials')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rural_edu Login'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                child: ElevatedButton(
                  onPressed: _login,
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// The home page after successful login, showcasing Rural_edu website
class Home extends StatelessWidget {
  final String email;
  Home({required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rural_edu Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Welcome to Rural_edu, $email!', style: TextStyle(fontSize: 20)),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Computer Literacy Tutorials', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ),
            Expanded(
              child: ListView(
                children: [
                  // Menu for Tutorials
                  ListTile(
                    title: Text('Beginner Level'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TutorialPage(level: 'Beginner')),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Intermediate Level'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TutorialPage(level: 'Intermediate')),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Pro Level'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TutorialPage(level: 'Pro')),
                      );
                    },
                  ),
                  const Divider(),
                  // Blog about Rural_edu
                  ListTile(
                    title: Text('About Rural_edu'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BlogPage()),
                      );
                    },
                  ),
                  // Case Study / Testimonials
                  ListTile(
                    title: Text('Success Stories'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SuccessStoriesPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // Footer with social links and help page
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HelpPage()),
                  );
                },
                child: const Text('Help'),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.facebook), // Use FontAwesome icons
                    onPressed: () {
                      // Add Facebook link
                    },
                  ),
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.twitter), // Use FontAwesome icons
                    onPressed: () {
                      // Add Twitter link
                    },
                  ),
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.instagram), // Use FontAwesome icons
                    onPressed: () {
                      // Add Instagram link
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Tutorial Page based on level
class TutorialPage extends StatelessWidget {
  final String level;
  TutorialPage({required this.level});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$level Tutorials'),
      ),
      body: Center(
        child: Text(
          'This is the $level tutorial content.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

// Blog Page
class BlogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Rural_edu'),
      ),
      body: Center(
        child: Text(
          'Here is some information about Rural_edu and our mission to bridge the digital divide.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

// Success Stories Page
class SuccessStoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Success Stories'),
      ),
      body: Center(
        child: Text(
          'Here are the success stories of Rural_edu learners.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

// Help Page
class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
      ),
      body: Center(
        child: Text(
          'FAQ and support for Rural_edu users.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
