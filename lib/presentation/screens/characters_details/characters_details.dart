import 'package:breaking_bad_series/business_logic/chrachters_cubit.dart';
import 'package:breaking_bad_series/business_logic/chrachters_state.dart';
import 'package:breaking_bad_series/presentation/widgets/build_divider.dart';
import 'package:breaking_bad_series/presentation/widgets/check_if_quotes_are_loaded.dart';
import 'package:breaking_bad_series/res/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                    placeholder: (context, url) => Image.asset("assets/images/walterWhite.png"),
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
                      CharacterInfo(title: 'Job',info: character.occupation!.join(" / "),),
                      BuildDivider(endIndent: 360),
                      CharacterInfo(title: 'Appeared in',info: character.category!),
                      BuildDivider(endIndent: 295),
                      CharacterInfo(title: 'Season',info: character.appearance!.join(" - "),),
                      BuildDivider(endIndent: 330),
                      CharacterInfo(title: 'Status',info: character.status!,),
                      BuildDivider(endIndent: 340),
                      if(character.betterCallSaulAppearance!.isNotEmpty)
                      CharacterInfo(title: 'Better Call Saul Season',info: character.betterCallSaulAppearance!.join(" / "),),
                      if(character.betterCallSaulAppearance!.isNotEmpty)
                      BuildDivider(endIndent: 200),
                      CharacterInfo(title: 'Actor / Actress',info: character.name!,),
                      BuildDivider(endIndent: 270),
                      SizedBox(height:0.04 *mHeight,),
                      // BlocBuilder<CharactersCubit,CharactersState>(
                      //   builder: (context, state) =>checkIfQuotesAreLoaded(state:state) ,)
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
