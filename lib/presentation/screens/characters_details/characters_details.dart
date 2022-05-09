import 'package:breaking_bad_series/res/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../data/models/CharacterResponse.dart';
import '../../widgets/character_info.dart';

class CharacterDetails extends StatelessWidget {
  final Character character;

  const CharacterDetails({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double mHeight = MediaQuery.of(context).size.height;
    double mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MColors.grey,
      body: Hero(
        tag: character.charId!,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
                 expandedHeight: .8 * mHeight,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(character.nickname!),
                  background: CachedNetworkImage(
                      imageUrl: character.img!, fit: BoxFit.cover),
                )
            ),
            SliverList(delegate: SliverChildListDelegate(
              [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 0.02* mWidth,vertical: 0.01*mHeight),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CharacterInfo(title: 'Job',info: character.nickname!,),
                      CharacterInfo(title: 'Appeared in',info: character.nickname!,),
                      CharacterInfo(title: 'Status',info: character.nickname!,),
                      CharacterInfo(title: 'Actor / Actress',info: character.nickname!,),
                     ],
                  ),
                )
              ]
            ))
          ],
        ),
      ),
    );
  }
}
