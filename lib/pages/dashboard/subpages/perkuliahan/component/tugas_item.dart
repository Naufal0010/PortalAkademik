import 'package:flutter/material.dart';

class TugasItem extends StatelessWidget {
  final String jenisTugas;
  final String namaMataKuliah;
  final String ruangKuliah;
  final String hariPengumpulan;

  TugasItem(this.jenisTugas, this.namaMataKuliah, this.ruangKuliah,
      this.hariPengumpulan);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    jenisTugas,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                  Text(
                    namaMataKuliah,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                  Text(
                    'Tenggat Waktu : ' + hariPengumpulan,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                  Container(
                      padding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Text(
                        'Detail Tugas',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}