import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/atricle_model.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.articleModel});
  final ArticleModel articleModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child:CachedNetworkImage(
            imageUrl: articleModel.image!,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          // child: Image.network(articleModel.image!,
          //   height: 200,
          //   width: double.infinity,
          //   fit: BoxFit.cover,
          // ),

        ),
        const SizedBox(
          height: 12,
        ),

        Text(
          articleModel.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style:const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: Colors.black,
          ),

        ),
        const SizedBox(height: 8,),
        Text(
          articleModel.subTitle! ,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style:const TextStyle(

            fontSize: 14,
            color: Colors.grey,
          ),

        ),
      ],
    );
  }
}
