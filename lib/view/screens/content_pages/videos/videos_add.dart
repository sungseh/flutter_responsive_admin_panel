
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_responsive_admin_panel/blocs/bloc.dart';
import 'package:flutter_responsive_admin_panel/misc/misc.dart';
import 'package:flutter_responsive_admin_panel/models/models.dart';
import 'package:flutter_responsive_admin_panel/view/widgets/widgets.dart';
import 'package:provider/provider.dart';


class AddVideo extends StatefulWidget {
  // final Place videoData;
  final VideoModel? videoData;


  const AddVideo({
    Key? key, 
    this.videoData
  }) : super(key: key);

  @override
  State<AddVideo> createState() => _AddVideoState();
}

class _AddVideoState extends State<AddVideo> { 
  FileModel? file;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final String collectionName = 'categories';
  List? paths = [];
  bool uploadStarted = false;
  bool toggleValue = false;

  var stateSelection;
  
  var nameCtrl = TextEditingController();
  var locationCtrl = TextEditingController();
  var descriptionCtrl = TextEditingController();
  var image1Ctrl = TextEditingController();
  var image2Ctrl = TextEditingController();
  var image3Ctrl = TextEditingController();
  var latCtrl = TextEditingController();
  var lngCtrl = TextEditingController();

  var startpointNameCtrl = TextEditingController();
  var endpointNameCtrl = TextEditingController();
  var priceCtrl = TextEditingController();
  var startpointLatCtrl = TextEditingController();
  var startpointLngCtrl = TextEditingController();
  var endpointLatCtrl = TextEditingController();
  var endpointLngCtrl = TextEditingController();
  var pathsCtrl = TextEditingController();

  clearFields(){
    nameCtrl.clear();
    locationCtrl.clear();
    descriptionCtrl.clear();
    image1Ctrl.clear();
    image2Ctrl.clear();
    image3Ctrl.clear();
    latCtrl.clear();
    lngCtrl.clear();
    startpointNameCtrl.clear();
    endpointNameCtrl.clear();
    priceCtrl.clear();
    startpointLatCtrl.clear();
    startpointLngCtrl.clear();
    endpointLatCtrl.clear();
    endpointLngCtrl.clear();
    pathsCtrl.clear();
    paths!.clear();
    FocusScope.of(context).unfocus();
  }
   
