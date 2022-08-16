import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitledfood/Providers/MyProvider.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen();

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (context, provider, c) => Visibility(
        visible: provider.states[4],
        child: Column(
          children: [
            ListTile(
              title: Text('About Us'),
              leading: IconButton(
                  onPressed: () {
                    provider.changeStates(4);
                  },
                  icon: Icon(Icons.arrow_back_ios)),
            ),
          SizedBox(height: 20.h,),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context,index)=>  Container(
              margin: EdgeInsets.symmetric(vertical: 15.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15.w,vertical: 5.h),
                    width: 5.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                        color: Colors.deepOrangeAccent, shape: BoxShape.circle),
                  ),
                  TextW('Lorem ipsum dolor sit amet, consectetur adipiscing \n elit, sed do eiusmod tempor incididunt ut labore et \n dolore magna aliqua. Ut enim ad minim veniam \n quis nostrud exercitation ullamco laboris nisi ut \n aliquip ex ea commodo consequat. Duis aute irure \n dolor in reprehenderit in voluptate velit esse cillum N \n dolore eu fugiat nulla pariatur. Excepteur sint \n occaecat cupidatat non proident, sunt in culpa qui \n officia deserunt mollit anim id est laborum.')
                ],
              ),
            ),
          )

          ],
        ),
      ),
    );
  }

  TextW(String text) {
    return Text(
      text,
      style: TextStyle(color: Colors.grey),
    );
  }
}
