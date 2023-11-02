import 'package:flutter/material.dart';
import '../helper/color.dart';
import '../helper/routes.dart';
import '../model/category.dart';

Future<void> homeCategory(context) async {
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
          child: Container(
              color: const Color(0xFF2D3438), child: const CategoryFilter()));
    },
  );
}

class CategoryFilter extends StatefulWidget {
  const CategoryFilter({Key? key}) : super(key: key);

  @override
  State<CategoryFilter> createState() => _CategoryFilterState();
}

class _CategoryFilterState extends State<CategoryFilter> {
  List<bool> isTabSelectedList = List.generate(11, (index) => index == 0);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Explore Categories",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.47,
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: categories.length,
                      itemBuilder: (context, i) {
                        return buildTabButton(
                            categories[i].name, isTabSelectedList[i], () {
                          setState(() {
                            for (int j = 0; j < isTabSelectedList.length; j++) {
                              isTabSelectedList[j] = (i == j);
                            }
                          });
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: TextFormField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        fillColor: colors.textFieldBG,
                        filled: true,
                        hintText: 'Search',
                        hintStyle: const TextStyle(color: Colors.white),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 1)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 1)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 1)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 1)),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  for (int i = 0; i < categories.length; i++)
                    if (isTabSelectedList[i])
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              categories[i].name,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.35,
                              child: GridView.builder(
                                shrinkWrap: true,
                                physics: const AlwaysScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 2,
                                  childAspectRatio: 0.75,
                                ),
                                itemCount: categories[i].categoryList.length,
                                itemBuilder: (context, j) {
                                  return InkWell(
                                    onTap: () {
                                      Routes.navigateToCategoryDetailScreen(
                                          context);
                                    },
                                    child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.2,
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            categories[i]
                                                .categoryList[j]
                                                .categoryImage,
                                            height: 70,
                                            width: 90,
                                            fit: BoxFit.fitHeight,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            categories[i]
                                                .categoryList[j]
                                                .categoryName,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildTabButton(String label, bool isSelected, VoidCallback onPressed) {
    return Container(
      color: colors.textFieldBG,
      width: MediaQuery.of(context).size.width * 0.35,
      height: 55,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: isSelected ? colors.buttonColor : Colors.transparent,
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
        ),
      ),
    );
  }
}
