import 'package:find_your_teacher/core/theme/colors.dart';
import 'package:find_your_teacher/features/student_auth/data/data_sources/local_data_source.dart';
import 'package:find_your_teacher/features/student_auth/presentation/pages/choose_major.dart';
import 'package:find_your_teacher/features/teacher_home/presentation/pages/settings/rest_password/contact_us.dart';
import 'package:find_your_teacher/features/teacher_home/presentation/pages/settings/who_we_are.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../resources/resources.dart';
import 'about_us.dart';

class StudentSettingsUi extends StatefulWidget {
  const StudentSettingsUi({super.key});

  @override
  State<StudentSettingsUi> createState() => _StudentSettingsUiState();
  static String name = "settings_screen";
  static String path = "/settings_screen";
}

class _StudentSettingsUiState extends State<StudentSettingsUi> {
  bool status = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(right: 8.w),
                child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'الإعدادات',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 23),
                    )),
              ),
              SizedBox(
                height: 25.h,
              ),

              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                  ),
                  child: ListTile(
                    title: Text('الاشعارات',
                        style: Theme.of(context).textTheme.bodyMedium),
                    leading: SvgPicture.asset(
                      Images.notifications,
                      color: lightColorScheme.shadow.withOpacity(0.7),
                    ),
                    trailing: Switch(
                      activeColor: Colors.white,
                      activeTrackColor: Colors.green,
                      inactiveTrackColor: Colors.white12,
                      value: status,
                      onChanged: (bool value) {
                        setState(() {
                          status = value;
                        });
                      },
                    ),
                  )),
              SizedBox(
                height: 14.h,
              ),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                  ),
                  child: ListTile(
                    title: Text('كلمة السر',
                        style: Theme.of(context).textTheme.bodyMedium),
                    leading: SvgPicture.asset(
                      Images.password,
                      color: lightColorScheme.shadow.withOpacity(0.7),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        context.pushNamed(ContactUsScreen.name);
                      },
                      icon: Icon(Icons.arrow_forward_ios),
                    ),
                  )),
              SizedBox(
                height: 14.h,
              ),

              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                  ),
                  child: ListTile(
                    title: Text(' حول التطبيق',
                        style: Theme.of(context).textTheme.bodyMedium),
                    leading: Icon(
                      Icons.question_answer_outlined,
                      color: lightColorScheme.shadow.withOpacity(0.7),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        context.pushNamed(About.name);
                      },
                      icon: Icon(Icons.arrow_forward_ios),
                    ),
                  )),
              SizedBox(
                height: 14.h,
              ),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                  ),
                  child: ListTile(
                    title: Text(' من نحن',
                        style: Theme.of(context).textTheme.bodyMedium),
                    leading: Icon(
                      Icons.question_mark_outlined,
                      color: lightColorScheme.shadow.withOpacity(0.7),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        context.pushNamed(WhoWeAre.name);
                      },
                      icon: Icon(Icons.arrow_forward_ios),
                    ),
                  )),
              SizedBox(
                height: 14.h,
              ),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                  ),
                  child: ListTile(
                      title: Text(' تسجيل الخروج',
                          style: Theme.of(context).textTheme.bodyMedium),
                      leading: SvgPicture.asset(Images.logout),
                      trailing: IconButton(
                          icon: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: lightColorScheme.shadow.withOpacity(0.7),
                          ),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("تسجيل الخروج",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium),
                                    actions: [
                                      TextButton(
                                        onPressed: () async {
                                          context.goNamed(ChooseMajor.name);
                                          await AuthImpLocalDataSource()
                                              .deleteToken();
                                        },
                                        child: Text(
                                          "نعم",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          "لا",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                      ),
                                    ],
                                  );
                                });
                          }))),
            ],
          ),
        ),
      ),
    );
  }
}
