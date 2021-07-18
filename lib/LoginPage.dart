import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

class LoginPage extends StatefulWidget {


  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  double heading =100;
  int state = 0;
  double loginWidth =0;
  double loginYOffset = 0;
  double loginXOffset = 0;
  double regYOffset =0;
  double loginOpacity = 1;
  double loginHeight =0;
  double regHeight =0;
  bool keyboard = false;

  Color? backgroundColor= Colors.white;
  var btnColor= Colors.lightBlueAccent;
  @override
  void initState() {
    super.initState();
    // var keyboardVisibilityController = KeyboardVisibilityController();
    // keyboardVisibilityController.onChange.listen((bool visible) {
    //   print('Keyboard visibility update. Is visible: ${visible}');
    //   setState(() {
    //     keyboard= visible;
    //   });
    // });
    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() {
          keyboard = visible;
          print("Keyboard State Changed : $visible");
        });
      },
    );

  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;
    // double blockSizeHorizontal = screenWidth / 100;
    double blockSizeVertical = screenHeight / 100;
    loginHeight = screenHeight - 270;
    regHeight = screenHeight - 270;

    switch(state) {
      case 0:
        backgroundColor= Colors.white;


        loginYOffset= screenHeight;
        regYOffset=screenHeight;
        loginXOffset = 0;
        loginWidth =screenWidth;
        loginOpacity = 1;
        loginHeight = keyboard? screenHeight : screenHeight-270 ;

        break;
      case 1:

        backgroundColor = Colors.blue[300];
        loginYOffset = keyboard ? 55 : 250;
        regYOffset= screenHeight;
        loginXOffset = 0;
        loginOpacity = 1;
        loginWidth =screenWidth;
        loginHeight = keyboard? screenHeight : screenHeight-230 ;
        break;
      case 2:
        backgroundColor = Colors.blue[400];
        loginYOffset=200;
        regYOffset=230;
        loginXOffset = 20;
        loginWidth = screenWidth-40;
        loginOpacity = 0.6;
        loginHeight = keyboard? screenHeight : screenHeight-200 ;
        loginYOffset = keyboard ? 30 : 200;

        regYOffset = keyboard ? 75 : 230;
        regHeight =  keyboard ? screenHeight : screenHeight - 230;

    }

    return Stack(

      children: [
        AnimatedContainer(
          curve: Curves.easeIn,
          duration: Duration(milliseconds: 400),
          color: backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(

                child: Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          state=0;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: AnimatedContainer(
                          margin: EdgeInsets.only(top: blockSizeVertical*10),
                          duration: Duration(milliseconds: 400),
                          curve: Curves.easeIn,
                          child: Center(child: Column(
                            children: [
                              Text("Hey There!",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                              Text("Order Fruits Online!",style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),)
                            ],
                          )),

                        ),
                      ),
                    ),
                  ],

                ),
              ),
              Container(
                padding: EdgeInsets.all(70),
                child: AnimatedImage()
                ),
              Container(
                margin: EdgeInsets.only(bottom: blockSizeVertical*10),
                child: Center(
                    child: GestureDetector(
                      onTap: (){
                        print(state);
                        setState(() {
                          if (state != 0){
                            state=0;

                          }
                          else{
                            state=1;
                          }
                        });
                      },
                      child: InkWell(

                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          width: 250,
                          height: 50,

                          alignment: Alignment.center,
                          child: Text(
                            "Get Started!",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: "Poppins",
                              // fontWeight: FontWeight.bold,
                            ),

                          ),
                          decoration: BoxDecoration(
                              color: Colors.blue[400],
                              borderRadius: BorderRadius.circular(25)
                          ),

                        ),
                      ),
                    ),
                ),
              ),

            ],
          ),
        ),
        AnimatedContainer(
          height: loginHeight,

          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Login To Continue",
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                  ),
                  InputWithIcon(
                    icon: Icons.email,
                    hint: "Enter Email...",
                  ),
                  SizedBox(height: 20,),
                  InputWithIcon(
                    icon: Icons.vpn_key,
                    hint: "Enter Password...",
                  )
                ],
              ),

                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: PrimaryButton(btnText: "Login"),
                    ),
                    GestureDetector(
                      onTap: (){setState(() {
                        state=2;
                      });},
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25,right: 25,top: 0),
                        child: OutlineBtn(btnText: "Create an Account"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          width: loginWidth,
          duration: Duration(milliseconds: 400),
          curve: Curves.easeIn,

          decoration: BoxDecoration(color: Colors.lightBlue[100]!.withOpacity(loginOpacity),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            )
          ),
          transform: Matrix4.translationValues(loginXOffset, loginYOffset, 10),

        ),
        AnimatedContainer(
          height: regHeight,
          duration: Duration(milliseconds: 400),
          curve: Curves.easeIn,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
            Column(
            children: <Widget>[
            Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text(
              "Create a New Account",
              style: TextStyle(
                  fontSize: 20
              ),
            ),
        ),
        InputWithIcon(
            icon: Icons.email,
            hint: "Enter Email",
        ),
        SizedBox(height: 20,),
        InputWithIcon(
            icon: Icons.vpn_key,
            hint: "Enter Password...",
        )
        ],
        ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: PrimaryButton(btnText: "SignUp!"),

                    ),
                    GestureDetector(
                      onTap: (){setState(() {
                        state=1;
                      });},
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25,right: 25,top: 0),
                        child: OutlineBtn(btnText: "Back to Login"),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),

          decoration: BoxDecoration(color: Colors.blue[50],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              )
          ),
          transform: Matrix4.translationValues(0, regYOffset, 10),

        )
      ],
    );
  }
}

