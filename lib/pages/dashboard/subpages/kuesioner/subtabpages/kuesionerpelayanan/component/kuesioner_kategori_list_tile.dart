import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../../../model/kuesioner/model_user_mahasiswa_data_pelayanan.dart';
import '../../../../../../../util/color_pallete.dart';

class KuesionerKategoriListTile extends StatelessWidget {
  final List<DataKuesionerKategori> dataKuesioner;
  final List<String> status;

  KuesionerKategoriListTile({required this.dataKuesioner, required this.status});

  @override
  Widget build(BuildContext context) {
    double _currentRating = 0;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(width: 1, color: ColorPallete.primary),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(2),
                          topRight: Radius.circular(2)),
                    ),
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          children: dataKuesioner.map(
                                (e) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${e.soalNama}',
                                      style: TextStyle(color: ColorPallete.primary),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.symmetric(vertical: 8),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Nilai Kepentingan'),
                                              SizedBox(
                                                width: 110,
                                                child: RatingBar.builder(
                                                  itemSize: 18.0,
                                                  initialRating: _currentRating,
                                                  direction: Axis.horizontal,
                                                  itemCount: 5,
                                                  itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                                                  itemBuilder: (context, _) => Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                  ),
                                                  onRatingUpdate: (rating) {
                                                    _currentRating = rating;

                                                    print(rating);
                                                    print(_currentRating);
                                                  },
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Nilai Kepuasan'),
                                              SizedBox(
                                                width: 110,
                                                child: RatingBar.builder(
                                                  itemSize: 18.0,
                                                  initialRating: _currentRating,
                                                  direction: Axis.horizontal,
                                                  itemCount: 5,
                                                  itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                                                  itemBuilder: (context, _) => Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                  ),
                                                  onRatingUpdate: (rating) {
                                                    _currentRating = rating;

                                                    print(rating);
                                                    print(_currentRating);
                                                  },
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),

                              )
                              .toList(),
                        ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
