import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/widget/custom_button.dart';
import 'package:bright_me/widget/white_appbar.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _nameTextEditing =
      TextEditingController(text: "Aurelia Sukianto");
  final TextEditingController _emailTextEditing =
      TextEditingController(text: "aurelia@gmail.com");
  final TextEditingController _phoneTextEditing = TextEditingController();
  final TextEditingController _addresTextEditings = TextEditingController();

  final List<String> genderItems = [
    'Male',
    'Female',
    'Prefer not to say',
  ];

  String? selectedValue;

  List<DateTime?>? _selectedDate = [];

  Future _dialogPop() async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
            ),
            title: Text(
              "Save changes?",
              style: medium(colorFont: blackColor, sizeFont: 14),
              textAlign: TextAlign.center,
            ),
            actions: [
              Center(
                child: SizedBox(
                    width: 210,
                    child: CustomButton(
                      buttonText: "Save Now!",
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: whiteAppBar(
          context,
          "Edit Profile",
          true,
          true,
          () async {
            await _dialogPop();
          },
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text: "Name",
                    style: reguler(
                      sizeFont: 14,
                    ),
                  ),
                  TextSpan(
                      text: " *",
                      style: reguler(
                        sizeFont: 14,
                        colorFont: redColor,
                      ))
                ]),
              ),
              fliedText(_nameTextEditing),
              Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text: "Email",
                    style: reguler(
                      sizeFont: 14,
                    ),
                  ),
                  TextSpan(
                      text: " *",
                      style: reguler(
                        sizeFont: 14,
                        colorFont: redColor,
                      ))
                ]),
              ),
              fliedText(_emailTextEditing),
              Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text: "Phone Number",
                    style: reguler(
                      sizeFont: 14,
                    ),
                  ),
                ]),
              ),
              fliedText(_phoneTextEditing),
              Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text: "Address",
                    style: reguler(
                      sizeFont: 14,
                    ),
                  ),
                ]),
              ),
              fliedText(_addresTextEditings),
              Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text: "Gender",
                    style: reguler(
                      sizeFont: 14,
                    ),
                  ),
                ]),
              ),
              DropdownButtonFormField2<String>(
                isExpanded: true,
                alignment: AlignmentDirectional.topStart,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: greyColor,
                      width: 1.5,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
                hint: Text(
                  'Set now',
                  style: reguler(
                    sizeFont: 12,
                    colorFont: greyColor,
                  ),
                ),
                items: genderItems
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: reguler(
                              sizeFont: 12,
                              colorFont: blackColor,
                            ),
                          ),
                        ))
                    .toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Please select gender.';
                  }
                  return null;
                },
                onChanged: (value) {
                  selectedValue = value.toString();
                },
                buttonStyleData: const ButtonStyleData(
                  padding: EdgeInsets.only(right: 8),
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: blackColor,
                  ),
                  iconSize: 24,
                ),
                dropdownStyleData: const DropdownStyleData(
                  decoration: BoxDecoration(
                      color: lightWhite,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(34),
                          bottomRight: Radius.circular(34))),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text: "Birthday",
                    style: reguler(
                      sizeFont: 14,
                    ),
                  ),
                ]),
              ),
              Container(
                height: 48,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.0, color: greyColor),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_getValueText(
                        CalendarDatePicker2Type.single, _selectedDate)),
                    IconButton(
                      onPressed: () async {
                        var value = await showCalendarDatePicker2Dialog(
                          context: context,
                          config: CalendarDatePicker2WithActionButtonsConfig(
                              selectedDayHighlightColor: purpleColor,
                              cancelButton: Container(
                                margin: const EdgeInsets.only(right: 80),
                                height: 40,
                                width: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: whiteColor,
                                ),
                                child: Center(
                                  child: Text(
                                    "Cancel",
                                    style: bold(
                                      colorFont: blackColor,
                                      sizeFont: 14,
                                    ),
                                  ),
                                ),
                              ),
                              okButton: Container(
                                height: 40,
                                width: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: purpleColor,
                                ),
                                child: Center(
                                  child: Text(
                                    "Done",
                                    style: bold(
                                      colorFont: whiteColor,
                                      sizeFont: 14,
                                    ),
                                  ),
                                ),
                              )),
                          dialogSize: const Size(325, 450),
                          borderRadius: BorderRadius.circular(15),
                        );
                        if (value != null) {
                          setState(() {
                            _selectedDate = value;
                          });
                        }
                      },
                      icon: const Icon(
                        Icons.calendar_today_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  String _getValueText(
    CalendarDatePicker2Type datePickerType,
    List<DateTime?>? values,
  ) {
    values =
        values!.map((e) => e != null ? DateUtils.dateOnly(e) : null).toList();

    // if the user not selected date, return "mm-dd-yyyy"

    var valueText = (values.isNotEmpty ? values[0] : "mm-dd-yyyy")
        .toString()
        .replaceAll('00:00:00.000', '');

    return valueText;
  }

  Widget fliedText(TextEditingController textEditingController) => Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: TextField(
          controller: textEditingController,
          style: reguler(
            sizeFont: 12,
            colorFont: blackColor,
          ),
          decoration: InputDecoration(
              hintText: "Set now",
              hintStyle: reguler(
                sizeFont: 12,
                colorFont: greyColor,
              )),
        ),
      );
}
