import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:todoapp/general/utils/color_constant.dart';
import 'package:todoapp/general/utils/validator.dart';
import 'package:todoapp/general/widgets/background_widget.dart';
import 'package:todoapp/general/widgets/button.dart';
import 'package:todoapp/general/widgets/custome_text.dart';
import 'package:todoapp/general/widgets/height_space.dart';
import 'package:todoapp/general/widgets/inputs.dart';
import 'package:todoapp/general/widgets/message_textfield.dart';
import 'package:todoapp/general/widgets/width_space.dart';

class AddTask extends ConsumerStatefulWidget {
  static const routeName = '/add_farm';

  const AddTask({
    super.key,
  });
  @override
  ConsumerState<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends ConsumerState<AddTask> {
  // bool selected = false;
  final GlobalKey<FormState> _addTaskFormKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  DateTime? selectedDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Form(
          key: _addTaskFormKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.h, vertical: 2.h),
            child: ListView(
              children: [
                CustomText(
                  data: 'Add Title',
                  textAlign: TextAlign.start,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
                const HeightSpace(),
                InputWidget(
                  controller: _titleController,
                  hintText: 'Enter Task Tile',
                  hasLabel: false,
                  validator: (p0) => InputValidator.validateEmpty(value: p0!),
                ),
                const HeightSpace(),
                SizedBox(
                  width: double.infinity,
                  height: 140,
                  child: MessageTextField(
                    hintText: 'Description',
                    controller: _bioController,
                    hasLabel: false,
                    fillColor: AppConst.kWhite,
                    keyBoardType: TextInputType.multiline,
                    textAlign: TextAlign.start,
                    validator: (p0) => InputValidator.validateEmpty(value: p0!),
                    textAlignVertical: TextAlignVertical.top,
                    padding: EdgeInsets.only(left: 0, right: 0, top: 16.0.h),
                  ),
                ),
                const HeightSpace(),
                SizedBox(
                  height: 44.h,
                  child: Row(
                    children: [
                      Expanded(
                          child: PrimaryButton(
                        hasOuterPadding: false,
                        onPressed: () {},
                        text: 'Start Time',
                      )),
                      const WidthSpace(),
                      Expanded(
                          child: PrimaryButton(
                        hasOuterPadding: false,
                        onPressed: () {},
                        text: 'End Timre',
                      )),
                    ],
                  ),
                ),
                const HeightSpace(),
                PrimaryButton(
                  hasOuterPadding: false,
                  onPressed: () async {
                    final date = await showDatePickerDialog(
                      context: context,
                      initialDate: DateTime.now(),
                      maxDate:
                          DateTime.now().add(const Duration(days: 365 * 3)),
                      minDate: DateTime.now()
                          .subtract(const Duration(days: 365 * 3)),
                    );
                    if (date != null) {
                      setState(() {
                        selectedDate = date;
                      });
                    }
                  },
                  text: 'Pick Date',
                ),
                const HeightSpace(),
                PrimaryButton(
                  hasOuterPadding: false,
                  onPressed: () {},
                  text: 'Submit Task',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
