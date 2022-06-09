 

import 'package:flutter/material.dart';
import 'package:flutter_responsive_admin_panel/configs/configs.dart';
import 'package:flutter_responsive_admin_panel/view/screens/dashboard/my_files.dart';
import 'package:flutter_responsive_admin_panel/view/screens/dashboard/recent_files.dart';
import 'package:flutter_responsive_admin_panel/view/screens/dashboard/storage_details.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.blue,
      ),

      /*
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            // Container(
            //   height: 400,
            //   width: 400,
            //   color: Colors.red,
            // ),
            const SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      MyFiles(),
                      const SizedBox(
                        height: defaultPadding
                      ),
                      const RecentFiles(),
                      if (ConfigResponsive.isMobile(context))
                        SizedBox(height: defaultPadding),
                        const SizedBox(height: 8),
                      if (ConfigResponsive.isMobile(context)) StorageDetails(),
                    ],
                  ),
                ),
                if (!ConfigResponsive.isMobile(context))
                  const SizedBox(
                    width: defaultPadding,
                  ),
                // On Mobile means if the screen is less than 850 we dont want to show it
                if (!ConfigResponsive.isMobile(context))
                  const Expanded(
                    flex: 2,
                    child: StorageDetails(), 
                  ),
              ],
            )
          ],
        ),
      ),
    */
    );
  }
}