  void handleSubmit() async {
    final AdministratorBloc ab = Provider.of<AdministratorBloc>(context, listen: false);
    if(stateSelection == null){
      openDialog(context, 'Select City First', '');
    } else {
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();
        if(paths!.isEmpty){
          // openSnacbar(scaffoldKey, 'Paths List can not be empty');
        } else {
          if (ab.userType == 'tester') {
            openDialog(context, 'You are a Tester', 'Only Admin can upload, delete & modify contents');
          } else {
            setState(()=> uploadStarted = true);
            await saveToDatabase();
            setState(()=> uploadStarted = false);
            openDialog(context, 'Updated Successfully', '');
            //clearFields();
          }
        }
      }
    } 
  }
 
  Future saveToDatabase() async {
    // final DocumentReference ref = firestore.collection(collectionName).doc(widget.videoData.timestamp);
    // final DocumentReference ref1 = firestore.collection(collectionName).doc(widget.videoData.timestamp).collection('travel guide').doc(widget.videoData.timestamp);
     
    // var videoData = {
    //   'state' : stateSelection,
    //   'place name' : nameCtrl.text,
    //   'location' : locationCtrl.text,
    //   'latitude' : double.parse(latCtrl.text),
    //   'longitude' : double.parse(lngCtrl.text),
    //   'description' : descriptionCtrl.text,
    //   'image-1' : image1Ctrl.text,
    //   'image-2' : image2Ctrl.text,
    //   'image-3' : image3Ctrl.text,
    // };

    // var guideData  = {
    //   'startpoint name' : startpointNameCtrl.text,
    //   'endpoint name' : endpointNameCtrl.text,
    //   'startpoint lat' : double.parse(startpointLatCtrl.text),
    //   'startpoint lng' : double.parse(startpointLngCtrl.text),
    //   'endpoint lat' : double.parse(endpointLatCtrl.text),
    //   'endpoint lng' : double.parse(endpointLngCtrl.text),
    //   'price': priceCtrl.text,
    //   'paths' : paths
    // };

    // await ref.update(_videoData)
    // .then((value) => ref1.update(_guideData));
  }
 
  Future getGuideData () async {
    // firestore.collection(collectionName).doc(widget.videoData.timestamp).collection('travel guide').doc(widget.videoData.timestamp).get().then((DocumentSnapshot snap){
    //   Map x = snap.data() as Map<dynamic, dynamic>;
    //   startpointNameCtrl.text = x['startpoint name'];
    //   endpointNameCtrl.text = x['endpoint name'];
    //   startpointLatCtrl.text = x['startpoint lat'].toString();
    //   startpointLngCtrl.text = x['startpoint lng'].toString();
    //   endpointLatCtrl.text = x['endpoint lat'].toString();
    //   endpointLngCtrl.text = x['endpoint lng'].toString();
    //   priceCtrl.text = x['price'];
    //   setState(() {
    //     paths = x['paths'];
    //   });
    // });
  }
 
  initData (){
    // stateSelection = widget.videoData.state;
    nameCtrl.text = widget.videoData?.title ?? "";
    // locationCtrl.text = widget.videoData.location!;
    // descriptionCtrl.text = widget.videoData.description!;
    // image1Ctrl.text = widget.videoData.imageUrl1!;
    // image2Ctrl.text = widget.videoData.imageUrl2!;
    // image3Ctrl.text = widget.videoData.imageUrl3!;
    // latCtrl.text = widget.videoData.latitude.toString();
    // lngCtrl.text = widget.videoData.longitude.toString();
    getGuideData();
  }
 
  @override
  void initState() { 
    super.initState();
    initData();
  }
   
  handlePreview() async{
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      if(paths!.isNotEmpty){
        // showPlacePreview(
        //   context, 
        //   nameCtrl.text, 
        //   locationCtrl.text, 
        //   image1Ctrl.text, 
        //   descriptionCtrl.text, 
        //   double.parse(latCtrl.text), 
        //   double.parse(lngCtrl.text), 
        //   startpointNameCtrl.text, 
        //   endpointNameCtrl.text, 
        //   double.parse(startpointLatCtrl.text), 
        //   double.parse(startpointLngCtrl.text),
        //   double.parse(endpointLatCtrl.text),
        //   double.parse(endpointLngCtrl.text),
        //   priceCtrl.text,
        //   paths
        // );
      } else {
        openToast(context, 'Path List is Empty!');
      }
    }
  }


  Widget statesDropdown() {
    final AdministratorBloc ab = Provider.of(context, listen: false);
    return Container(
      height: 50,
      padding: const EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(30)
      ),
      child: DropdownButtonFormField(
        itemHeight: 50,
        decoration: const InputDecoration(border: InputBorder.none),
        onChanged: (dynamic value) {
          setState(() {
            stateSelection = value;
          });
        },
        onSaved: (dynamic value) {
          setState(() {
            stateSelection = value;
          });
        },
        value: stateSelection,
        hint: const Text('Select State'),
        items: ab.categories.map((f) {
          return DropdownMenuItem(
            value: f,
            child: Text(f),
          );
        }).toList()
      )
    );
  }
 
  @override
  Widget build(BuildContext context) {
    final AdministratorBloc ab = Provider.of(context, listen: false);

    return AppAddForm( 
      formKey: formKey,
      children: <Widget>[
        const AppAddContentTitle("Add Video"),
        // AppFileUploadButton(),
        AppDropZone(
          // onDroppedFile: (FileModel value) {  },
          // onDroppedFile: file,
          onDroppedFile: (file) => setState(() => this.file = file) ,
        ),
        AppDroppedFile(
          file: file, 
        ),
        AppTextFormField(
          placeholder: 'Enter Video Title',
          title: 'Video Title',
          controller: nameCtrl,
          validator: (value){
            if(value!.isEmpty) return 'Value is empty'; return null;
          },
        ),   
        AppDropDown(
          placeholder: 'Select Presenter',
          items: ab.presenters.map((f) {
            return DropdownMenuItem(
              value: f,
              child: Text(f),
            );
          }).toList()
        ),
        AppDropDown(
          placeholder: 'Select Category',
          items: ab.categories.map((f) {
            return DropdownMenuItem(
              value: f,
              child: Text(f),
            );
          }).toList()
        ), 
        AppToggleButton(
          label: "Premium", 
          value: false,
          onChanged: (bool value) { 
            setState(() {
              toggleValue = value; 
            }); 
          }, 
        ),
        AppToggleButton(
          label: "Active", 
          value: false, 
          onChanged: (bool value) { 
            setState(() {
              toggleValue = value; 
            }); 
          }, 
        ), 
        const AppRichTextField(),
        AppTextFormArea(
          placeholder: 'Enter description',
          label: 'Video Description',
          controller: descriptionCtrl,
          validator: (value){
            if(value!.isEmpty) return 'Value is empty'; return null;
          }, 
        ),
        Container(
          color: Theme.of(context).primaryColor,
          height: 45,
          child: uploadStarted == true ?
          const Center(
            child: SizedBox(
              height: 30, 
              width: 30,
              child: CircularProgressIndicator()
            )
          ) :
          TextButton(
            child: const Text(
              'Update Place Data',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600
              ),
            ),
            onPressed: () async{
              handleSubmit();
            }
          )
        ), 
      ],
    );
  } 
}
