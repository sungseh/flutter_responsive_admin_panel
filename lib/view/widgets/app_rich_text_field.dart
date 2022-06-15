import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart'; 

class AppRichTextField extends StatefulWidget { 

  const AppRichTextField({
    Key? key,  
  }) : super(key: key);

  @override
  State<AppRichTextField> createState() => _AppRichTextFieldState();
}

class _AppRichTextFieldState extends State<AppRichTextField> { 
  @override
  Widget build(BuildContext context) {
    String result = '';
    final HtmlEditorController controller = HtmlEditorController();

    return Container(
      height: 300,
      width: 300,
      child: HtmlEditor(
        controller: controller,
        htmlEditorOptions: const HtmlEditorOptions(
          hint: 'Your text here...',
          shouldEnsureVisible: true,
          //initialText: "<p>text content initial, if any</p>",
        ),
        htmlToolbarOptions: HtmlToolbarOptions(
          toolbarPosition: ToolbarPosition.aboveEditor, //by default
          toolbarType: ToolbarType.nativeScrollable, //by default
          onButtonPressed: (ButtonType type, bool? status, Function? updateStatus) {
            // print("button '${describeEnum(type)}' pressed, the current selected status is $status");
            return true;
          },
          onDropdownChanged: (DropdownType type, dynamic changed, Function(dynamic)? updateSelectedItem) {
            // print("dropdown '${describeEnum(type)}' changed to $changed");
            return true;
          },
          mediaLinkInsertInterceptor: (String url, InsertFileType type) {
            print(url);
            return true;
          },
          mediaUploadInterceptor: (PlatformFile file, InsertFileType type) async {
            print(file.name); //filename
            print(file.size); //size in bytes
            print(file.extension); //file extension (eg jpeg or mp4)
            return true;
          },
        ),
        otherOptions: const OtherOptions(height: 550),
        callbacks: Callbacks(onBeforeCommand: (String? currentHtml) {
          print('html before change is $currentHtml');
        }, onChangeContent: (String? changed) {
          print('content changed to $changed');
        }, onChangeCodeview: (String? changed) {
          print('code changed to $changed');
        }, onChangeSelection: (EditorSettings settings) {
          print('parent element is ${settings.parentElement}');
          print('font name is ${settings.fontName}');
        }, onDialogShown: () {
          print('dialog shown');
        }, onEnter: () {
          print('enter/return pressed');
        }, onFocus: () {
          print('editor focused');
        }, onBlur: () {
          print('editor unfocused');
        }, onBlurCodeview: () {
          print('codeview either focused or unfocused');
        }, onInit: () {
          print('init');
        },
            //this is commented because it overrides the default Summernote handlers
            /*onImageLinkInsert: (String? url) {
            print(url ?? "unknown url");
          },
          onImageUpload: (FileUpload file) async {
            print(file.name);
            print(file.size);
            print(file.type);
            print(file.base64);
          },*/
            onImageUploadError: (FileUpload? file, String? base64Str,
                UploadError error) {
          // print(describeEnum(error));
          print(base64Str ?? '');
          if (file != null) {
            print(file.name);
            print(file.size);
            print(file.type);
          }
        }, onKeyDown: (int? keyCode) {
          print('$keyCode key downed');
          // print('current character count: ${controller.characterCount}');
        }, onKeyUp: (int? keyCode) {
          print('$keyCode key released');
        }, onMouseDown: () {
          print('mouse downed');
        }, onMouseUp: () {
          print('mouse released');
        }, onNavigationRequestMobile: (String url) {
          print(url);
          return NavigationActionPolicy.ALLOW;
        }, onPaste: () {
          print('pasted into editor');
        }, onScroll: () {
          print('editor scrolled');
        }),
        plugins: [ SummernoteAtMention(
              getSuggestionsMobile: (String value) {
                var mentions = <String>['test1', 'test2', 'test3'];
                return mentions
                    .where((element) => element.contains(value))
                    .toList();
              },
              mentionsWeb: ['test1', 'test2', 'test3'],
              onSelect: (String value) {
                print(value);
              }),
        ],
      ),
    );
  }
}
 