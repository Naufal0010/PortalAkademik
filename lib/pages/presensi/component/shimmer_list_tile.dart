import 'package:flutter/material.dart';
import 'package:portal_akademik/widget/shimmer_widget.dart';

class ShimmerListTile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: ListView(
          children: [
            ShimmerWidget(width: double.infinity, height: 50,),
            SizedBox(height: 8.0,),
            ShimmerWidget(width: double.infinity, height: 50,),
            SizedBox(height: 8.0,),
            ShimmerWidget(width: double.infinity, height: 50,),
            SizedBox(height: 8.0,),
            ShimmerWidget(width: double.infinity, height: 50,),
            SizedBox(height: 8.0,),
            ShimmerWidget(width: double.infinity, height: 50,),
            SizedBox(height: 8.0,),
            ShimmerWidget(width: double.infinity, height: 50,),
            SizedBox(height: 8.0,),
            ShimmerWidget(width: double.infinity, height: 50,),
            SizedBox(height: 8.0,),
            ShimmerWidget(width: double.infinity, height: 50,),
            SizedBox(height: 8.0,),
            ShimmerWidget(width: double.infinity, height: 50,),
            SizedBox(height: 8.0,),
            ShimmerWidget(width: double.infinity, height: 50,),
            SizedBox(height: 8.0,),
            ShimmerWidget(width: double.infinity, height: 50,),
            SizedBox(height: 8.0,),
          ],
        ),
      ),
    );
  }
}
