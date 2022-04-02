import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matamy/alert_dialog.dart';
import 'package:matamy/card_time.dart';
import 'package:matamy/column_type_res.dart';
import 'package:matamy/elevated_button_app.dart';

import 'container_row.dart';
import 'package:intl/intl.dart';

class ReservationScreen extends StatefulWidget {
  @override
  _ReservationScreenState createState() => _ReservationScreenState();
}

enum DefaultScrollPosition { start, bottom }

class _ReservationScreenState extends State<ReservationScreen> {
  var list = [for (var i = 0; i <= 100; i += 1) i];

  final ScrollController _controller = ScrollController();

  bool selected1 = false;
  bool selected2 = false;
  bool selected3 = false;
  bool selected4 = false;

  var timeList = [
    '12:00',
    '12:30',
    '13:00',
    '13:30',
    '14:00',
    '14:30',
    '15:00',
    '15:30',
    '16:00',
    '16:30',
    '17:00',
    '17:30',
    '18:00',
    '18:30',
    '19:00',
    '19:30',
    '20:00',
    '20:30',
    '21:00'
  ];
  int? tapindex;
  int tap2index = 1;
  int? timeindex;
  int time2index = 1;

  bool isChecked = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;

  DateTime date = DateTime.now();
  DateTime date2 = DateTime.now();
  bool posCheck = false;
  bool posCheck2 = false;

  int x = 0;

