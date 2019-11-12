//import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
//import 'package:spotify/components/auth.dart';
//import 'package:spotify/logic/auth_logic.dart';
//final Color backgroundColor = Color(0xFF4A4A58);
//class SpotifyHome extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      child: SpotifyHomepage(),
//    );
//  }
//}
//
//class SpotifyHomepage extends StatefulWidget {
//  @override
//  _SpotifyHomepageState createState() => _SpotifyHomepageState();
//}
//
//class _SpotifyHomepageState extends State<SpotifyHomepage> with SingleTickerProviderStateMixin{
//  bool isCollapsed = true;
//  double screenWidth, screenHeight;
//  final Duration duration = const Duration(milliseconds: 300);
//  AnimationController _controller;
//  Animation<double> _scaleAnimation;
//  Animation<double> _menuScaleAnimation;
//  Animation<Offset> _slideAnimation;
//  @override
//  void initState() {
//    super.initState();
//    _controller = AnimationController(vsync: this, duration: duration);
//    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
//    _menuScaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(_controller);
//    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0)).animate(_controller);
//  }
//  @override
//  void dispose() {
//    _controller.dispose();
//    super.dispose();
//  }
//  @override
//
//  Widget build(BuildContext context) {
////    final sessionObject = Provider.of<SessionManagement>(context);
//    Size size = MediaQuery.of(context).size;
//    screenHeight = size.height;
//    screenWidth = size.width;
//    return Scaffold(
//      backgroundColor: backgroundColor,
//      body: Stack(
//        children: <Widget>[
//          menu(context),
//          dashboard(context),
//        ],
//      ),
//    );
//  }
//  Widget menu(context) {
//    final sessionObject = Provider.of<SessionManagement>(context);
//    return SlideTransition(
//      position: _slideAnimation,
//      child: ScaleTransition(
//        scale: _menuScaleAnimation,
//        child: Column(
//          children: <Widget>[
//            Container(
//              padding: EdgeInsets.only(right: 145.0),
//              child: new UserAccountsDrawerHeader(accountName: new Text('Ayush Goyal'), accountEmail: Text("ayushg162@gmail.com"),currentAccountPicture: new CircleAvatar(
//                backgroundColor: Colors.grey,
//                child: Text('A', style: TextStyle(fontSize: 35.0),),
//              ),decoration: BoxDecoration(
//                color: Colors.transparent,
//                shape: BoxShape.rectangle,
//                border: Border(
//                  bottom: BorderSide(
//                    style: BorderStyle.solid
//                  )
//                )
//              ),),
//            ),
//            SizedBox(
//              height: 50,
//            ),
//            Padding(
//              padding: const EdgeInsets.only(left: 16.0, right: 145.0),
//              child: Align(
//                alignment: Alignment.centerLeft,
//                child: Column(
//                  mainAxisSize: MainAxisSize.max,
////              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: <Widget>[
//                    ListTile(title: Text("Dashboard", style: TextStyle(color: Colors.white, fontSize: 22)),),
//                    SizedBox(height: 5),
//                    ListTile(title: Text("My Music", style: TextStyle(color: Colors.white, fontSize: 22)),),
//                    SizedBox(height: 5),
//                    ListTile(title: Text("Downloads", style: TextStyle(color: Colors.white, fontSize: 22)),),
//                    SizedBox(height: 5),
//                    ListTile(title: Text("Setting", style: TextStyle(color: Colors.white, fontSize: 22)),),
//                    SizedBox(height: 5),
//                    ListTile(title: Text("Logout", style: TextStyle(color: Colors.white, fontSize: 22)),trailing: Icon(
//                      Icons.power_settings_new,
//                      color: Colors.white,
//                      ),
//                      onTap: ()async{
//                        if(await sessionObject.logout()){
//                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Material(
//                            child: ChangeNotifierProvider(
//                              builder: (_)=>SessionManagement(),
//                              child: FirebaseSession(),
//                            ),
//                          ),), (Route<dynamic> route)=>false);
//                        }else{
//
//                        }
//                      },
//                    ),
//                    ],
//                ),
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//  Widget dashboard(context) {
//    return AnimatedPositioned(
//      duration: duration,
//      top: 0,
//      bottom: 0,
//      left: isCollapsed ? 0 : 0.6 * screenWidth,
//      right: isCollapsed ? 0 : -0.2 * screenWidth,
//      child: ScaleTransition(
//        scale: _scaleAnimation,
//        child: Material(
//          animationDuration: duration,
//          borderRadius: BorderRadius.all(Radius.circular(40)),
//          elevation: 8,
//          color: backgroundColor,
//          child: SingleChildScrollView(
//            scrollDirection: Axis.vertical,
//            physics: ClampingScrollPhysics(),
//            child: Container(
//              padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
//              child: Column(
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: <Widget>[
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    mainAxisSize: MainAxisSize.max,
//                    children: [
//                      InkWell(
//                        child: Icon(Icons.menu, color: Colors.white),
//                        onTap: () {
//                          setState(() {
//                            if (isCollapsed)
//                              _controller.forward();
//                            else
//                              _controller.reverse();
//
//                            isCollapsed = !isCollapsed;
//                          });
//                        },
//                      ),
//                      Text("My Cards", style: TextStyle(fontSize: 24, color: Colors.white)),
//                      Icon(Icons.settings, color: Colors.white),
//                    ],
//                  ),
//                  SizedBox(height: 50),
//                  Container(
//                    height: 200,
//                    child: PageView(
//                      controller: PageController(viewportFraction: 0.8),
//                      scrollDirection: Axis.horizontal,
//                      pageSnapping: true,
//                      children: <Widget>[
//                        Container(
//                          margin: const EdgeInsets.symmetric(horizontal: 8),
//                          color: Colors.redAccent,
//                          width: 100,
//                        ),
//                        Container(
//                          margin: const EdgeInsets.symmetric(horizontal: 8),
//                          color: Colors.blueAccent,
//                          width: 100,
//                        ),
//                        Container(
//                          margin: const EdgeInsets.symmetric(horizontal: 8),
//                          color: Colors.greenAccent,
//                          width: 100,
//                        ),
//                      ],
//                    ),
//                  ),
//                  SizedBox(height: 20),
//                  Text("Music", style: TextStyle(color: Colors.white, fontSize: 20),),
//                  ListView.separated(
//                      shrinkWrap: true,
//                      itemBuilder: (context, index) {
//                        return ListTile(
//                          title: Text("Same Beef", style: TextStyle(
//                            fontWeight: FontWeight.w700,
//                            fontSize: 25
//                          ),),
//                          subtitle: Text(" Sidhu Moosewala", style: TextStyle(
//                              fontWeight: FontWeight.w300,
//                              fontSize: 19,
//                              color: Colors.white60
//                          ),),
//                          trailing: Text("1M+ views", style: TextStyle(
//                              fontWeight: FontWeight.w700,
//                              fontSize: 15
//                          ),),
//                        );
//                      }, separatorBuilder: (context, index) {
//                    return Divider(height: 16);
//                  }, itemCount: 10)
//                ],
//              ),
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify/components/auth.dart';
import 'package:spotify/logic/auth_logic.dart';
import 'package:spotify/components/auth.dart';
import 'package:spotify/logic/home_logic.dart';
class SpotifyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          height: 60.0,
          color: Colors.grey.withOpacity(0.2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.home),
                  Text("Home"),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.search),
                  Text("Search"),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.library_music),
                  Text("Library"),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.person_outline),
                  Text("Premium"),
                ],
              ),
            ],
          ),
        ),
        body: SafeArea(
            child: ListView(
              children: <Widget>[
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Material(
                        child: ChangeNotifierProvider(
                          builder: (_)=>RecentlyPlayedLogic(),
                          child: RecenlyPlayed(),
                        ),
                      )
                      // MadeforYou(),
                      // RecomendedforYou(),
                      // PopularTrending(),
                      // EditorsPicks(),
                      // GlobalReleases(),
                      // BecauseYouLike(),


                    ],
                  ),
                ),
              ],
            )
        )
    );
  }
}

