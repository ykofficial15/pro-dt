import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../model/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsOverview extends StatelessWidget {
  final Datum newses;
  const NewsOverview({super.key, required this.newses});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Overview'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  height: 200,
                  width: MediaQuery.sizeOf(context).width,
                  fit: BoxFit.cover,
                  imageUrl: newses.imageUrl,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                newses.title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
              ),
              
                Text(
                newses.time,
                style:
                    const TextStyle( color: Colors.grey),
              ),
              
              Text('By: ${newses.author}', overflow:TextOverflow.ellipsis, maxLines: 2,style: const TextStyle(color: Colors.grey),),
              const Divider(),
              Text(
                newses.content,
                style: const TextStyle(color: Colors.black),
              ),
                Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                const Text('More info:', style:TextStyle(fontWeight:FontWeight.bold, )),
                   TextButton(
                  onPressed: () {
                  _launchUrl(newses.url);
                  },
                  child: Text(newses.url,
                      style: const TextStyle(
                        decoration:TextDecoration.underline,
                        overflow:TextOverflow.ellipsis,
                          color: Colors.blue,
                          fontWeight: FontWeight.normal))),
              ]
             ),
              TextButton(
                style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                  onPressed: () {
                  _launchUrl(newses.readMoreUrl);
                  },
                  child: const Text('Read more',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal))),
              const SizedBox(
                height: 5,
              ),
           
            ],
          ),
        ),
      ),
    );
  }
   Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch');
    }
  }
}
