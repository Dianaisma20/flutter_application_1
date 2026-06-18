import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseDatabase.instance.databaseURL = "https://quiz-app-fdc88-default-rtdb.firebaseio.com/";
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
      ),
      home: const CategoryPage(),
    );
  }
}

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final List<String> categories = const [
    'Bahasa Inggris',
    'Fiqih',
    'Matematika',
    'Coding',
  ];

  final List<Color> colors = const [
    Color(0xFFFFD6E8),
    Color(0xFFD6F5E3),
    Color(0xFFD6E8FF),
    Color(0xFFFFF0D6),
  ];

  final Map<String, List<Map<String, dynamic>>> quizData = const {
    'Bahasa Inggris': [
      {
        'question': 'What is the English word for "Buku"?',
        'answers': [
          {'text': 'Pencil', 'score': 0},
          {'text': 'Book', 'score': 1},
          {'text': 'Eraser', 'score': 0},
          {'text': 'Table', 'score': 0}
        ]
      },
      {
        'question': 'What is the synonym of happy?',
        'answers': [
          {'text': 'Sad', 'score': 0},
          {'text': 'Angry', 'score': 0},
          {'text': 'Joyful', 'score': 1},
          {'text': 'Tired', 'score': 0}
        ]
      },
      {
        'question': 'What is the meaning of "Apple"?',
        'answers': [
          {'text': 'Jeruk', 'score': 0},
          {'text': 'Mangga', 'score': 0},
          {'text': 'Apel', 'score': 1},
          {'text': 'Anggur', 'score': 0}
        ]
      },
      {
        'question': 'Which sentence is correct?',
        'answers': [
          {'text': 'She go to school every day', 'score': 0},
          {'text': 'She goes to school every day', 'score': 1},
          {'text': 'She going to school every day', 'score': 0},
          {'text': 'She gone to school every day', 'score': 0}
        ]
      },
      {
        'question': 'What is the past tense of eat?',
        'answers': [
          {'text': 'Eated', 'score': 0},
          {'text': 'Ate', 'score': 1},
          {'text': 'Eaten', 'score': 0},
          {'text': 'Eating', 'score': 0}
        ]
      },
      {
        'question': 'I ___ a student.',
        'answers': [
          {'text': 'is', 'score': 0},
          {'text': 'am', 'score': 1},
          {'text': 'are', 'score': 0},
          {'text': 'be', 'score': 0}
        ]
      },
      {
        'question': 'What is the antonym of big?',
        'answers': [
          {'text': 'Large', 'score': 0},
          {'text': 'Small', 'score': 1},
          {'text': 'Tall', 'score': 0},
          {'text': 'Wide', 'score': 0}
        ]
      },
      {
        'question': 'Which one is a verb?',
        'answers': [
          {'text': 'Beautiful', 'score': 0},
          {'text': 'Quickly', 'score': 0},
          {'text': 'Run', 'score': 1},
          {'text': 'Blue', 'score': 0}
        ]
      },
      {
        'question': 'They ___ playing football.',
        'answers': [
          {'text': 'is', 'score': 0},
          {'text': 'am', 'score': 0},
          {'text': 'are', 'score': 1},
          {'text': 'be', 'score': 0}
        ]
      },
      {
        'question': 'What is the plural form of "child"?',
        'answers': [
          {'text': 'Childs', 'score': 0},
          {'text': 'Children', 'score': 1},
          {'text': 'Childes', 'score': 0},
          {'text': 'Childrens', 'score': 0}
        ]
      }
    ],
    'Fiqih': [
      {
        'question': 'Apa hukum wudhu sebelum sholat?',
        'answers': [
          {'text': 'Sunnah', 'score': 0},
          {'text': 'Wajib', 'score': 1},
          {'text': 'Makruh', 'score': 0},
          {'text': 'Haram', 'score': 0},
        ]
      },
      {
        'question': 'Apa hukum shalat lima waktu?',
        'answers': [
          {'text': 'Sunnah', 'score': 0},
          {'text': 'Wajib', 'score': 1},
          {'text': 'Makruh', 'score': 0},
          {'text': 'Haram', 'score': 0},
        ]
      },
      {
        'question': 'Berapa jumlah rakaat shalat Maghrib?',
        'answers': [
          {'text': '3', 'score': 1},
          {'text': '2', 'score': 0},
          {'text': '4', 'score': 0},
          {'text': '1', 'score': 0},
        ]
      },
      {
        'question': 'Zakat fitrah dibayarkan pada bulan?',
        'answers': [
          {'text': 'Muharram', 'score': 0},
          {'text': 'Rajab', 'score': 0},
          {'text': 'Ramadhan', 'score': 1},
          {'text': 'Syawal', 'score': 0},
        ]
      },
      {
        'question': 'Bersuci dari hadas kecil disebut?',
        'answers': [
          {'text': 'Tayamum', 'score': 0},
          {'text': 'Wudhu', 'score': 0},
          {'text': 'Mandi wajib', 'score': 0},
          {'text': 'Istinja', 'score': 1},
        ]
      },
      {
        'question': 'Apa nama kitab suci umat Islam?',
        'answers': [
          {'text': 'Injil', 'score': 0},
          {'text': 'Taurat', 'score': 0},
          {'text': 'Al-Qur’an', 'score': 1},
          {'text': 'Zabur', 'score': 0},
        ]
      },
      {
        'question': 'Shalat Subuh terdiri dari berapa rakaat?',
        'answers': [
          {'text': '2', 'score': 1},
          {'text': '3', 'score': 0},
          {'text': '4', 'score': 0},
          {'text': '1', 'score': 0},
        ]
      },
      {
        'question': 'Apa rukun Islam yang ketiga?',
        'answers': [
          {'text': 'Puasa', 'score': 0},
          {'text': 'Zakat', 'score': 1},
          {'text': 'Haji', 'score': 0},
          {'text': 'Syahadat', 'score': 0},
        ]
      },
      {
        'question': 'Puasa Ramadhan dilaksanakan selama?',
        'answers': [
          {'text': '10 hari', 'score': 0},
          {'text': '20 hari', 'score': 0},
          {'text': '1 bulan', 'score': 1},
          {'text': '2 bulan', 'score': 0},
        ]
      },
      {
        'question': 'Apa arah kiblat umat Islam?',
        'answers': [
          {'text': 'Masjid Nabawi', 'score': 0},
          {'text': 'Ka’bah', 'score': 1},
          {'text': 'Madinah', 'score': 0},
          {'text': 'Palestina', 'score': 0},
        ]
      },
    ],
    'Matematika': [
      {
        'question': 'Berapakah hasil dari 5 + 5 = ?',
        'answers': [
          {'text': '10', 'score': 1},
          {'text': '12', 'score': 0},
          {'text': '15', 'score': 0},
          {'text': '5', 'score': 0},
        ]
      },
      {
        'question': 'Berapakah hasil dari 2 x 20 = ?',
        'answers': [
          {'text': '40', 'score': 1},
          {'text': '35', 'score': 0},
          {'text': '28', 'score': 0},
          {'text': '46', 'score': 0},
        ]
      },
      {
        'question': 'Berapakah hasil dari 81 : 9 = ??',
        'answers': [
          {'text': '4', 'score': 0},
          {'text': '7', 'score': 0},
          {'text': '9', 'score': 1},
          {'text': '8', 'score': 0},
        ]
      },
      {
        'question': 'Berapakah hasil dari 91 x 2 = ?',
        'answers': [
          {'text': '152', 'score': 0},
          {'text': '182', 'score': 1},
          {'text': '154', 'score': 0},
          {'text': '189', 'score': 0},
        ]
      },
      {
        'question': 'Berapakah hasil dari 5 x 2 = ?',
        'answers': [
          {'text': '10', 'score': 1},
          {'text': '12', 'score': 0},
          {'text': '15', 'score': 0},
          {'text': '5', 'score': 0},
        ]
      },
      {
        'question': 'Berapakah hasil dari 10 : 5 = ?',
        'answers': [
          {'text': '5', 'score': 0},
          {'text': '8', 'score': 0},
          {'text': '3', 'score': 0},
          {'text': '2', 'score': 1},
        ]
      },
      {
        'question': 'Berapakah hasil dari 125 x 8 = ?',
        'answers': [
          {'text': '900', 'score': 0},
          {'text': '1000', 'score': 1},
          {'text': '1100', 'score': 0},
          {'text': '1200', 'score': 0},
        ]
      },
      {
        'question': 'Berapakah hasil dari 144 : 12 = ?',
        'answers': [
          {'text': '10', 'score': 0},
          {'text': '11', 'score': 0},
          {'text': '12', 'score': 1},
          {'text': '13', 'score': 0},
        ]
      },
      {
        'question': 'Berapakah hasil dari 3/5 + 2/10 = ?',
        'answers': [
          {'text': '4/5', 'score': 0},
          {'text': '7/10', 'score': 0},
          {'text': '8/10', 'score': 1},
          {'text': '9/10', 'score': 0},
        ]
      },
      {
        'question': 'Berapakah hasil dari 15² = ?',
        'answers': [
          {'text': '215', 'score': 0},
          {'text': '225', 'score': 1},
          {'text': '235', 'score': 0},
          {'text': '245', 'score': 0},
        ]
      },
    ],
    'Coding': [
      {
        'question': 'Bahasa pemrograman apa yang digunakan untuk Flutter?',
        'answers': [
          {'text': 'Java', 'score': 0},
          {'text': 'Dart', 'score': 1},
          {'text': 'Python', 'score': 0},
          {'text': 'C++', 'score': 0},
        ]
      },
      {
        'question': 'Apa fungsi dari print() dalam pemrograman?',
        'answers': [
          {'text': 'Menghapus data', 'score': 0},
          {'text': 'Menampilkan output', 'score': 1},
          {'text': 'Menyimpan data', 'score': 0},
          {'text': 'Mengulang data', 'score': 0},
        ]
      },
      {
        'question': 'Fungsi if digunakan untuk?',
        'answers': [
          {'text': 'Perulangan', 'score': 0},
          {'text': 'Menyimpan data', 'score': 0},
          {'text': 'Menampilkan data', 'score': 0},
          {'text': 'Percabangan kondisi', 'score': 1},
        ]
      },
      {
        'question': 'Apa tipe data untuk angka bulat?',
        'answers': [
          {'text': 'String', 'score': 0},
          {'text': 'Integer', 'score': 1},
          {'text': 'Boolean', 'score': 0},
          {'text': 'Float', 'score': 0},
        ]
      },
      {
        'question': 'Simbol untuk komentar satu baris di Python adalah?',
        'answers': [
          {'text': '//', 'score': 0},
          {'text': '<!-- -->', 'score': 0},
          {'text': '/* */', 'score': 0},
          {'text': '#', 'score': 1},
        ]
      },
      {
        'question': 'Apa fungsi dari variabel dalam pemrograman?',
        'answers': [
          {'text': 'Menghapus program', 'score': 0},
          {'text': 'Menyimpan data', 'score': 1},
          {'text': 'Mencetak kertas', 'score': 0},
          {'text': 'Menjalankan internet', 'score': 0},
        ]
      },
      {
        'question': 'Perintah untuk mencetak teks di Dart adalah?',
        'answers': [
          {'text': 'echo()', 'score': 0},
          {'text': 'show()', 'score': 0},
          {'text': 'print()', 'score': 1},
          {'text': 'display()', 'score': 0},
        ]
      },
      {
        'question': 'Tipe data String digunakan untuk?',
        'answers': [
          {'text': 'Angka desimal', 'score': 0},
          {'text': 'Nilai benar salah', 'score': 0},
          {'text': 'Teks atau karakter', 'score': 1},
          {'text': 'Bilangan bulat', 'score': 0},
        ]
      },
      {
        'question': 'Apa fungsi dari function dalam pemrograman?',
        'answers': [
          {'text': 'Menghapus data', 'score': 0},
          {'text': 'Mengelompokkan kode agar dapat digunakan kembali', 'score': 1},
          {'text': 'Mematikan program', 'score': 0},
          {'text': 'Mengganti warna aplikasi', 'score': 0},
        ]
      },
      {
        'question': 'Perulangan digunakan untuk?',
        'answers': [
          {'text': 'Mengulang proses', 'score': 1},
          {'text': 'Menghapus file', 'score': 0},
          {'text': 'Menggambar', 'score': 0},
          {'text': 'Menghubungkan internet', 'score': 0},
        ]
      },
    ],
  };

  final TextEditingController _nameController = TextEditingController();

  void _startQuiz(String category, Color color) {
    if (_nameController.text.trim().isEmpty) {
      // Peringatan jika nama belum diisi
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Silakan masukkan nama kamu terlebih dahulu!')),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => QuizPage(
          categoryName: category,
          color: color,
          questions: quizData[category] ?? [],
          playerName: _nameController.text.trim(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6F9),
      appBar: AppBar(
        title: const Text("Kuis Firebase"),
        centerTitle: true,
        backgroundColor: const Color(0xFFF8C8DC),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Kolom Input Nama Pengguna
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Masukkan Nama Kamu...",
                    icon: Icon(Icons.person, color: Colors.amber),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Pilih Kategori Quiz:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Daftar Pilihan Kategori
            Expanded(
              child: GridView.builder(
                itemCount: categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _startQuiz(categories[index], colors[index]),
                    child: Container(
                      decoration: BoxDecoration(
                        color: colors[index],
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 6,
                            offset: const Offset(2, 4),
                          )
                        ],
                      ),
                      child: Center(
                        child: Text(
                          categories[index],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  final String categoryName;
  final Color color;
  final List<Map<String, dynamic>> questions;
  final String playerName;

  const QuizPage({
    super.key,
    required this.categoryName,
    required this.color,
    required this.questions,
    required this.playerName,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int questionIndex = 0;
  int score = 0;
  bool scoreSaved = false;

  void answerQuestion(int selectedScore) {
    setState(() {
      score += selectedScore;
      
      if (questionIndex < widget.questions.length - 1) {
        questionIndex++; 
      } else {
        questionIndex++; 
        _saveScoreToFirebase(); 
      }
    });
  }


  void _saveScoreToFirebase() {
    if (scoreSaved) return; 

    final databaseRef = FirebaseDatabase.instance.ref("scores");
    
    databaseRef.child("${widget.playerName}-${widget.categoryName}").set({
      'name': widget.playerName,
      'category': widget.categoryName,
      'score': score,
      'time': DateTime.now().toString(),
    }).then((_) {
      if (mounted) {
        setState(() {
          scoreSaved = true;
        });
      }
    }).catchError((error) {
      print("Gagal menyimpan skor: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    bool finished = questionIndex >= widget.questions.length;

    if (finished) {
      // Jalankan fungsi simpan skor ke Firebase begitu kuis selesai
      _saveScoreToFirebase();

      return Scaffold(
        backgroundColor: widget.color.withOpacity(0.25),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.emoji_events, size: 80, color: Colors.amber),
              const SizedBox(height: 10),
              Text(
                "Quiz Selesai, ${widget.playerName}!",
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                "Skor Kamu: $score / ${widget.questions.length}",
                style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                scoreSaved ? "✓ Skor Berhasil Disimpan di Firebase!" : "Sedang menyimpan skor...",
                style: TextStyle(color: scoreSaved ? Colors.green : Colors.orange, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: widget.color, padding: const EdgeInsets.all(15)),
                onPressed: () => Navigator.pop(context),
                child: const Text("Kembali ke Menu Utama", style: TextStyle(color: Colors.black)),
              )
            ],
          ),
        ),
      );
    }

    final currentQuestion = widget.questions[questionIndex];
    final List<dynamic> answersList = currentQuestion['answers'] as List<dynamic>;

    return Scaffold(
      backgroundColor: widget.color.withOpacity(0.25),
      appBar: AppBar(
        title: Text("${widget.categoryName} - Soal ${questionIndex + 1}"),
        backgroundColor: widget.color,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Text(
                  currentQuestion['question'] as String,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 30),
            ...answersList.map((answer) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: widget.color,
                    padding: const EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () => answerQuestion(answer['score'] as int),
                  child: Text(
                    answer['text'] as String,
                    style: const TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}