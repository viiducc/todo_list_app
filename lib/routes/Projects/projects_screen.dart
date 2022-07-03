import 'package:flutter/material.dart';
import 'package:todo_list_app/data/project_list.dart';
import 'package:todo_list_app/models/project.dart';

class Project extends StatefulWidget {
  const Project({Key? key}) : super(key: key);

  @override
  _ProjectState createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  List<ProjectModel> items = List.of(projectList);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFFDFDFD),
      appBar: AppBar(
        shadowColor: Color(0xFFFFFFFF),
        backgroundColor: Color(0xFFFFFFFF),
        automaticallyImplyLeading: false,
        title: const Text(
          'Project',
          style: TextStyle(
            color: Color(0xFF313131),
            fontFamily: 'AvenirNextRoundedPro',
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 40, horizontal: 16),
              child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: items.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 4.0),
                  itemBuilder: (context, index) {
                    final item = items[index];

                    return Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 26, horizontal: 26),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadiusDirectional.circular(5),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              color: Color(item.color)
                                  .withOpacity(0.25), // border color
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(6), // border width
                              child: Container(
                                // or ClipRRect if you need to clip the content
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(item.color),
                                ),
                                child: Container(), // inner content
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 46,
                          ),
                          Text(
                            item.name,
                            style: const TextStyle(
                              color: Color(0xFF313131),
                              fontFamily: 'AvenirNextRoundedPro',
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Text(
                            '10 Tasks',
                            style: TextStyle(
                              color: Color(0xFF9A9A9A),
                              fontFamily: 'AvenirNextRoundedPro',
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            InkWell(
              child: Container(
                margin: const EdgeInsets.only(left: 20),
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadiusDirectional.circular(5)),
                child: const Center(
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(24),
                          height: 250,
                          width: 327,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Title',
                                style: TextStyle(
                                  color: Color(0xFF313131),
                                  fontFamily: 'AvenirNextRoundedPro',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              TextFormField(
                                maxLines: 3,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    color: Color(0xFF313131),
                                    fontFamily: 'AvenirNextRoundedPro',
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                style: const TextStyle(
                                    fontFamily: 'AvenirNextRoundedPro',
                                    fontSize: 18),
                              ),
                              const Text(
                                'Choose Color',
                                style: TextStyle(
                                    color: Color(0xFF313131),
                                    fontFamily: 'AvenirNextRoundedPro',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 17),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width: 48,
                                      height: 48,
                                      decoration: BoxDecoration(
                                          color: Color(0xFF6074F9),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                    Container(
                                      width: 48,
                                      height: 48,
                                      decoration: BoxDecoration(
                                          color: Color(0xFFE42B6A),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                    Container(
                                      width: 48,
                                      height: 48,
                                      decoration: BoxDecoration(
                                          color: Color(0xFF5ABB56),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                    Container(
                                      width: 48,
                                      height: 48,
                                      decoration: BoxDecoration(
                                          color: Color(0xFF3D3A62),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                    Container(
                                      width: 48,
                                      height: 48,
                                      decoration: BoxDecoration(
                                          color: Color(0xFFF4CA8F),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
            )
          ],
        ),
      ),
    );
  }
}
