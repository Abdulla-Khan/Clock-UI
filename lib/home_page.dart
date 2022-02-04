import 'package:alarm_ui/clock_view.dart';
import 'package:flutter/material.dart';
import "package:intl/intl.dart";

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedT = DateFormat('HH:mm').format(now);
    var formattedD = DateFormat('EEE, d MMM').format(now);
    var timezone = now.timeZoneOffset.toString().split('.').first;
    var off = '';
    if (!timezone.startsWith('-')) {
      off = '+';
    }
    return Scaffold(
        backgroundColor: const Color(0xFF2D2F41),
        body: Row(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildButton('Clock', 'assets/clock_icon.png'),
              buildButton('Alarm', 'assets/alarm_icon.png'),
              buildButton('Timer', 'assets/timer_icon.png'),
              buildButton('StopWatch', 'assets/stopwatch_icon.png')
            ],
          ),
          const VerticalDivider(
            color: Colors.white54,
            width: .5,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Text(
                      'Clock',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          formattedT,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 64),
                        ),
                        Text(
                          formattedD,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                      flex: 4,
                      fit: FlexFit.tight,
                      child: Align(
                          alignment: Alignment.center,
                          child: ClockView(
                            size: MediaQuery.of(context).size.height / 4,
                          ))),
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'TimeZone',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.language,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Text(
                              'UTC' + off + timezone,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 14),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]));
  }

  Padding buildButton(String title, String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: MaterialButton(
        splashColor: const Color(0xFF2D2F41),
        highlightColor: const Color(0xFF2D2F41),
        onPressed: () {},
        child: Column(
          children: [
            Image.asset(
              image,
              scale: 1.5,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