  void listenScrolling() {
    // if(_controller.position.atEdge){
    // final isLeft = _controller.position.pixels == 0;
    // final isR = _controller.position.maxScrollExtent;
    if (_controller.position.pixels <= 7) {
      setState(() {
        posCheck = true;
      });
    }
    if (_controller.position.pixels >= 4600) {
      setState(() {
        posCheck2 = true;
      });
    }
    if (_controller.position.pixels < 4600 && _controller.position.pixels > 7) {
      setState(() {
        posCheck = false;
        posCheck2 = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(listenScrolling);
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialogFun(),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff1E0E2A),
        elevation: 0,
        title: Text(
          'حجز طاولة',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 18,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 10,left: 20,right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Color(0xffFFE19C).withAlpha(80),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ContainerRow(
                      image: 'images/103.png',
                      text: 'نوع الحجز',
                      mainContainerColor:
                          isChecked ? Colors.grey.shade600 : Colors.green,
                    ),
                    ContainerRow(
                      image: 'images/102.png',
                      text: 'عدد الأشخاص',
                      mainContainerColor: isChecked == false
                          ? Colors.transparent
                          : isChecked2
                              ? Colors.grey.shade600
                              : Colors.green,
                    ),
                    ContainerRow(
                      image: 'images/101.png',
                      text: 'التاريخ',
                      mainContainerColor:
                          isChecked == false || isChecked2 == false
                              ? Colors.transparent
                              : isChecked3
                                  ? Colors.grey.shade600
                                  : Colors.green,
                    ),
                    ContainerRow(
                      image: 'images/100.png',
                      text: 'الوقت',
                      mainContainerColor: isChecked == false ||
                              isChecked2 == false ||
                              isChecked3 == false
                          ? Colors.transparent
                          : isChecked3
                              ? Colors.grey.shade600
                              : Colors.green,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 5),
                decoration: BoxDecoration(
                  color: Color(0xffFFE19C).withAlpha(80),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                      topLeft: Radius.circular(8)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(height: 5),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (selected1 != false ||
                                  selected2 != false ||
                                  selected3 != false ||
                                  selected4 != false) {
                                isChecked = true;
                              }
                            });
                          },
                          child: Image.asset(
                            isChecked
                                ? 'images/confirm_gray.png'
                                : 'images/confirm.png',
                            width: 35,
                            height: 35,
                          ),
                        ),
                        Spacer(),
                        Text(
                          'نوع الحجز',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 5),
                        Image.asset(
                          'images/103.png',
                          width: 30,
                          height: 30,
                        ),
                        SizedBox(width: 10)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 1),
                        Container(
                          color: isChecked && selected1 == true
                              ? Colors.grey.shade600
                              : Colors.transparent,
                          padding: EdgeInsets.all(5),
                          child: ColumnTypeRes(
                            onTap: () {
                              if (isChecked == false) {
                                setState(() {
                                  if (selected1 == false) {
                                    selected1 = true;
                                    selected2 = false;
                                    selected3 = false;
                                    selected4 = false;
                                  } else {
                                    selected1 = false;
                                  }
                                });
                              }
                            },
                            image: 'images/108.png',
                            type: 'VIP',
                            imageColor: selected1
                                ? Color(0xffFFE19C)
                                : Color(0xffF49400),
                          ),
                        ),
                        Container(
                          color: isChecked && selected2 == true
                              ? Colors.grey.shade600
                              : Colors.transparent,
                          padding: EdgeInsets.all(5),
                          child: ColumnTypeRes(
                            onTap: () {
                              if (isChecked == false) {
                                setState(() {
                                  if (selected2 == false) {
                                    selected1 = false;
                                    selected2 = true;
                                    selected3 = false;
                                    selected4 = false;
                                  } else {
                                    selected2 = false;
                                  }
                                });
                              }
                            },
                            image: 'images/107.png',
                            type: 'عائلة',
                            imageColor: selected2
                                ? Color(0xffFFE19C)
                                : Color(0xffF49400),
                          ),
                        ),
                        Container(
                          color: isChecked && selected3 == true
                              ? Colors.grey.shade600
                              : Colors.transparent,
                          padding: EdgeInsets.all(5),
                          child: ColumnTypeRes(
                            onTap: () {
                              if (isChecked == false) {
                                setState(() {
                                  if (selected3 == false) {
                                    selected1 = false;
                                    selected2 = false;
                                    selected3 = true;
                                    selected4 = false;
                                  } else {
                                    selected3 = false;
                                  }
                                });
                              }
                            },
                            image: 'images/105.png',
                            type: 'رجال',
                            imageColor: selected3
                                ? Color(0xffFFE19C)
                                : Color(0xffF49400),
                          ),
                        ),
                        Container(
                          color: isChecked && selected4 == true
                              ? Colors.grey.shade600
                              : Colors.transparent,
                          padding: EdgeInsets.all(5),
                          child: ColumnTypeRes(
                            onTap: () {
                              if (isChecked == false) {
                                setState(() {
                                  if (selected4 == false) {
                                    selected1 = false;
                                    selected2 = false;
                                    selected3 = false;
                                    selected4 = true;
                                  } else {
                                    selected4 = false;
                                  }
                                });
                              }
                            },
                            image: 'images/104.png',
                            type: 'نساء',
                            imageColor: selected4
                                ? Color(0xffFFE19C)
                                : Color(0xffF49400),
                          ),
                        ),
                        SizedBox(width: 1),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              isChecked
                  ? Container(
                      padding:
                          EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 5),
                      decoration: BoxDecoration(
                        color: Color(0xffFFE19C).withAlpha(80),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                            topLeft: Radius.circular(8)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (tapindex == tap2index) {
                                      isChecked2 = true;
                                    }
                                  });
                                },
                                child: Image.asset(
                                  isChecked2
                                      ? 'images/confirm_gray.png'
                                      : 'images/confirm.png',
                                  width: 35,
                                  height: 35,
                                ),
                              ),
                              Spacer(),
                              Text(
                                'عدد الأشخاص',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 15),
                              Image.asset(
                                'images/102.png',
                                width: 30,
                                height: 30,
                              ),
                              SizedBox(width: 10),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.arrow_back_ios_outlined,
                                color: posCheck ? Colors.grey : Colors.black,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: SizedBox(
                                  height: 55,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    controller: _controller,
                                    itemCount: 100,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          if (isChecked2 == false) {
                                            setState(() {
                                              tapindex = index;
                                              tap2index = index;
                                            });
                                          }
                                        },
                                        child: Card(
                                          color: tapindex != index
                                              ? Colors.white
                                              : isChecked2 && tapindex == index
                                                  ? Colors.grey.shade600
                                                  : Color(0xffF69400),
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            side: BorderSide(
                                              color: isChecked2 &&
                                                      tapindex == index
                                                  ? Colors.black
                                                  : Colors.grey.shade600,
                                              width: isChecked2 &&
                                                      tapindex == index
                                                  ? 2
                                                  : 1,
                                            ),
                                          ),
                                          child: Center(
                                            child: Padding(
                                              padding: EdgeInsets.all(12),
                                              child: Text(
                                                list
                                                    .indexOf(index + 1)
                                                    .toString(),
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: tapindex == index
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: posCheck2 ? Colors.grey : Colors.black,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  : SizedBox(),
              SizedBox(height: 10),
              isChecked && isChecked2
                  ? Container(
                      width: double.infinity,
                      height: 90,
                      padding:
                          EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 0),
                      decoration: BoxDecoration(
                        color: Color(0xffFFE19C).withAlpha(80),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                            topLeft: Radius.circular(8)),
                      ),
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 80,
                            child: Stack(
                              children: [
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (date == date2) {
                                            isChecked3 = true;
                                          }
                                        });
                                      },
                                      child: Image.asset(
                                        isChecked3
                                            ? 'images/confirm_gray.png'
                                            : 'images/confirm.png',
                                        width: 35,
                                        height: 35,
                                        alignment: Alignment.topLeft,
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      'حدد التاريخ',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey.shade600,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Image.asset(
                                      'images/101.png',
                                      width: 30,
                                      height: 30,
                                    ),
                                    SizedBox(width: 10),
                                  ],
                                ),
                                Positioned(
                                  left: 80,
                                  right: 80,
                                  top: 30,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 5,
                                      minimumSize: Size(60, 50),
                                      primary: isChecked3
                                          ? Colors.grey.shade600
                                          : Color(0xffF49400),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    onPressed: () async {
                                      if (isChecked3 == false) {
                                        DateTime? newdate =
                                            await showDatePicker(
                                                context: context,
                                                initialDate: date,
                                                firstDate: DateTime(1900),
                                                lastDate: DateTime(2100),
                                                builder: (context, child) {
                                                  return Theme(
                                                    data: Theme.of(context)
                                                        .copyWith(
                                                      colorScheme:
                                                          ColorScheme.light(
                                                        primary:
                                                            Color(0xffF69400),
                                                        // header background color
                                                        onPrimary: Colors.black,
                                                        // header text color
                                                        onSurface: Color(
                                                            0xffF69400), // body text color
                                                      ),
                                                      textButtonTheme:
                                                          TextButtonThemeData(
                                                        style: TextButton
                                                            .styleFrom(
                                                          primary: Color(
                                                              0xffF69400), // button text color
                                                        ),
                                                      ),
                                                    ),
                                                    child: child!,
                                                  );
                                                });
                                        if (newdate == null) return;

                                        setState(() {
                                          date = newdate;
                                          date2 = newdate;
                                        });
                                      }
                                    },
                                    child: Text(
                                      DateFormat('E - dd MMMM yyyy')
                                          .format(date)
                                          .toString(),
                                      // '${date.day} / ${date.month} / ${date.year}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : SizedBox(),
              SizedBox(height: 10),
              isChecked && isChecked2 && isChecked3
                  ? Container(
                      padding: EdgeInsets.only(
                          top: 0, left: 0, right: 0, bottom: 10),
                      decoration: BoxDecoration(
                        color: Color(0xffFFE19C).withAlpha(80),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                            topLeft: Radius.circular(8)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (timeindex == time2index) {
                                      isChecked4 = true;
                                    }
                                  });
                                },
                                child: Image.asset(
                                  isChecked4
                                      ? 'images/confirm_gray.png'
                                      : 'images/confirm.png',
                                  width: 35,
                                  height: 35,
                                ),
                              ),
                              Spacer(),
                              Text(
                                'الأوقات المتاحة',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 15),
                              Image.asset(
                                'images/100.png',
                                width: 30,
                                height: 30,
                              ),
                              SizedBox(width: 10),
                            ],
                          ),
                          SizedBox(
                            height: 160,
                            child: GridView.builder(
                              itemCount: timeList.length,
                              itemBuilder: (context, index) {
                                return CardTime(
                                  time: timeList[index],
                                  onTap: () {
                                    if (isChecked4 == false) {
                                      setState(() {
                                        timeindex = index;
                                        time2index = index;
                                      });
                                    }
                                  },
                                  backColor: timeindex != index
                                      ? Colors.white
                                      : isChecked4 && timeindex == index
                                          ? Colors.grey.shade600
                                          : Color(0xffF49400),
                                  colorBord: isChecked4 && timeindex == index
                                      ? Colors.black
                                      : Colors.transparent,
                                  widthBord:
                                      isChecked4 && timeindex == index ? 3 : 0,
                                );
                              },
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 5,
                                crossAxisSpacing: 0,
                                mainAxisSpacing: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : SizedBox(),
              SizedBox(height: 15),
              isChecked && isChecked2 && isChecked3 && isChecked4
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 0),
                        ElevatedButtonApp(
                          text: 'الغاء الحجز',
                          image: 'images/201.png',
                          onTap: () {
                            setState(() {
                              tapindex;
                              tap2index = 1;
                              timeindex;
                              time2index = 1;

                              isChecked = false;
                              isChecked2 = false;
                              isChecked3 = false;
                              isChecked4 = false;

                              date = DateTime.now();
                              date2 = DateTime.now();
                              selected1 = false;
                              selected2 = false;
                              selected3 = false;
                              selected4 = false;
                            });
                          },
                        ),
                        ElevatedButtonApp(
                          text: 'تاكيد الحجز',
                          image: 'images/200.png',
                          onTap: _onWillPop,
                        ),
                        SizedBox(width: 0),
                      ],
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