class RecenlyPlayed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sessionObject = Provider.of<SessionManagement>(context);
    final recentlyPlayed = Provider.of<RecentlyPlayedLogic>(context);
    if(!recentlyPlayed.funCalled){
      recentlyPlayed.getSongHistory();
    }

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InkWell(
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: ()async{
                        if(await sessionObject.logout()){
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Material(
                            child: ChangeNotifierProvider(
                              builder: (_)=>SessionManagement(),
                              child: FirebaseSession(),
                            ),
                          ),), (Route<dynamic> route)=>false);
                        }else{

                        }
                      },
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 10.0),
            child: Text("Recently played", style: TextStyle(
                fontFamily: 'Proxima Nova Bold',
                fontSize: 30.0
            ),),
          ),

          !recentlyPlayed.funCalled ? Center(
            child: CircularProgressIndicator(),
          ) : Container(
            height: MediaQuery.of(context).size.height*0.30,
            child: ListView.builder(
              shrinkWrap: true,
              primary: false,
              scrollDirection: Axis.horizontal,
              itemCount: recentlyPlayed.recntlyPlayedStuff.length,
              itemBuilder: (context, i){
                return Container(
                  margin: EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height*0.2,
                        width: MediaQuery.of(context).size.height*0.2,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: recentlyPlayed.recntlyPlayedStuff[i].type == "song" ? NetworkImage(recentlyPlayed.recntlyPlayedStuff[i].thumbnail) : AssetImage(recentlyPlayed.recntlyPlayedStuff[i].thumbnail),
                              fit: BoxFit.cover,
                            )
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(recentlyPlayed.recntlyPlayedStuff[i].title, style: TextStyle(
                        fontFamily: 'Proxima Nova Bold',
                        fontSize: 18.0,
                      ),),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}