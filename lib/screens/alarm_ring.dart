// ignore_for_file: unnecessary_string_interpolations

import 'package:alarm/alarm.dart';
import 'package:alarm/model/alarm_settings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AlarmScreen extends StatelessWidget {
  final AlarmSettings alarmSettings;

  const AlarmScreen({super.key, required this.alarmSettings});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) => false,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Medication Reminder',
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //notify bell
                Image.asset(
                  'lib/assets/images/bell.png',
                  color: const Color.fromARGB(255, 241, 250, 251),
                  colorBlendMode: BlendMode.darken,
                  height: 60.0,
                ),
                const SizedBox(
                  height: 10,
                ),
                //med reminder text
                Text(
                  '${alarmSettings.notificationBody}',
                  style: GoogleFonts.roboto(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                // image
                Opacity(
                  opacity: 0.8,
                  child: Image.asset(
                    'lib/assets/images/taking_med.png',
                    color: const Color.fromARGB(255, 241, 250, 251),
                    colorBlendMode: BlendMode.darken,
                    height: 250.0,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //action buttons
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Skip button
                        SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.40,
                          child: TextButton(
                            onPressed: () {
                              Alarm.stop(alarmSettings.id)
                                  .then((_) => Navigator.pop(context));
                            },
                            style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  Color.fromARGB(255, 217, 237, 239)),
                              foregroundColor: MaterialStatePropertyAll(
                                  Color.fromRGBO(4, 95, 165, 1)),
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                            child: Text(
                              'Skip',
                              style: GoogleFonts.roboto(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        //Snooze
                        SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.40,
                          child: TextButton(
                            onPressed: () {
                              final now = DateTime.now();
                              Alarm.set(
                                alarmSettings: alarmSettings.copyWith(
                                  dateTime: DateTime(
                                    now.year,
                                    now.month,
                                    now.day,
                                    now.hour,
                                    now.minute,
                                    0,
                                    0,
                                  ).add(const Duration(minutes: 1)),
                                ),
                              ).then((_) => Navigator.pop(context));
                            },
                            style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  Color.fromARGB(255, 217, 237, 239)),
                              foregroundColor: MaterialStatePropertyAll(
                                  Color.fromRGBO(4, 95, 165, 1)),
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                            child: Text(
                              'Snooze',
                              style: GoogleFonts.roboto(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //Take
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: FilledButton(
                        onPressed: () {
                          Alarm.stop(alarmSettings.id)
                              .then((_) => Navigator.pop(context));
                        },
                        style: const ButtonStyle(
                          elevation: MaterialStatePropertyAll(2),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        child: Text(
                          'Take',
                          style: GoogleFonts.roboto(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
