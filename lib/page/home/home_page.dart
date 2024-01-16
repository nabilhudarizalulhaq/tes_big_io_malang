import 'package:flutter/material.dart';
import 'package:test_big_io_mobile_dev/models/get_list_models.dart';
import 'package:test_big_io_mobile_dev/page/detail/detail_page.dart';
import 'package:test_big_io_mobile_dev/service/service.dart';
import 'package:test_big_io_mobile_dev/shared/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Result> infoList = [];
  List<Result> _infoList = [];

  void fetchList() async {
    final result = await InfoListService.fetchList();
    infoList = result;
    setState(() {
      infoList;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchList();
  }

  void updateList(String val) async {
    final result = await InfoListService.fetchList();
    _infoList = result;
    setState(() {
      if (val.isEmpty) {
        _infoList = result;
      } else {
        result
            .where((element) => element.name
                .toString()
                .toLowerCase()
                .contains(val.toString().toLowerCase().toString()))
            .toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: Text(
          'Home',
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                updateList(value);
              },
              decoration: InputDecoration(
                  label: Text(
                    'search',
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  ),
                  suffixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DetailPage()),
                  );
                },
                child: ListView.builder(
                  itemCount: _infoList.length,
                  itemBuilder: (context, index) {
                    final list = _infoList[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 22,
                        vertical: 10,
                      ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          width: 2,
                          color: redColor,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 75,
                              width: 75,
                              decoration: BoxDecoration(
                                color: blackColor,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(list.image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  list.name,
                                  style: blackTextStyle.copyWith(
                                    fontSize: 22,
                                    fontWeight: semiBold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  list.species,
                                  style: blackTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: semiBold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  '${list.id}'.toString(),
                                  style: blackTextStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: semiBold,
                                  ),
                                )
                              ],
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite_border_outlined,
                                color: redColor,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
