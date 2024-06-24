
import 'package:flutter/material.dart';
import 'package:high_school/Subjects/utils/app_colors.dart';
import 'package:high_school/componet/crud.dart';
import 'package:high_school/constant/link.dart';
import 'package:high_school/plan/cardnote.dart';
import 'package:high_school/plan/note/editenote.dart';
import 'package:shared_preferences/shared_preferences.dart';

class YourNote extends StatefulWidget {
  const YourNote({Key? key}) : super(key: key);

  @override
  State<YourNote> createState() => _YourNoteState();
}

class _YourNoteState extends State<YourNote> {
  Crud crudnotemath = Crud();

  Future<dynamic> getnote() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString("id");

    if (userId == null) {
      return {'status': 'fail'};
    }

    var response = await crudnotemath.postRequest(linkViewNote, {
      "id": userId,
    });
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Your Notes",
          style: TextStyle(
              fontFamily: "MontserratAlternates-MediumItalic",
              fontSize: 25,
              color: AppColors.white),
        ),
        backgroundColor: AppColors.yellow,
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const SizedBox(
              width: 10,
            ),
            FutureBuilder(
              future: getnote(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: Text("Loading . . ."),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      "Error: ${snapshot.error}",
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  );
                }
                if (snapshot.hasData) {
                  if (snapshot.data['status'] == 'fail') {
                    return const Center(
                      child: Text(
                        "There are no notes",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    );
                  }
                  var notesData = snapshot.data['data'];
                  if (notesData == null || notesData.isEmpty) {
                    return const Center(
                      child: Text(
                        "There are no notes",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    );
                  }
                  return ListView.builder(
                      itemCount: notesData.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, i) {
                        return cardnote(
                            ontap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => EditNote(
                                        notes: notesData[i],
                                      )));
                            },
                            title: "${notesData[i]['notes_title']}",
                            content: "${notesData[i]['notes_content']}");
                      });
                }
                return const Center(
                  child: Text("Loading . . ."),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
