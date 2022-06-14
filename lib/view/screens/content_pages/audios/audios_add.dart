
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_responsive_admin_panel/blocs/bloc.dart';
import 'package:flutter_responsive_admin_panel/misc/misc.dart';
import 'package:flutter_responsive_admin_panel/models/models.dart';
import 'package:flutter_responsive_admin_panel/utils/utils.dart';
import 'package:flutter_responsive_admin_panel/view/widgets/widgets.dart';
import 'package:provider/provider.dart';


class AddAudio extends StatefulWidget {
  // final Place audioData;
  final AudioModel? audioData;


  const AddAudio({
    Key? key, 
    this.audioData
  }) : super(key: key);

  @override
  State<AddAudio> createState() => _AddAudioState();
}

class _AddAudioState extends State<AddAudio> { 
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  var formKey = GlobalKey<FormState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final String collectionName = 'categories';
  List? paths = [];
  String _helperText = 'Enter paths list to help users to go to the desired destination like : Dhaka to Sylhet by Bus - 200Tk.....';
  bool uploadStarted = false;
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
        if(paths!.length == 0){
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
    // final DocumentReference ref = firestore.collection(collectionName).doc(widget.audioData.timestamp);
    // final DocumentReference ref1 = firestore.collection(collectionName).doc(widget.audioData.timestamp).collection('travel guide').doc(widget.audioData.timestamp);
     
    var _audioData = {
      'state' : stateSelection,
      'place name' : nameCtrl.text,
      'location' : locationCtrl.text,
      'latitude' : double.parse(latCtrl.text),
      'longitude' : double.parse(lngCtrl.text),
      'description' : descriptionCtrl.text,
      'image-1' : image1Ctrl.text,
      'image-2' : image2Ctrl.text,
      'image-3' : image3Ctrl.text,
    };

    var _guideData  = {
      'startpoint name' : startpointNameCtrl.text,
      'endpoint name' : endpointNameCtrl.text,
      'startpoint lat' : double.parse(startpointLatCtrl.text),
      'startpoint lng' : double.parse(startpointLngCtrl.text),
      'endpoint lat' : double.parse(endpointLatCtrl.text),
      'endpoint lng' : double.parse(endpointLngCtrl.text),
      'price': priceCtrl.text,
      'paths' : paths
    };

    // await ref.update(_audioData)
    // .then((value) => ref1.update(_guideData));
  }
 
  Future getGuideData () async {
    // firestore.collection(collectionName).doc(widget.audioData.timestamp).collection('travel guide').doc(widget.audioData.timestamp).get().then((DocumentSnapshot snap){
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
    // stateSelection = widget.audioData.state;
    nameCtrl.text = widget.audioData?.title ?? "";
    // locationCtrl.text = widget.audioData.location!;
    // descriptionCtrl.text = widget.audioData.description!;
    // image1Ctrl.text = widget.audioData.imageUrl1!;
    // image2Ctrl.text = widget.audioData.imageUrl2!;
    // image3Ctrl.text = widget.audioData.imageUrl3!;
    // latCtrl.text = widget.audioData.latitude.toString();
    // lngCtrl.text = widget.audioData.longitude.toString();
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
            child: Text(f),
            value: f,
          );
        }).toList()
      )
    );
  }
 
  @override
  Widget build(BuildContext context) {
    final AdministratorBloc ab = Provider.of(context, listen: false);

    return AppCoverWidget(
      widget: Form( 
        key: formKey,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text(
                "Add Audio", 
                style: TextStyle(
                  fontSize: 30, 
                  fontWeight: FontWeight.w800
                )
              ),
            ),
            AppTextFormField(
              placeholder: 'Enter Audio Title',
              title: 'Audio Title',
              controller: nameCtrl,
              validator: (value){
                if(value!.isEmpty) return 'Value is empty'; return null;
              },
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
            AppTextFormField(
              placeholder: 'Enter location name',
              title: 'Location name',
              controller: locationCtrl,
               validator: (value){
                if(value!.isEmpty) return 'Value is empty'; return null;
              }, 
            ),  
            AppTextFormField(
              placeholder: 'Enter image url (thumbnail)',
              title: 'Image1(Thumbnail)',
              controller: image1Ctrl,
               validator: (value){
                if(value!.isEmpty) return 'Value is empty'; return null;
              }, 
            ),   
            AppTextFormField(
              placeholder: 'Enter image url',
              title: 'Image2',
              controller: image2Ctrl,
               validator: (value){
                if(value!.isEmpty) return 'Value is empty'; return null;
              }, 
            ),
            AppTextFormArea(
              placeholder: 'Enter place details (Html or Normal Text)',
              label: 'Place details',
              controller: descriptionCtrl,
              validator: (value){
                if(value!.isEmpty) return 'Value is empty'; return null;
              }, 
            ),  
            Container(
              child: paths!.length == 0 ? 
              const Center(child: Text('No path list were added')) :
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: paths!.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(index.toString()),
                    ),
                    title: Text(paths![index]),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline), 
                      onPressed: (){
                        setState(() {
                          paths!.remove(paths![index]);
                          _helperText = 'Added ${paths!.length} items';
                        });
                      }),
                  );
                },
              ), 
            ), 
            const SizedBox(height: 100), 
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton.icon(
                  icon: const Icon(Icons.remove_red_eye, size: 25, color: Colors.blueAccent,),
                  label: const Text('Preview', style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black
                  ),),
                  onPressed: (){
                    handlePreview();
                  }
                )
              ],
            ), 
            Container(
              color: Colors.deepPurpleAccent,
              height: 45,
              child: uploadStarted == true ?
              Center(
                child: Container(
                  height: 30, 
                  width: 30,
                  child: const CircularProgressIndicator()
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
        )
      ),
    ); 
  } 
}