class PrimaryButton extends StatefulWidget {
  final String btnText;
  PrimaryButton({required this.btnText});

  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFFB40284A),
          borderRadius: BorderRadius.circular(50)
      ),
      padding: EdgeInsets.all(20),
      child: Center(
        child: Text(
          widget.btnText,
          style: TextStyle(
              color: Colors.white,
              fontSize: 16
          ),
        ),
      ),
    );
  }
}
class OutlineBtn extends StatefulWidget {
  final String btnText;
  OutlineBtn({required this.btnText});

  @override
  _OutlineBtnState createState() => _OutlineBtnState();
}

class _OutlineBtnState extends State<OutlineBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: Color(0xFFB40284A),
              width: 2
          ),
          borderRadius: BorderRadius.circular(50)
      ),
      padding: EdgeInsets.all(20),
      child: Center(
        child: Text(
          widget.btnText,
          style: TextStyle(
              color: Color(0xFFB40284A),
              fontSize: 16
          ),
        ),
      ),
    );
  }
}
class InputWithIcon extends StatefulWidget {
  final IconData icon;
  final String hint;
  InputWithIcon({required this.icon, required this.hint});

  @override
  _InputWithIconState createState() => _InputWithIconState();
}

class _InputWithIconState extends State<InputWithIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: Color(0xFFBC7C7C7),
              width: 2
          ),
          borderRadius: BorderRadius.circular(50)
      ),
      child: Row(
        children: <Widget>[
          Container(
              width: 60,
              child: Icon(
                widget.icon,
                size: 20,
                color: Color(0xFFBB9B9B9),
              )
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 20),
                  border: InputBorder.none,
                  hintText: widget.hint
              ),
            ),
          )
        ],
      ),
    );
  }
}
class AnimatedImage extends StatefulWidget {
  @override
  _AnimatedImageState createState() => _AnimatedImageState();
}

class _AnimatedImageState extends State<AnimatedImage> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(vsync: this,
  duration: const Duration(seconds: 3))..repeat(reverse: true);
  late Animation<Offset> _animation= Tween(
    begin: Offset.zero,
    end: Offset(0,0.1)
  ).animate(_controller);



  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return SlideTransition(position: _animation,
    child: Image.asset("assets/images/img1.png"),);
  }
}
