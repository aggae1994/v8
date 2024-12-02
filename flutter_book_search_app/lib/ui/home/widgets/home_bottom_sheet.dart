import 'package:flutter/material.dart';
import 'package:flutter_book_search_app/ui/detail/widgets/detail_page.dart';

class HomeBottomSheet extends StatelessWidget {
  HomeBottomSheet();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: 50,
      ),
      child: Row(
        children: [
          Image.network(
            'https://picsum.photos/300/400',
            fit: BoxFit.fitHeight,
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '해리포터와 마법사의 돌',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'J.K. 롤링',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                Text(
                  '마법사의 돌을 찾아 모험을 떠나는 해리포터',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    // 자세히 보기 터치했을 때 DetailPage로 가게 미리 구현
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return DetailPage();
                      },
                    ));
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50, // UX 고려한 높이
                    alignment: Alignment.center,
                    color: Colors.transparent,
                    child: Text(
                      '자세히 보기',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
