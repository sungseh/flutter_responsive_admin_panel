import 'package:flutter/material.dart';
import 'package:flutter_responsive_admin_panel/configs/configs.dart';

////////////////////////
//// RESPONSIVENESS ////
////////////////////////
const defaultPadding = 16.0;

// Watch breakpoint
const kWatchBreakpointMin = 30.0;
const kWatchBreakpointMax = 368.0;

// Mobile breakpoint
const kMobileBreakpointMin = kWatchBreakpointMax + 1;
const kMobileBreakpointMax = 599.0;

// Tablet breakpoint
const kTabletBreakpointMin = kMobileBreakpointMax + 1;
const kTabletBreakpointMax = 1439.0;

// Desktop breakpoint
const kDesktopBreakpointMin = kTabletBreakpointMax + 1;
const kDesktopBreakpointMax = 30000.0;
  
final Gradient kGreenBlackGradient = LinearGradient(
  begin: Alignment.bottomCenter,
  end: Alignment.topCenter,
  stops: const [0.65, 1],
  colors: [ 
    Colors.black, 
    ConfigColors.sourceGreen 
  ]
);

final Gradient kGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  stops: const [0.75, 1],
  colors: [ 
    ConfigColors.sourceGreen,
    ConfigColors.sourceYellow 
  ]
);

final Gradient kGradientBalance = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  stops: const [0, 0.7],
  colors: [ 
    ConfigColors.sourceYellow,
    ConfigColors.sourceGreen,
  ]
);

const Gradient kTransGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  stops: [0.6, 0.7],
  colors: [ 
    Color(0x00000000),
    Color(0x44000000), 
  ]
);


const double kDefaultPadding = 16.0;



/// Shimmer Settings
const bool shimmerEnabled = true;
// const ShimmerDirection kShimmerDirection = ShimmerDirection.ltr;
const Duration shimmerPeriod = Duration(seconds: 10);
Gradient shimmerGradient = LinearGradient(
  tileMode: TileMode.decal,
  begin: Alignment.topLeft,
  end: Alignment.bottomRight, 
  stops: const [0.1, 0.3, 0.5, 0.7, 0.9], 
  colors: [ 
    ConfigColors.sourceWhite, 
    ConfigColors.sourceTransBlack,
    ConfigColors.sourceWhite, 
    ConfigColors.sourceTransBlack,
    ConfigColors.sourceWhite,
  ], 
);

 
// Login Channels
const bool kAppleLogin = false;
const bool kGoogleLogin = false;
const bool kEmailLogin = true;
const bool kFacebookLogin = false;

// Validation
const Pattern kEmailRegEx = r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$";
const Pattern kPhoneRegEx = r'^(?:[+0]9)?[0-9]{11}$';
// const Pattern kPhoneRegEx = r'(^(?:[+0]9)?[0-9]{11}$)';
const Pattern kPasswordRegEx = r'^(.*){6,}$'; 

const appBarHeight = 200.0;
const expandedBarHeight = 100.0; //Was 150
const tabHeight = 50.0;


const double cardElevation = 1.0;
const int futureDelay = 100;
const int futureDelay2 = 500;

const kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

const kButtonTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 18.0,
);

const kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

const kBoxDecorationStyle = BoxDecoration(
  color: Colors.black54,
  borderRadius: BorderRadius.all(Radius.circular(30.0)),
);


const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  hintStyle: TextStyle(
    color: Colors.white,
  ),
  border: InputBorder.none,
  focusColor: Colors.white
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.white, width: 2.0),
  ),
);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const String mainfont = "Futura";
const String supportFont = "Open sans";
 


 
