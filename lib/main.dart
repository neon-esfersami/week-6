import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello',
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  static const List<String> imageLink = [
    'https://images.unsplash.com/photo-1608848461950-0fe51dfc41cb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8M3x8fGVufDB8fHx8fA%3D%3D&w=1000&q=80',
    'https://t4.ftcdn.net/jpg/00/97/58/97/360_F_97589769_t45CqXyzjz0KXwoBZT9PRaWGHRk5hQqQ.jpg',
    'https://img.freepik.com/free-photo/cute-domestic-kitten-sits-window-staring-outside-generative-ai_188544-12519.jpg?w=2000',
    'https://media.istockphoto.com/id/1322123064/photo/portrait-of-an-adorable-white-cat-in-sunglasses-and-an-shirt-lies-on-a-fabric-hammock.jpg?s=612x612&w=0&k=20&c=-G6l2c4jNI0y4cenh-t3qxvIQzVCOqOYZNvrRA7ZU5o=',
    'https://images.pexels.com/photos/45201/kitty-cat-kitten-pet-45201.jpeg?cs=srgb&dl=pexels-pixabay-45201.jpg&fm=jpg',
    'https://hips.hearstapps.com/hmg-prod/images/cute-cat-photos-1593441022.jpg?crop=0.670xw:1.00xh;0.167xw,0&resize=640:*'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Welcome to My Photo Gallery!',
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(14.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for photos',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                 // physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: imageLink.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 30,
                  ),
                  itemBuilder: (context, index) {
                    return GridTile(
                      footer: Container(color: Colors.white,child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Center(child: Text("Photo $index",style: const TextStyle(fontSize: 20),)),
                      ),),
                      child: GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Image $index clicked!'),
                            ),
                          );
                        },
                        child: Container(
                          height: 150,
                          color: Colors.grey,
                          child: Image.network(
                            imageLink[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              child: ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder:  (context, iindex) =>  ListTile(
                  leading: CircleAvatar(backgroundImage:NetworkImage(imageLink[iindex]),),
                  title: Text('Photo ${iindex+1}'),
                  subtitle: Text('Description of photo ${iindex+1}'),
                ),
              ),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Photos Uploaded Successfully!'),
                  ),
                );
              },
              child:  Icon(Icons.upload),
            ),
          ],
        ),
      ),
    );
  }
}