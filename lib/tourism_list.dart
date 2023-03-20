// ./tourism_list.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wisata_surabaya/detail_screen.dart';
import 'package:flutter_wisata_surabaya/list_item.dart';
import 'package:flutter_wisata_surabaya/model/tourism_place.dart';
import 'package:flutter_wisata_surabaya/provider/done_tourism_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/src/widgets/framework.dart';

class TourismList extends StatefulWidget{
  const TourismList({Key? key}) : super(key: key);

  @override
  _TourismListState createState() => _TourismListState();
}

class _TourismListState extends State<TourismList>{
  final List<TourismPlace> tourismPlaceList = [
    TourismPlace(
      name: 'Surabaya Submarine Monument',
      location: 'Jl. Pemuda',
      imageAsset: 'assets/images/submarine.jpg',
      description: 'Museum inside a decommissioned Russian war submarine with tours & an adjacent park with cafes. Clean and wll maintained. Car park cost 10k, entrance fee 15k/person. You can see KRI Pasopati there, it is a russian whiskey class. You can also watch the video about the Indonesian Navy at the building beside the submarine.',
      day: 'Open Monday',
      time: '14.00 - 21.00',
      ticket: 'Rp. 15.000,-',
    ),
    TourismPlace(
      name: 'Klenteng Sanggar Agung',
      location: 'Kenjeran',
      imageAsset: 'assets/images/klenteng.png',
      description: 'Sanggar Agung Temple or Hong San Tang Temple is a temple in Surabaya City. The address is on Jalan Sukolilo Number 100, Pantai Ria Kenjeran, Surabaya. This temple, besides being a place of worship for Tridharma believers, is also a tourist destination for tourists. This temple was opened in 1999.',
      day: 'Open Everyday',
      time: '10.00 - 22.00',
      ticket: 'Rp. 5.000,-',
    ),
    TourismPlace(
      name: 'House of Sampoerna',
      location: 'Alun-alun Contong',
      imageAsset: 'assets/images/sampoerna.jpg',
      description: 'House of Sampoerna is a tobacco museum and headquarters of Sampoerna located in Surabaya. The architectural style of the Dutch colonial influenced main building was built in 1862 and is now a historical site. Previously used as an orphanage run by the Dutch, it was purchased in 1932 the founder of Sampoerna',
      day: 'Open Everyday',
      time: '07.00 - 21.00',
      ticket: 'Rp. 0,-',
    ),
    TourismPlace(
      name: 'Tugu Pahlawan',
      location: 'Krembangan Utara',
      imageAsset: 'assets/images/pahlawan.jpg',
      description: 'Tugu Pahlawan is a monument that marks the land of Surabaya City. The monument is 41.15 meters high and is shaped like an inverted phallus or spike. The body of the monument is in the form of 10 arches (canalures), and is divided into 11 sections. The height, segments and canalures mean the date 10, month 11, year 1945.',
      day: 'Open Everyday',
      time: '07.00 - 15.00',
      ticket: 'Rp. 0,-',
    ),
    TourismPlace(
      name: 'Patung Suro Boyo',
      location: 'Wonokromo',
      imageAsset: 'assets/images/sby.jpg',
      description: 'Sura and Baya Statue (Javanese: Patung Suro lan Boyo) is a statue that is a symbol of the city of Surabaya. The statue is located in front of Surabaya Zoo. The statue consists of two animals, a crocodile and a shark, which inspired the name of the city of Surabaya: sura (shark) and baya (crocodile).',
      day: 'Open Everyday',
      time: '08.00 - 22.00',
      ticket: 'Rp. 4000,-',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final List<TourismPlace> doneTourismPlaceList =
        Provider.of<DoneTourismProvider>(
          context,
          listen: false,
        ).doneTourismPlaceList;

    return ListView.builder(
      itemBuilder: (context, index) {
        final TourismPlace place = tourismPlaceList[index];
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailScreen(place: place);
            }));
          },
          child: Consumer<DoneTourismProvider>(
            builder: (context, DoneTourismProvider data, widget){
              return ListItem(
                place: place,
                isDone: doneTourismPlaceList.contains(place),
                onCheckboxClick: (bool? value){
                  setState(() {
                    if(value!=null){
                      value
                          ? doneTourismPlaceList.add(place)
                          : doneTourismPlaceList.remove(place);
                    }
                  },);
                },
              );
            }
          ),
        );
      },
      itemCount: tourismPlaceList.length,
    );
  }
}