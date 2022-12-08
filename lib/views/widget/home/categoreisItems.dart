import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/controllers/home/homePage_Controller.dart';
import 'package:graduation_project/core/theme/Themes.dart';

class categoreisItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 120,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) => Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                alignment: Alignment.center,
                width: 80,
                height: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey.withOpacity(.1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      '${getCategories[index]['imageLink']}',
                      width: 50,
                      height: 50,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${getCategories[index]['title']}',
                      style: Themes().headLine4.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ],
                ),
              ),
            )),
        separatorBuilder: ((context, index) => SizedBox(
              width: 20,
            )),
        itemCount: getCategories.length,
      ),
    );
  }
}
