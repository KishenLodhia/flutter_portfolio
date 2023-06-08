import 'package:flutter/material.dart';
import 'package:flutter_portfolio/model/project.dart';
import 'package:flutter_portfolio/services/firebase_service.dart';
import 'package:flutter_portfolio/utils/screen_helper.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
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
  var currentIndex = 0;
  bool addingData = false;
  var focusNode = FocusNode();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    data = context.watch<List<Project>>();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: ListView.builder(
              itemCount: data.length + 1,
              itemBuilder: (context, index) {
                if (data.isEmpty) {
                  return const SizedBox(
                    height: 30,
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                //add new list tile
                if (index == data.length) {
                  return ListTile(
                    title: const Text('Add new'),
                    tileColor:
                        currentIndex == index ? Colors.blue.shade600 : null,
                    onTap: () {
                      setState(() {
                        addingData = true;
                        currentIndex = index;
                        htmlController.clear();
                        nameController.clear();
                        imageController.clear();
                        descriptionController.clear();
                      });
                    },
                  );
                } else {
                  return ListTile(
                    tileColor:
                        currentIndex == index ? Colors.blue.shade600 : null,
                    title: Text(data[index].name),
                    onTap: () {
                      setState(() {
                        addingData = false;
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
                }
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
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              if (addingData) ...[
                                ElevatedButton.icon(
                                  onPressed: () async {
                                    if (await htmlController.getText() == '' ||
                                        nameController.text.isEmpty ||
                                        imageController.text.isEmpty ||
                                        descriptionController.text.isEmpty) {
                                      if (context.mounted) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          (const SnackBar(
                                            content:
                                                Text('Fields cannot be empty'),
                                          )),
                                        );
                                      }
                                    } else {
                                      var newData = Project(
                                          name: nameController.text,
                                          details:
                                              await htmlController.getText(),
                                          image: imageController.text,
                                          description:
                                              descriptionController.text);
                                      FirestoreService().createProject(newData);
                                    }
                                  },
                                  icon: const Icon(Icons.check),
                                  label: const Text('Create'),
                                ),
                              ] else ...[
                                ElevatedButton.icon(
                                  onPressed: () async {
                                    var newData = Project(
                                        name: nameController.text,
                                        details: await htmlController.getText(),
                                        image: imageController.text,
                                        description:
                                            descriptionController.text);
                                    FirestoreService().updateFile(newData);
                                  },
                                  icon: const Icon(Icons.check),
                                  label: const Text('Update'),
                                ),
                                ElevatedButton.icon(
                                  onPressed: () async {
                                    showDialog(
                                        context: context,
                                        builder: (_) {
                                          return PointerInterceptor(
                                            child: AlertDialog(
                                              backgroundColor: Colors.blue,
                                              title: const Text('Danger'),
                                              content:
                                                  const Text('Confirm Delete?'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text('No'),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    FirestoreService()
                                                        .deleteProject(
                                                            data[currentIndex]
                                                                .name);
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text('Yes'),
                                                ),
                                              ],
                                            ),
                                          );
                                        });
                                  },
                                  icon: const Icon(Icons.delete),
                                  label: const Text('Delete'),
                                ),
                              ],
                            ],
                          ),
                        ),
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
                          margin: const EdgeInsets.all(10),
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: HtmlEditor(
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
