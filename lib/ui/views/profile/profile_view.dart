import 'package:ebi/core/theme/app_colors.dart';
import 'package:ebi/core/theme/sizes.dart';
import 'package:ebi/core/utils/device_utils.dart';
import 'package:ebi/ui/views/catagories/catagories_view.dart';
import 'package:ebi/ui/views/profile/profile_view_model.dart';
import 'package:ebi/ui/widgets/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  static String profile = 'assets/images/abaya_type/1.png';
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileViewModel>(
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: MyTextfield(
              hintText: 'Search',
              controller: model.searchBarCotroller,
              isObscure: false,
              prefixIcon: Icons.search_rounded,
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'My Profile',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    SizedBox(
                      height: DeviceUtils.getScreenHeight(context) * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        // padding: EdgeInsets.symmetric(vertical: 15.0),
                        height: DeviceUtils.getScreenHeight(context) * 0.12,
                        width: DeviceUtils.getScreenWidth(context) * 0.9,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(
                            AppSizes.borderRadiusMd,
                          ),
                        ),
                        child: Center(
                          child: ListTile(
                            leading: CircleAvatar(
                              radius:
                                  DeviceUtils.getScreenWidth(context) * 0.12,
                              child: Image.asset(profile, fit: BoxFit.fill),
                            ),
                            title: Text(
                              'Name:',
                              style: TextStyle(
                                color: AppColors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              'Email/ phone Number : 0***********',
                              style: TextStyle(color: AppColors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: DeviceUtils.getScreenHeight(context) * 0.03),
                ...List.generate(
                  model.listTitles.length,
                  (index) => ListTile(
                    title: Text(model.listTitles[index].toString()),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
