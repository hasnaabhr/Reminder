// ignore_for_file: unused_field, library_private_types_in_public_api, non_constant_identifier_names, prefer_const_constructors, avoid_print

import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/components/controller_data.dart';
import 'package:project/components/language_constants.dart';
import 'package:weekday_selector/weekday_selector.dart';

class AddMediFrequency extends StatefulWidget {
  const AddMediFrequency({super.key});

  @override
  _AddMediFrequencyState createState() => _AddMediFrequencyState();
}

List<bool> values = List.filled(7, false);

class _AddMediFrequencyState extends State<AddMediFrequency> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _medicationFrequencyController =
      MedicationControllerData().medicationFrequencyController;

  final TextEditingController _medicationFrequency_isSpecificDays_Controller =
      MedicationControllerData().medicationFrequency_isSpecificDays_Controller;
  final TextEditingController _medicationFrequency_weekday_Controller =
      MedicationControllerData().medicationFrequency_weekday_Controller;
  bool showFrequencySection = true;
  bool showDaysSection = false;

  List<String> specificDays = [];
  List<int> weekdays = [];

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: const Color.fromRGBO(4, 95, 165, 1),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  bool isDaySelected() {
    for (var element in values) {
      if (element == true) {
        return true;
      }
    }
    return false;
  }

  void addToSpecificDays() {
    for (int i = 0; i < values.length; i++) {
      print(values[i]);
      if (values[i] == true) {
        switch (i) {
          case 0:
            specificDays.add('Sun');
            weekdays.add(DateTime.sunday);
            break;
          case 1:
            specificDays.add('Mon');
            weekdays.add(DateTime.monday);
            break;
          case 2:
            specificDays.add('Tue');
            weekdays.add(DateTime.tuesday);
            break;
          case 3:
            specificDays.add('Wed');
            weekdays.add(DateTime.wednesday);
            break;
          case 4:
            specificDays.add('Thu');
            weekdays.add(DateTime.thursday);
            break;
          case 5:
            specificDays.add('Fri');
            weekdays.add(DateTime.friday);
            break;
          case 6:
            specificDays.add('Sat');
            weekdays.add(DateTime.saturday);
            break;
          default:
            break;
        }
      }
    }
    print(specificDays);
  }

  void addFrequency() {
    if (showFrequencySection && _medicationFrequencyController.text.isEmpty) {
      _showSnackBar(translation(context).sInt);
    } else if (showDaysSection && !isDaySelected()) {
      _showSnackBar(translation(context).sDays);
    } else {
      if (showFrequencySection) {
        _medicationFrequency_isSpecificDays_Controller.text = "false";
        Navigator.pop(context, _medicationFrequencyController.text);
      } else {
        addToSpecificDays();
        _medicationFrequency_isSpecificDays_Controller.text = "true";
        _medicationFrequency_weekday_Controller.text =
            weekdays.toString().replaceAll('[', '').replaceAll(']', '');
        Navigator.pop(context,
            specificDays.toString().replaceAll('[', '').replaceAll(']', ''));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        clipBehavior: Clip.none,
        children: <Widget>[
          Column(
            children: [
              CustomRadioButton(
                elevation: 4,
                unSelectedColor: Theme.of(context).canvasColor,
                buttonLables: [
                  translation(context).aRI,
                  translation(context).oSDW,
                ],
                buttonValues: [
                  translation(context).aRI,
                  translation(context).oSDW,
                ],
                buttonTextStyle: const ButtonTextStyle(
                    selectedColor: Colors.white,
                    unSelectedColor: Colors.black,
                    textStyle: TextStyle(fontSize: 16)),
                radioButtonValue: (value) {
                  setState(() {
                    showFrequencySection = value == translation(context).aRI;
                    showDaysSection = value == translation(context).oSDW;
                    //clear both input fields when click any of the buttons
                    _clearSelectionAndResetControllers();
                    _medicationFrequencyController.clear();
                  });
                },
                defaultSelected: translation(context).aRI,
                selectedColor: Theme.of(context).colorScheme.primary,
                unSelectedBorderColor: Theme.of(context).colorScheme.primary,
                selectedBorderColor: Theme.of(context).colorScheme.primary,
                padding: 5,
                height: 50,
                width: 150,
                enableShape: true,
                enableButtonWrap: true,
                wrapAlignment: WrapAlignment.center,
                horizontal: true,
              ),
              if (showFrequencySection) ...[
                const SizedBox(height: 16),
                Text(
                  translation(context).cTI,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 16, 15, 15),
                  ),
                ),
                const SizedBox(height: 16),
                DropdownMenu(
                  controller: _medicationFrequencyController,
                  textStyle: GoogleFonts.roboto(
                    height: 2,
                    color: const Color.fromARGB(255, 16, 15, 15),
                  ),
                  width: MediaQuery.of(context).size.width * 0.8,
                  menuStyle: const MenuStyle(
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  inputDecorationTheme: const InputDecorationTheme(
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          20,
                        ),
                      ),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(4, 95, 165, 1),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          20,
                        ),
                      ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  dropdownMenuEntries: [
                    DropdownMenuEntry(
                        label: translation(context).eD, value: '1'),
                    DropdownMenuEntry(
                        label: translation(context).e2D, value: '2'),
                    DropdownMenuEntry(
                        label: translation(context).e3D, value: '3'),
                    DropdownMenuEntry(
                        label: translation(context).e4D, value: '4'),
                    DropdownMenuEntry(
                        label: translation(context).e5D, value: '5'),
                    DropdownMenuEntry(
                        label: translation(context).e6D, value: '6'),
                    DropdownMenuEntry(
                        label: translation(context).eW, value: '7'),
                    DropdownMenuEntry(
                        label: translation(context).e2W, value: '14'),
                    DropdownMenuEntry(
                        label: translation(context).e3W, value: '21'),
                    DropdownMenuEntry(
                        label: translation(context).eM, value: '30'),
                    DropdownMenuEntry(
                        label: translation(context).e2M, value: '60'),
                    DropdownMenuEntry(
                        label: translation(context).e3M, value: '90'),
                  ],
                  menuHeight: 200,
                  label: Text(translation(context).freq),
                ),
              ],
              if (showDaysSection) ...[
                const SizedBox(height: 16),
                Text(
                  translation(context).sTD,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 16, 15, 15),
                  ),
                ),
                const SizedBox(height: 16),
                WeekdaySelector(
                  firstDayOfWeek: 7,
                  shortWeekdays: [
                    translation(context).su,
                    translation(context).m,
                    translation(context).t,
                    translation(context).w,
                    translation(context).th,
                    translation(context).f,
                    translation(context).s
                  ],
                  onChanged: (int day) {
                    setState(() {
                      values[day % 7] = !values[day % 7];
                    });
                  },
                  values: values,
                ),
              ],
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.28,
                    child: FilledButton(
                      onPressed: () {
                        _clearSelectionAndResetControllers();
                        _medicationFrequencyController.clear();
                        Navigator.pop(context);
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
                        translation(context).cancel,
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.28,
                    child: FilledButton(
                      onPressed: addFrequency,
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
                        translation(context).done,
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _clearSelectionAndResetControllers() {
    setState(() {
      // Clear selected states
      values = List.filled(7, false);

      // Reset controllers to default values
      // _medicationFrequencyController.clear();
    });
  }
}
