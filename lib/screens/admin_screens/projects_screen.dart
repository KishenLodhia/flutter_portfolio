import 'package:flutter/material.dart';
import 'package:flutter_portfolio/model/project.dart';
import 'package:flutter_portfolio/services/firebase_service.dart';
import 'package:flutter_portfolio/utils/screen_helper.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:provider/provider.dart';
import 'package:simple_markdown_editor/widgets/markdown_form_field.dart';
import 'package:super_editor/super_editor.dart';

class AdminProjectScreen extends StatefulWidget {
  const AdminProjectScreen({super.key});

  @override
  State<AdminProjectScreen> createState() => _AdminProjectScreenState();
}

class _AdminProjectScreenState extends State<AdminProjectScreen> {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final imageController = TextEditingController();
  var htmlController = HtmlEditorController();
  List<Project> data = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    data = context.watch<List<Project>>();
  }

  @override
  Widget build(BuildContext context) {
    var currentIndex = 0;
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
                      htmlController.setText(data[currentIndex].details);
                      nameController.text = data[currentIndex].name;
                      imageController.text = data[currentIndex].image ?? '';
                      descriptionController.text =
                          data[currentIndex].description ?? '';
                      // if (data[currentIndex].details.isEmpty) {
                      //   controller.text = data[currentIndex].details;
                      // }
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
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: ElevatedButton.icon(
                            onPressed: () async {
                              var newData = Project(
                                  name: nameController.text,
                                  details: await htmlController.getText(),
                                  image: imageController.text,
                                  description: descriptionController.text);
                              FirestoreService().updateFile(newData);
                            },
                            icon: const Icon(Icons.check),
                            label: const Text('Update'),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: 300,
                            child: TextField(
                              controller: nameController,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  label: Text('Name')),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: 300,
                            child: TextField(
                              controller: imageController,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  label: Text('Image')),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextField(
                              controller: descriptionController,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  label: Text('Description')),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            color: Colors.white,
                            child:

                                // TextField(
                                //   maxLines: 30,
                                //   controller: controller,
                                //   decoration: const InputDecoration(
                                //     hintText: 'Hello',
                                //     border: OutlineInputBorder(),
                                //   ),
                                // ),

                                //     MarkdownFormField(
                                //   controller: controller,
                                //   enableToolBar: true,
                                //   emojiConvert: true,
                                //   style: const TextStyle(color: Colors.black),
                                //   autoCloseAfterSelectEmoji: false,
                                // )
                                HtmlEditor(
                              controller: htmlController,
                              htmlEditorOptions: const HtmlEditorOptions(
                                autoAdjustHeight: true,
                                hint: 'Your text here...',
                                darkMode: false,
                              ),
                              htmlToolbarOptions: const HtmlToolbarOptions(
                                toolbarType: ToolbarType.nativeGrid,
                                textStyle: TextStyle(
                                  color: Colors.black,
                                ),

                                toolbarPosition: ToolbarPosition
                                    .aboveEditor, //required to place toolbar anywhere!
                              ),
                              otherOptions: OtherOptions(
                                height: ScreenHelper.height(context) * 0.4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ]
      ],
    );
  }
}
