import 'package:flutter/material.dart';
void main() => runApp(SemuaJenisAIApp());
class SemuaJenisAIApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Semua Jenis AI', debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Color(0xFF080810)),
      home: HomePage(),
    );
  }
}
class AITool { final String name; final String icon; AITool(this.name, this.icon); }
class AICategory { final String title; final List<AITool> tools; AICategory(this.title, this.tools); }
class HomePage extends StatefulWidget { @override _HomePageState createState() => _HomePageState(); }
class _HomePageState extends State<HomePage> {
  String query = "";
  final String lynkUrl = "https://lynk.id/focusly";
  final List<AICategory> categories = [
    AICategory("CHATBOT / ASISTEN AI", [AITool("ChatGPT","🤖"),AITool("Claude","🧠"),AITool("Gemini","✨"),AITool("Perplexity","🔍"),AITool("Poe","💬"),AITool("Pi","♾️"),AITool("Character.ai","👤"),AITool("Copilot","🚀")]),
    AICategory("MESIN PENCARI AI", [AITool("Perplexity","🔍"),AITool("You.com","U"),AITool("Bing Copilot","B"),AITool("Brave Search","🦁"),AITool("Phind","P"),AITool("Komo","K"),AITool("Andi","A")]),
    AICategory("AI PENULISAN & KONTEN", [AITool("Jasper","J"),AITool("Copy.ai","©"),AITool("Writesonic","W"),AITool("Rytr","R"),AITool("Notion AI","N"),AITool("Grammarly","G"),AITool("QuillBot","Q")]),
    AICategory("AI GAMBAR / DESAIN", [AITool("DALL-E","🎨"),AITool("Midjourney","⛵"),AITool("Stable Diffusion","🌀"),AITool("Leonardo AI","🦁"),AITool("Adobe Firefly","🔥"),AITool("Ideogram","💡"),AITool("Canva AI","C"),AITool("Krea AI","K")]),
    AICategory("AI VIDEO", [AITool("Runway","🎬"),AITool("Pika Labs","✨"),AITool("Synthesia","🧑‍💻"),AITool("HeyGen","👨"),AITool("Luma Dream","🌌"),AITool("Sora","🎞️"),AITool("Veo","V"),AITool("CapCut AI","✂️")]),
    AICategory("AI AUDIO / MUSIK", [AITool("Suno","🎵"),AITool("Udio","🎶"),AITool("ElevenLabs","🔊"),AITool("Murf","🎙️"),AITool("Soundful","🎼"),AITool("Boomy","💥"),AITool("Beatoven","🥁")]),
    AICategory("AI PRESENTASI", [AITool("Gamma","Γ"),AITool("Tome","T"),AITool("Beautiful.ai","B"),AITool("SlidesAI","S"),AITool("Canva Magic","C"),AITool("Prezi","P")]),
    AICategory("AI KODE / PEMROGRAMAN", [AITool("GitHub Copilot","🐙"),AITool("Cursor","🖱️"),AITool("Codeium","C"),AITool("Replit AI","R"),AITool("Tabnine","T"),AITool("Amazon Q","Q"),AITool("Devin","D")]),
    AICategory("AI DATA & ANALISIS", [AITool("Julius AI","J"),AITool("PandasAI","🐼"),AITool("Elicit","E"),AITool("Akkio","A"),AITool("DataRobot","R"),AITool("MonkeyLearn","🐒")]),
    AICategory("AI OTOMASI & AGENT", [AITool("Zapier AI","⚡"),AITool("Make","M"),AITool("Auto-GPT","🤖"),AITool("AgentGPT","👾"),AITool("Langchain","🦜"),AITool("CrewAI","👥")]),
    AICategory("AI EDUKASI", [AITool("Khanmigo","K"),AITool("Quizlet","Q"),AITool("Photomath","📸"),AITool("Socratic","S"),AITool("Duolingo Max","🦉"),AITool("Merlin AI","M")]),
    AICategory("AI PRODUKTIVITAS", [AITool("Notion AI","N"),AITool("ClickUp AI","C"),AITool("Motion","M"),AITool("Reclaim","R"),AITool("Otter.ai","O"),AITool("Trello AI","T")]),
    AICategory("AI VOICE / SPEECH", [AITool("ElevenLabs","🔊"),AITool("PlayHT","▶️"),AITool("Murf AI","🎙️"),AITool("Resemble","👥"),AITool("Speechify","🗣️"),AITool("Whisper","🤫")]),
    AICategory("AI 3D & MODELING", [AITool("Luma AI","L"),AITool("Kaedim","K"),AITool("Meshy AI","M"),AITool("Sloyd","S"),AITool("Vizcom","V"),AITool("Tripo","T"),AITool("CSM","C")]),
    AICategory("AI KESEHATAN", [AITool("Med-PaLM","⚕️"),AITool("Hippocratic","H"),AITool("Doctronic","D"),AITool("Nabla","N"),AITool("Aidoc","A"),AITool("PathAI","P")]),
    AICategory("AI KEUANGAN", [AITool("AlphaSense","A"),AITool("FinChat","F"),AITool("Numeral","N"),AITool("Koyfin","K"),AITool("Cleo","C"),AITool("Upstart","U")]),
    AICategory("FRAMEWORK / PLATFORM AI", [AITool("OpenAI","O"),AITool("Anthropic","A"),AITool("Google DeepMind","G"),AITool("Meta AI","M"),AITool("Hugging Face","🤗"),AITool("LangChain","🦜"),AITool("Pinecone","P"),AITool("Cohere","C")]),
  ];
  @override
  Widget build(BuildContext context) {
    final filtered = categories.where((c) => query.isEmpty || c.title.toLowerCase().contains(query.toLowerCase()) || c.tools.any((t)=>t.name.toLowerCase().contains(query.toLowerCase()))).toList();
    return Scaffold(body: CustomScrollView(slivers: [
      SliverAppBar(expandedHeight: 200, pinned: true, flexibleSpace: FlexibleSpaceBar(background: Container(padding: EdgeInsets.fromLTRB(20,60,20,20), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("SEMUA JENIS", style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900)), Text("AI", style: TextStyle(fontSize: 64, fontWeight: FontWeight.w900, color: Colors.white))])))),
      SliverToBoxAdapter(child: Padding(padding: EdgeInsets.all(16), child: TextField(onChanged: (v)=>setState(()=>query=v), decoration: InputDecoration(hintText: "Cari AI...", prefixIcon: Icon(Icons.search), filled: true, fillColor: Color(0xFF15152A), border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none))))),
      SliverList(delegate: SliverChildBuilderDelegate((_,i){final cat=filtered[i]; return Container(margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8), padding: EdgeInsets.all(16), decoration: BoxDecoration(color: Color(0xFF111129), borderRadius: BorderRadius.circular(16), border: Border.all(color: Color(0xFF2A2A5A))), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(cat.title, style: TextStyle(color: Color(0xFF5EEAD4), fontWeight: FontWeight.bold)), SizedBox(height: 12), Wrap(spacing: 8, runSpacing: 8, children: cat.tools.map((t)=>Container(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(color: Color(0xFF1E1E3A), borderRadius: BorderRadius.circular(10)), child: Text(t.name, style: TextStyle(fontSize: 11)))).toList())]));}, childCount: filtered.length)),
    ]));
  }
}
