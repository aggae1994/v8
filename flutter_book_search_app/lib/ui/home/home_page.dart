import 'package:flutter/material.dart';
import 'package:flutter_book_search_app/ui/home/widgets/home_bottom_sheet.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textEditingController = TextEditingController();

  void search(String text) {
    print("search");
  }

  @override
  void dispose() {
    // 4. TextEditingController 는 반드시 사용 다하면 dispose를 호출해줘야 메모리에서 제거됨!
    // 소거해주려면 StatefulWidget 사용!
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 3. UX 고려하기
        // 현재 위젯(HomePage)에서 포커스를 가지고 있는 위젯이 있으면 포커스 해제해줌
        // TextField
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          // 1. TextField 구현
          title: TextField(
            maxLines: 1,
            // TextField의 값을 검색 아이콘 터치했을때에도 사용할거라 사용!
            controller: textEditingController,
            onSubmitted: search,
            // 2. TextStyle 꾸미기
            decoration: InputDecoration(
              hintText: '검색어를 입력해 주세요',
              border: MaterialStateOutlineInputBorder.resolveWith(
                (states) {
                  // MaterialStateOutlineInputBorder.resolveWith를 사용하면
                  // TextField의 값이 바뀔때마다 WidgetState enum 값을 전달해서 이 함수 실행!
                  // print(states);
                  if (states.contains(WidgetState.focused)) {
                    return OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    );
                  }
                  return OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  );
                },
              ),
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                // textEditingController의 text 속성으로 TextField의 값을 가져옴
                search(textEditingController.text);
              },
              child: Container(
                // 중요!!! UX를 위한 터치 반경
                // 최소 44 => MS에서 실험했을 때 7mm, 기기픽셀로 44 픽셀이
                // 100번 터치했을 때 1 번 꼴로 실수 나왔음
                width: 50,
                height: 50,
                // Container에 배경색 지정하지 않으면 child, 여기서 Icon에만 터치 이벤트 적용
                color: Colors.transparent,
                child: Icon(Icons.search),
              ),
            ),
          ],
        ),
        body: GridView.builder(
          padding: EdgeInsets.all(20),
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 3 / 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                print('item tap');
              },
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return HomeBottomSheet();
                    },
                  );
                },
                child: Image.network(
                  'https://picsum.photos/300/400',
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
