import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_media_app/models/post_model.dart';
class PostsCarousel extends StatelessWidget {
  const PostsCarousel({Key key, this.pageController, this.title, this.posts}) : super(key: key);
  final PageController pageController;
  final String title;
  final List<Post> posts;

  PostsCarousel.name({this.pageController, this.title, this.posts});
  _buildPosts(BuildContext context, int index) {
    Post post=posts[index];
    return AnimatedBuilder(
      animation: pageController,
      builder: (BuildContext context,Widget widget){
        double value=1;
        if(pageController.position.haveDimensions){
          value=pageController.page-index;
          value=(1-(value.abs()*0.25)).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeOut.transform(value)*400.0,
            child: widget,
          ),
        );
      },
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0,2),
                      blurRadius: 6.0
                  )
                ]
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image(
                height: 400.0,
                width: 300.0,
                image: AssetImage(
                    post.imageUrl
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 10.0,
            right: 10.0,
            bottom: 10.0,
            child: Container(
              padding: EdgeInsets.all(12.0),
              height: 110.0,
              decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0)
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text(

                      post.title,
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      post.location,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(Icons.favorite,color: Colors.red,),
                          SizedBox(width: 6.0,),
                          Text(post.likes.toString(),
                            style: TextStyle(
                              fontSize: 18.0,

                            ),),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.comment,
                            color: Theme.of(context).primaryColor,
                          ),
                          Text(post.comments.toString(),
                            style: TextStyle(
                              fontSize: 24.0,

                            ),),
                        ],
                      )
                    ],
                  )
                ],
              ),

            ),
          )
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
            ),
          ),
        ),
        Container(
          height: 400.0,
          child: PageView.builder(
              controller: pageController,
              itemCount: posts.length,
              itemBuilder: (BuildContext context,int index){
               return _buildPosts(context,index);
              }),
        )
      ],

    );
  }
}

