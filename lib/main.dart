import 'package:flutter/material.dart';

void main() => runApp(FocuslyStudioApp());

class FocuslyStudioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Focusly Studio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF050508),
        primaryColor: Color(0xFF4F46E5),
      ),
      home: MainTabs(),
    );
  }
}

class MainTabs extends StatefulWidget {
  @override
  _MainTabsState createState() => _MainTabsState();
}

class _MainTabsState extends State<MainTabs> {
  int _index = 0;
  final tabs = [
    SemuaJenisAITab(),
    WebStudioTab(),
    WebTerminalTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        backgroundColor: Color(0xFF0A0A12),
        selectedItemColor: Color(0xFF4ADE80),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.auto_awesome), label: 'Semua AI'),
          BottomNavigationBarItem(icon: Icon(Icons.web), label: 'WebStudio'),
          BottomNavigationBarItem(icon: Icon(Icons.terminal), label: 'Terminal'),
        ],
      ),
    );
  }
}

// TAB 1: SEMUA JENIS AI - Poster 1080x4500
class SemuaJenisAITab extends StatefulWidget {
  @override
  _SemuaJenisAITabState createState() => _SemuaJenisAITabState();
}

class _SemuaJenisAITabState extends State<SemuaJenisAITab> {
  String query = "";
  final categories = [
    {"title": "CHATBOT / ASISTEN AI", "tools": ["ChatGPT","Claude","Gemini","Perplexity","Poe","Pi","Character.ai","Copilot"]},
    {"title": "AI GAMBAR / DESAIN", "tools": ["DALL-E","Midjourney","Stable Diffusion","Leonardo AI","Adobe Firefly","Ideogram","Canva AI","Krea"]},
    {"title": "AI VIDEO", "tools": ["Runway","Pika Labs","Synthesia","HeyGen","Luma Dream","Sora","Veo","CapCut AI"]},
    {"title": "AI AUDIO / MUSIK", "tools": ["Suno","Udio","ElevenLabs","Murf","Soundful","Boomy","Beatoven"]},
    {"title": "AI KODE / PEMROGRAMAN", "tools": ["GitHub Copilot","Cursor","Codeium","Replit AI","Tabnine","Amazon Q","Devin"]},
    {"title": "AI PRESENTASI", "tools": ["Gamma","Tome","Beautiful.ai","SlidesAI","Canva Magic","Prezi"]},
    {"title": "AI DATA", "tools": ["Julius AI","PandasAI","Elicit","Akkio","DataRobot"]},
    {"title": "AI OTOMASI", "tools": ["Zapier AI","Make","Auto-GPT","AgentGPT","Langchain","CrewAI"]},
    {"title": "FRAMEWORK AI", "tools": ["OpenAI","Anthropic","Google DeepMind","Meta AI","Hugging Face","Pinecone","Cohere"]},
  ];

  @override
  Widget build(BuildContext context) {
    final filtered = categories.where((c) => query.isEmpty || c['title'].toString().toLowerCase().contains(query.toLowerCase())).toList();
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 180, pinned: true, backgroundColor: Color(0xFF0A0A1A),
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("SEMUA JENIS", style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900)),
                Text("AI", style: TextStyle(fontSize: 52, fontWeight: FontWeight.w900, color: Color(0xFFA855F7))),
                Container(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4), decoration: BoxDecoration(color: Color(0xFF2A1F6B), borderRadius: BorderRadius.circular(20)), child: Text("56+ TOOLS DALAM 1 APP • Rp 59.000", style: TextStyle(fontSize: 10))),
              ]),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(padding: EdgeInsets.all(16), child: TextField(onChanged: (v)=>setState(()=>query=v), decoration: InputDecoration(hintText: "Cari AI...", prefixIcon: Icon(Icons.search), filled: true, fillColor: Color(0xFF15152A), border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none))))),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((_, i){
            final cat = filtered[i];
            return Container(margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6), padding: EdgeInsets.all(14), decoration: BoxDecoration(color: Color(0xFF111129), borderRadius: BorderRadius.circular(14), border: Border.all(color: Color(0xFF2A2A5A))), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(cat['title'] as String, style: TextStyle(color: Color(0xFF5EEAD4), fontWeight: FontWeight.bold, fontSize: 12)), SizedBox(height: 8), Wrap(spacing: 6, runSpacing: 6, children: (cat['tools'] as List<String>).map((t)=> Container(padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: Color(0xFF1E1E3A), borderRadius: BorderRadius.circular(8)), child: Text(t, style: TextStyle(fontSize: 10)))).toList())]));
          }, childCount: filtered.length),
        ),
      ],
    );
  }
}

