import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitledfood/Providers/AuthProvider.dart';
import 'package:untitledfood/Widgets/AuthComponents/CustomButton.dart';
import 'package:untitledfood/Widgets/Custom/TextfieldProfile.dart';

class ProfileTab extends StatefulWidget {
  ProfileTab();

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  void initState() {
    super.initState();
    Provider.of<AuthProvider>(context, listen: false).fillControllers();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, provider, v) => Container(
        margin: EdgeInsets.only(bottom:100.h),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      provider.selectFile();
                    },
                    child: provider.file == null
                        ? Image.asset('Assets/Images/original.png')
                        : CircleAvatar(
                      radius: 50.r,
                            backgroundImage: FileImage(provider.file),
                          ),
                  ),
                  Positioned(
                    bottom: 0,
                      left: 7,
                      child: Image.asset('Assets/Images/halfImage.png'))
                ],
              ),
              GestureDetector(
                onTap: () {
                  provider.setEnabled();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.edit,
                      color: Color(0xfffc6011),
                      size: 17.sp,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      'Edit profile',
                      style: TextStyle(color: Color(0xfffc6011), fontSize: 10.sp),
                    )
                  ],
                ),
              ),
              Text('Hi there' + '\t' + ''),
              TextButton(
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.zero, alignment: Alignment.topCenter),
                  onPressed: () {
                    provider.logOut();
                    provider.GooglesignOut();
                    provider.FacebokSignout();
                  },
                  child: Text(
                    'Sign Out',
                    style: TextStyle(color: Colors.grey, fontSize: 11.sp),
                  )),

               TextfieldProfile(
                 controller: provider.nameController,
                 label: 'Name',
                 enabled: provider.enable,
               ),
               TextfieldProfile(
                 controller: provider.emailController,
                 label: 'Email',
                 enabled: false,
               ),
               TextfieldProfile(
                 controller: provider.mobileNoController,
                 label: 'Mobile No',
                 enabled: false,
               ),
               TextfieldProfile(
                 controller: provider.addressController,
                 label: 'Address',
                 enabled: provider.enable,
               ),
               TextfieldProfile(
                 controller: provider.passwordController,
                 label: 'Password',
                 enabled: provider.enable,
               ),
               TextfieldProfile(
                 controller: provider.confirmController,
                 label: 'Confirm Password',
                 enabled: provider.enable,
               ),
               Visibility(
                 visible: !provider.enable,
                 child: SizedBox(
                   height: 30.h,
                 ),
               ),
               Visibility(
                 visible: provider.enable,
                 child: CustomButton(
                   function: () {
                     provider.updateProfile();
                   },
                   text: 'Save',
                   textcolor: Colors.white,
                   fill: Color(0xfffc6011),
                 ),
               )
             ],
          ),
        ),
      ),
    );
  }
}
