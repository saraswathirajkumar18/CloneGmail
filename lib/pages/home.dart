import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//this home widget contains the our ui design
//why need to statefulwidget-for work,sign in ,create account all these button appearance change when we click on that.
//button has 2 design -before and after click right-to reflect those changes we statefulwidget-setState()
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //the variable it doesn't
  bool isSignClicked = false;
  bool isWorkClicked = false;
  bool isDropdownOpened = false;
  String? selectedValue;

  //we are override default build() with content we want
  //whenever we run the code it starts executon from build()
  @override
  Widget build(BuildContext context) {
    //Scaffold-contains built-in widgets like-appBar,body-to content
    return Scaffold(
        //add spacing(in all sides) before widget
        body: Padding(
      padding: const EdgeInsets.all(12.0),
      //Row()-like to display content in single line-logo,gmail,buttons
      child: Row(
        //spaceBetween-add space btw 2 widgets
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //It contains gmail logo,text
          Row(
            children: [
              //Image.asset()-used to display local image with given size
              Image.asset(
                'assets/images/logo.png',
                width: 27, // Optional: set size
                height: 27,
              ),
              //add space between logo,text
              //it take space as per given width
              SizedBox(width: 7),
              //Show Text
              Text(
                'Gmail',
                //style the text-change color,size,width,font-family of the text
                //i used google fonts package so GoogleFonts.roboto() otherwise you can download desired font family and mention it in TextStyle()
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    //if given font family not aviailble then use fallback value
                    fontFamilyFallback: ["Arial", "sans-serif"],
                    color: Color.fromARGB(255, 95, 99, 104),
                  ),
                ),
              )
            ],
          ),
          //it has for work,sign in,create an account buttons
          Row(
              //need to same space among the buttons so i used-spaceEvenly
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //different ways we can make widget as clickable-add GestureDetector(),InkWell()
              //we can use different built-in buttons based on our need-text button,elevated button
              children: [
                //mention what need to do when click on button
                //after confirm the button is click only we able to perform action
                //change value to true
                //after set value it execution starts from build() and isWorkClicked=true so container bg color change
                GestureDetector(
                    onTap: () {
                      setState(() {
                        isWorkClicked = true;
                      });
                    },
                    //it is used to show the bg color to text
                    child: Container(
                      //add space around the text
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 12),
                      decoration: BoxDecoration(
                        //container background is change from one color to another when user click on the button
                        color: isWorkClicked
                            ? Color.fromARGB(255, 239, 240, 243)
                            : Colors.transparent, // Background color
                        //change border corner-rounded,rectangular based on the given value.-
                        borderRadius: BorderRadius.circular(8), // Optional:
                      ),
                      child: Text(
                        'For work',
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            //different ways we can mention the color-i used Color.fromARGB()-(transparency,red,green,blue)
                            color: Color.fromARGB(255, 26, 115, 232),
                          ),
                        ),
                      ),
                    )),
                //text button has predefined design and style like shape,padding.It reduces the alignment.but in some scenario,padding space is looks more.we don't want that for our design that time use guesturedetecto/inkwell
                TextButton(
                    onPressed: () {
                      //when press the button i want to change the border color so i want to indicate button is clicked by change to true
                      setState(() {
                        isSignClicked = true;
                      });
                    },
                    //style the button
                    style: TextButton.styleFrom(
                      //provide border details-color,width of the border
                      side: BorderSide(
                        color: isSignClicked
                            ? Color.fromARGB(255, 26, 115, 232)
                            : Color.fromARGB(255, 209, 209,
                                213), // 👈 Change this to any color you want
                        width: 0.8, // Optional: border width
                      ),
                      //change the border shape like-rounded corner border
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    //mention the text for button
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Sign in',
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 26, 115, 232),
                          ))),
                    )),

                //add the space
                SizedBox(width: 10),
                //DropdownButton2() widget
                DropdownButton2(
                  //by default underline is shown in dropdown button text-create an account
                  //it designed using container-to avoid display content we use sizedbox.shrink()-it hide the underline
                  underline: SizedBox.shrink(),
                  //if button is clicked button state value passed internally,to check button click status-store that vallue in isDropdownOpened
                  onMenuStateChange: (isOpen) {
                    setState(() {
                      isDropdownOpened = isOpen;
                    });
                  },
                  //mention design and content of the drop down button
                  customButton: Container(
                    width: 188,
                    height: 40,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 26, 115, 232),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      //mainAxisSize: MainAxisSize.min,
                      children: [
                        //if we add text,divider and icon it only occupy the space based on its content so it show remaning space at at the end
                        //for alignment purpose(add icon at end) i added expanded so text takes all the space, remaining space taken by icon
                        Expanded(
                            child: Text('Create an account',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white))),
                        //add divider between text and icon
                        VerticalDivider(
                          color: Colors.white,
                          thickness: 1,
                          width: 20, // controls spacing around the divider
                        ),
                        //show dropdow icon
                        //if dropdown button is clicked(isDropdownOpened=true) then show arrow drop down to up
                        isDropdownOpened
                            ? const Icon(Icons.arrow_drop_up,
                                color: Colors.white, size: 20)
                            : const Icon(Icons.arrow_drop_down,
                                color: Colors.white, size: 20),
                      ],
                    ),
                  ),
                  //used to set dropdown content-text
                  items: [
                    //mention each item seperately-we want 2 options then add those in seperate dropdownmenuitem()
                    //mention value for corresponding option
                    //option1
                    DropdownMenuItem(
                        child: Text('For my personal use',
                            //in default softWrap:true-if text reaches the end of the line(available space).it moves to the next line
                            //i need to display in single line so set it to false
                            softWrap: false,
                            //text overflow it show "..." at the end
                            overflow: TextOverflow
                                .ellipsis, // <-- this clips overflow with "..."
                            //text apperance maxline-1
                            maxLines: 1,
                            style: TextStyle(
                                color: Color.fromARGB(255, 25, 103, 210),
                                fontSize: 13)),
                        value: 'personal'),
                    //option2
                    DropdownMenuItem(
                        child: Text('For my work or business',
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                color: Color.fromARGB(255, 25, 103, 210),
                                fontSize: 14)),
                        value: 'business'),
                  ],
                  //used to set dropdown design-bottom-how it need to appear
                  dropdownStyleData: DropdownStyleData(
                    elevation: 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white,
                    ),
                  ),
                  //user selected value is passed internally
                  onChanged: (value) {
                    setState(() {
                      //store that value in selectedvalue
                      selectedValue = value;
                    });
                  },
                )
              ]),
        ],
      ),
    ));
  }
}