// TAB 2: WEBSTUDIO PWA - Fix Preview
class WebStudioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(title: Text("WebStudio PWA", style: TextStyle(fontSize: 14)), backgroundColor: Color(0xFF0A0A12), actions: [Chip(label: Text("PWA", style: TextStyle(fontSize: 10)), backgroundColor: Color(0xFF1E3A5F))]),
        Padding(padding: EdgeInsets.all(8), child: Row(children: [Text("Split: ↔ Horiz ↕ Vert 📄 Kode 📘 Preview", style: TextStyle(fontSize: 10, color: Colors.grey)), Spacer(), Chip(label: Text("Responsiv"), backgroundColor: Color(0xFF1F1F2E))]) ),
        Container(padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6), color: Color(0xFF0F172A), child: Row(children: [Icon(Icons.circle, size: 8, color: Colors.green), SizedBox(width: 6), Text("Live Preview Real-Time", style: TextStyle(fontSize: 11)), Spacer(), Text("Render instan tanpa refresh", style: TextStyle(fontSize: 9, color: Colors.grey))])),
        Expanded(child: Container(margin: EdgeInsets.all(8), decoration: BoxDecoration(color: Color(0xFF0D0D1A), borderRadius: BorderRadius.circular(12), border: Border.all(color: Color(0xFF2A2A4A))), child: ListView(padding: EdgeInsets.all(16), children: [
          Text("~\$ git add --help", style: TextStyle(color: Color(0xFF5EEAD4), fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          // FIX: Di Flutter pakai Table / Row, bukan word-break
          _termRow("-n, --[no-]dry-run", "dry run"),
          _termRow("-v, --[no-]verbose", "be verbose"),
          _termRow("-i, --[no-]interactive", "interactive picking"),
          _termRow("-p, --[no-]patch", "select hunks interactively"), // INI YANG TADI KE-POTONG, SEKARANG AMAN
          _termRow("-N, --[no-]intent-to-add", "record only the fact that the path will be added later"),
          _termRow("-A, --[no-]all", "add changes from all tracked and untracked files"),
          _termRow("--[no-]pathspec-from-file <file>", "read pathspec from file"),
          _termRow("--[no-]pathspec-file-nul", "with --pathspec-from-file, pathspec elements are separated with NUL"),
          SizedBox(height: 20),
          Container(padding: EdgeInsets.all(10), decoration: BoxDecoration(color: Color(0xFF1A1A2E), borderRadius: BorderRadius.circular(8)), child: Text("✅ FIX V4.2: Di Flutter pakai Row+Expanded, kata 'interactively' tidak akan ke-potong jadi 2 baris kayak di screenshot PWA tadi!", style: TextStyle(fontSize: 11, color: Color(0xFF4ADE80)))),
        ]))),
        Container(padding: EdgeInsets.all(8), color: Color(0xFF111119), child: Row(children: [Text("~\$", style: TextStyle(color: Color(0xFF4ADE80))), SizedBox(width: 8), Expanded(child: TextField(decoration: InputDecoration(hintText: "ketik command", hintStyle: TextStyle(fontSize: 12), filled: true, fillColor: Color(0xFF0D0D1A), border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)), contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8)))), SizedBox(width: 8), ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF4ADE80)), child: Text("Run", style: TextStyle(color: Colors.black)))])),
      ],
    );
  }

  Widget _termRow(String opt, String desc){
    return Padding(padding: EdgeInsets.symmetric(vertical: 3), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(width: 160, child: Text(opt, style: TextStyle(fontSize: 11, color: Colors.white, fontFamily: 'monospace'))),
      Expanded(child: Text(desc, style: TextStyle(fontSize: 11, color: Color(0xFF8B8CFF), fontFamily: 'monospace'), softWrap: true)), // softWrap true = gak potong kata
    ]));
  }
}

// TAB 3: WEB TERMINAL - Full
class WebTerminalTab extends StatefulWidget {
  @override
  _WebTerminalTabState createState() => _WebTerminalTabState();
}

class _WebTerminalTabState extends State<WebTerminalTab> {
  final TextEditingController _controller = TextEditingController();
  String output = "~\$ git add --help\n-n, --dry-run      dry run\n-v, --verbose      be verbose\n-i, --interactive  interactive picking\n-p, --patch        select hunks interactively\n\n~\$ ";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(title: Text("Web Terminal PRO V4.1"), backgroundColor: Color(0xFF0A0A12)),
        Expanded(child: Container(margin: EdgeInsets.all(8), padding: EdgeInsets.all(12), decoration: BoxDecoration(color: Color(0xFF0D0D1A), borderRadius: BorderRadius.circular(12)), child: SingleChildScrollView(child: SelectableText(output, style: TextStyle(fontFamily: 'monospace', fontSize: 12, color: Color(0xFFC7D2FE)))))),
        Container(padding: EdgeInsets.all(8), color: Color(0xFF111119), child: Row(children: [Text("~\$", style: TextStyle(color: Color(0xFF4ADE80))), SizedBox(width: 8), Expanded(child: TextField(controller: _controller, onSubmitted: (v){setState(()=> output += "\n~\$ $v\n[output $v]\n~\$ "); _controller.clear();}, decoration: InputDecoration(hintText: "ketik command", filled: true, fillColor: Color(0xFF0D0D1A), border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))))), SizedBox(width: 8), ElevatedButton(onPressed: (){setState(()=> output += "\n~\$ ${_controller.text}\n[output]\n~\$ "); _controller.clear();}, style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF4ADE80)), child: Text("Run", style: TextStyle(color: Colors.black)))])),
      ],
    );
  }
}
