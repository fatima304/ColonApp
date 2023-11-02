import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Pics extends StatefulWidget {
  @override
  _PicsState createState() => _PicsState();
}

class _PicsState extends State<Pics> {
  int _currentPage = 0;
  PageController _controller = PageController();

  List<Widget> _pages = [
    Slider(image: "assets/1.jpg"),
    Slider(image: "assets/2.jpg"),
    Slider(image: "assets/Info3.jpg"),
    Slider(image: "assets/Info4.jpg"),
    Slider(image: "assets/Info6.jpg"),
    Slider(image: "assets/Info7.jpg"),
    Slider(image: "assets/Info8.jpg"),
  ];

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Tips'),
        backgroundColor: Colors.purple,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamed(context, 'main');
          },
        ),
      ),
      body: Stack(
        children: <Widget>[
          Expanded(
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              onPageChanged: _onchanged,
              controller: _controller,
              itemCount: _pages.length,
              itemBuilder: (context, int index) {
                return _pages[index];
              },
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(_pages.length, (int index) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    height: 10,
                    width: (index == _currentPage) ? 30 : 10,
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: (index == _currentPage)
                          ? Colors.purple
                          : Colors.purple.withOpacity(0.5),
                    ),
                  );
                }),
              ),
              InkWell(
                onTap: () {
                  _controller.nextPage(
                    duration: Duration(milliseconds: 800),
                    curve: Curves.easeInOutQuint,
                  );
                },
                child: Icon(
                  Icons.navigate_next,
                  size: 50,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 15),
            ],
          ),
        ],
      ),
    );
  }
}

class Slider extends StatelessWidget {
  final String image;

  Slider({required this.image});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    if (image == "assets/Info7.jpg") {
      width *= 0.8;
    }

    if (image == "assets/Info4.jpg") {
      width *= 1;
    }

    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            image,
            width: width,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 60),
        ],
      ),
    );
  }
}
