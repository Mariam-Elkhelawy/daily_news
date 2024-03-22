import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({super.key,required this.onTap});
  Function onTap;
 static int categoryID = 1;
 static int settingsID = 2;
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Container(
      width: mediaQuery.width * .74,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
      ),
      child: Column(
        children: [
          Container(
            color: theme.primaryColor,
            height: mediaQuery.height * .17,
            child: Center(
                child: Text(
              'News App!',
              style: theme.textTheme.titleLarge?.copyWith(color: Colors.white),
            )),
          ),
          InkWell(
            onTap: () {
              onTap(categoryID);
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
              child: Row(
                children: [
                  ImageIcon(
                    AssetImage('assets/images/ic_list.png'),
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Categories',
                    style: theme.textTheme.titleLarge
                        ?.copyWith(color: Color(0xFF303030)),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              onTap(settingsID);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  ImageIcon(
                    AssetImage('assets/images/ic_settings.png'),
                    size: 22,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Settings',
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: Color(0xFF303030),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
