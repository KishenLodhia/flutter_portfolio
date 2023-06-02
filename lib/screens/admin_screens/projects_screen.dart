import 'package:flutter/material.dart';
import 'package:flutter_portfolio/model/project.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:provider/provider.dart';

class AdminProjectScreen extends StatefulWidget {
  const AdminProjectScreen({super.key});

  @override
  State<AdminProjectScreen> createState() => _AdminProjectScreenState();
}

class _AdminProjectScreenState extends State<AdminProjectScreen> {
  @override
  Widget build(BuildContext context) {
    var data = context.watch<List<Project>>();
    var currentIndex = 0;

    HtmlEditorController controller = HtmlEditorController();

    if (data.isEmpty) {}
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                if (data.isEmpty) {
                  return const SizedBox(
                    height: 30,
                    child: CircularProgressIndicator(),
                  );
                }
                return ListTile(
                  title: Text(data[index].name),
                  onTap: () {
                    setState(() {
                      currentIndex = index;
                      controller.clear();
                      if (data[currentIndex].details.isEmpty) {
                        controller.setText(data[currentIndex].details);
                      }
                    });
                  },
                );
              }),
        ),
        const VerticalDivider(
          color: Colors.white,
          thickness: 0.1,
        ),
        if (data.isNotEmpty) ...[
          Flexible(
            flex: 3,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    child: HtmlEditor(
                      controller: controller,
                      htmlEditorOptions: HtmlEditorOptions(
                          hint: 'Your text here...',
                          initialText: data[currentIndex].details,
                          darkMode: true),
                      htmlToolbarOptions: const HtmlToolbarOptions(
                        toolbarType: ToolbarType.nativeGrid,
                        textStyle: TextStyle(color: Colors.black),
                        toolbarPosition: ToolbarPosition
                            .aboveEditor, //required to place toolbar anywhere!
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ]
      ],
    );
  }
}
