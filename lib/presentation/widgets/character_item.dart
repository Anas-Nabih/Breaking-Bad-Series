import 'package:breaking_bad_series/data/models/CharacterResponse.dart';
import 'package:breaking_bad_series/res/colors.dart';
import 'package:breaking_bad_series/res/strings.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  final Character character;
  const CharacterItem({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: MColors.white,
        borderRadius: BorderRadius.circular(4)
      ),
      child: GestureDetector(
        onTap: ()=> Navigator.pushNamed(context, AppString.characterScreenDetails,arguments: character),
        child: GridTile(
          child: Hero(
            tag: character.charId!,
            child: Container(
              color: MColors.grey,
              child: character.img!.isNotEmpty?
              CachedNetworkImage(
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                  imageUrl: character.img!,
                placeholder: (context, url) => Image(image: AssetImage( "assets/images/loadingDots.gif")),

              )
                  : FlutterLogo()
              ,
            ),
          ),
          footer: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical:10 ,horizontal: 15),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text(character.name!, overflow: TextOverflow.ellipsis,
              maxLines: 2,textAlign: TextAlign.center,
              style: TextStyle(
              height: 1.3,fontSize: 16,fontWeight: FontWeight.w800, color: Colors.white
            ),),
          ),
        ),
      ),
    );
  }
}
