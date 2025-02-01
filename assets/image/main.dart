import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Kartu Bisnis Saya',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Builder(
          builder: (context) {
            return SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/image/weku.jpg'),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Putra yudha R',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '22201052',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                      const Divider(
                        color: Colors.blue,
                        thickness: 1,
                        height: 30,
                        indent: 50,
                        endIndent: 50,
                      ),
                      const Text(
                        'PT UNIVERSAL BIG DATA',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 170,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 2, // Jumlah baris
                          itemBuilder: (context, rowIndex) {
                            return Column(
                              children: [
                                Row(
                                  children: List.generate(
                                    1, // Jumlah kolom per baris
                                    (columnIndex) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 300,
                                        height: 150,
                                        decoration: BoxDecoration(
                                          color: Colors.lightBlue[500],
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: Colors.blue, width: 2),
                                          image: const DecorationImage(
                                            image: NetworkImage(
                                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0JzUdIAOt0Gp7_UEoWPxKyndtZqg6KqPK0w&s"),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 170,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 2, // Jumlah baris
                          itemBuilder: (context, rowIndex) {
                            return Column(
                              children: [
                                Row(
                                  children: List.generate(
                                    1, // Jumlah kolom per baris
                                    (columnIndex) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 300,
                                        height: 150,
                                        decoration: BoxDecoration(
                                          color: Colors.lightBlue[500],
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: Colors.blue, width: 2),
                                          image: const DecorationImage(
                                            image: NetworkImage(
                                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0JzUdIAOt0Gp7_UEoWPxKyndtZqg6KqPK0w&s"),
                                            fit: BoxFit.scaleDown,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      const Divider(
                        color: Colors.blue,
                        thickness: 1,
                        height: 30,
                        indent: 50,
                        endIndent: 50,
                      ),
                      ElevatedButton.icon(
                        onPressed: () => myDialog(context),
                        icon: const Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                        label: const Text('Kontak kami'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void myDialog(BuildContext ctx) {
    showDialog(
      context: ctx,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Hubungi Kami',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          content: const Text(
            'Hubungi kami di eriksetiadimg777@gmail.com',
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Close',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        );
      },
    );
  }
}
