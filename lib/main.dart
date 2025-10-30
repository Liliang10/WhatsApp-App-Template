import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const WhatsAppClone());
}

class WhatsAppClone extends StatelessWidget {
  const WhatsAppClone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "WhatsApp Clone",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0B141A),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF202C33),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF202C33),
          selectedItemColor: Color(0xFF25D366),
          unselectedItemColor: Colors.grey,
        ),
      ),
      home: const WhatsAppHome(),
    );
  }
}

class WhatsAppHome extends StatefulWidget {
  const WhatsAppHome({super.key});

  @override
  State<WhatsAppHome> createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome> {
  int currentIndex = 0;

  final List<Map<String, dynamic>> chats = [
    {
      "name": "Budi",
      "messages": [
        "Besok jadi ketemu kan?",
        "Iya, jam 7 malam ya",
        "Oke, sampai ketemu!"
      ],
      "time": "10:45"
    },
    {
      "name": "Siti",
      "messages": ["Lagi di mana?", "Aku udah otw ya", "Oke, makasih yaa 🙏"],
      "time": "09:20"
    },
    {
      "name": "Andi",
      "messages": [
        "Gas main futsal nanti malam!",
        "Siap bawa bola",
        "Oke fix ya!"
      ],
      "time": "Yesterday"
    },
    {
      "name": "Rina",
      "messages": [
        "Jangan lupa bawa buku",
        "Udah aku taruh di tas",
        "Oke makasih 🙌"
      ],
      "time": "Monday"
    },
    {
      "name": "Dewi",
      "messages": [
        "Halo, gimana kabarnya?",
        "Baik-baik aja kok",
        "Alhamdulillah 👍"
      ],
      "time": "Sunday"
    },
    {
      "name": "Fajar",
      "messages": [
        "Film baru udah keluar loh!",
        "Nonton weekend yuk",
        "Siap bro!"
      ],
      "time": "Saturday"
    },
    {
      "name": "Tono",
      "messages": ["Besok libur kan?", "Iya bener", "Mantap jalan-jalan 🚗"],
      "time": "Friday"
    },
    {
      "name": "Maya",
      "messages": [
        "Tugas udah kelar?",
        "Belum nih tinggal sedikit",
        "Semangat ya 💪"
      ],
      "time": "Thursday"
    },
  ];

  final List<Map<String, dynamic>> statuses = [
    {"name": "My Status", "time": "Tap to add status update"},
    {"name": "Budi", "time": "Today, 08:30"},
    {"name": "Siti", "time": "Yesterday, 21:10"},
    {"name": "Andi", "time": "Yesterday, 18:45"},
    {"name": "Rina", "time": "Monday, 14:00"},
    {"name": "Fajar", "time": "Sunday, 19:20"},
  ];

  final List<Map<String, dynamic>> calls = [
    {"name": "Budi", "time": "Today, 09:40", "type": "missed"},
    {"name": "Siti", "time": "Yesterday, 20:15", "type": "incoming"},
    {"name": "Andi", "time": "Yesterday, 17:30", "type": "outgoing"},
    {"name": "Rina", "time": "Monday, 13:05", "type": "incoming"},
    {"name": "Dewi", "time": "Sunday, 11:00", "type": "missed"},
  ];

  Color _randomColor(String name) {
    final random = Random(name.hashCode);
    return Colors.primaries[random.nextInt(Colors.primaries.length)];
  }

  Widget _buildChats() {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        var chat = chats[index];
        var lastMsg = chat["messages"].last;
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: _randomColor(chat["name"]),
            child: Text(
              chat["name"][0],
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          title: Text(chat["name"],
              style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(lastMsg, maxLines: 1, overflow: TextOverflow.ellipsis),
          trailing: Text(chat["time"],
              style: const TextStyle(color: Colors.grey, fontSize: 12)),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ChatDetailPage(
                  name: chat["name"],
                  messages: chat["messages"],
                  color: _randomColor(chat["name"]),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildStatus() {
    return ListView.builder(
      itemCount: statuses.length,
      itemBuilder: (context, index) {
        var status = statuses[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: _randomColor(status["name"]),
            child: Text(
              status["name"][0],
              style: const TextStyle(color: Colors.white),
            ),
          ),
          title: Text(status["name"],
              style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle:
              Text(status["time"], style: const TextStyle(color: Colors.grey)),
        );
      },
    );
  }

  Widget _buildCommunities() {
    return const Center(
      child: Text("Communities feature coming soon",
          style: TextStyle(color: Colors.grey)),
    );
  }

  Widget _buildCalls() {
    return ListView.builder(
      itemCount: calls.length,
      itemBuilder: (context, index) {
        var call = calls[index];
        IconData icon;
        Color color;

        switch (call["type"]) {
          case "missed":
            icon = Icons.call_missed;
            color = Colors.red;
            break;
          case "incoming":
            icon = Icons.call_received;
            color = Colors.green;
            break;
          case "outgoing":
            icon = Icons.call_made;
            color = Colors.blue;
            break;
          default:
            icon = Icons.call;
            color = Colors.grey;
        }

        return ListTile(
          leading: CircleAvatar(
            backgroundColor: _randomColor(call["name"]),
            child: Text(
              call["name"][0],
              style: const TextStyle(color: Colors.white),
            ),
          ),
          title: Text(call["name"],
              style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle:
              Text(call["time"], style: const TextStyle(color: Colors.grey)),
          trailing: Icon(icon, color: color),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      _buildChats(),
      _buildStatus(),
      _buildCommunities(),
      _buildCalls(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("WhatsApp"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.camera_alt)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chats"),
          BottomNavigationBarItem(icon: Icon(Icons.circle), label: "Status"),
          BottomNavigationBarItem(
              icon: Icon(Icons.groups), label: "Communities"),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: "Calls"),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      floatingActionButton: currentIndex == 0
          ? FloatingActionButton(
              backgroundColor: const Color(0xFF25D366),
              onPressed: () {},
              child: const Icon(Icons.message, color: Colors.white),
            )
          : null,
    );
  }
}

class ChatDetailPage extends StatelessWidget {
  final String name;
  final List<String> messages;
  final Color color;

  const ChatDetailPage({
    super.key,
    required this.name,
    required this.messages,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF202C33),
        titleSpacing: 0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: color,
              child: Text(name[0], style: const TextStyle(color: Colors.white)),
            ),
            const SizedBox(width: 10),
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/chat_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: messages.length,
          itemBuilder: (context, index) {
            bool isMe = index % 2 == 0;
            return Align(
              alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 4),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                decoration: BoxDecoration(
                  color:
                      isMe ? const Color(0xFF005C4B) : const Color(0xFF202C33),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(messages[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}
