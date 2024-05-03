import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:prodt/controller/news_controller.dart';
import 'package:prodt/view/filter.dart';
import 'package:prodt/view/login.dart';
import 'package:prodt/view/news_overview.dart';

class Home extends StatelessWidget {
  final NewsController controller = Get.put(NewsController());
    final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('News Pro', style:TextStyle(fontWeight: FontWeight.bold, color:Colors.blue)),
        actions: [
          IconButton(onPressed: (){
            Get.offAll(Login());
          }, icon: Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
           SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                child: TextFormField(
                  controller: searchController,
                  cursorColor: Colors.grey,
                  cursorHeight: 25,
                  textAlign: TextAlign.start,
                  onChanged: (value) {
                   controller.filterNews(value);
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    hintText: 'Search headline...',
                    prefixIcon: const Icon(Icons.search),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
          Container(margin:EdgeInsets.all(5),child: FilterChipDemo()),
          Expanded(
            child: Obx(() {
              if (controller.news.isEmpty) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                itemCount: controller.filteredNews.length,
                  itemBuilder: (context, index) {
                 final newzes = controller.filteredNews[index];
                    return InkWell(
                      splashColor: Colors.blue,
                      onTap: (){
                        Get.to(NewsOverview(newses:newzes));
                      },
                      child: Container(
                        margin:EdgeInsets.all(10),
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey)
                        ),
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         ClipRRect(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                           child: CachedNetworkImage(
                            height:200,
                            width:MediaQuery.sizeOf(context).width,
                                             fit: BoxFit.cover,
                                             imageUrl:
                                                newzes.imageUrl ,
                                             placeholder: (context, url) => Center(child:CircularProgressIndicator()),
                                             errorWidget: (context, url, error) => const Icon(Icons.error),
                                           ),
                         ),
                          Container(
                            margin: EdgeInsets.all(5),
                            child: Text(newzes.title, overflow:TextOverflow.ellipsis, maxLines: 2,)),
                              Container(
                            margin: EdgeInsets.all(5),
                            child: Text('- ${newzes.author}', overflow:TextOverflow.ellipsis, maxLines: 2,style: TextStyle(color: Colors.grey),)),
                        ],
                                         ) ),
                    );
                  },
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
