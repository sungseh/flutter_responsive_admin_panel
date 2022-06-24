import 'dart:developer';

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
    final HtmlEditorController controller = HtmlEditorController();

    return SizedBox(
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
            // log("button '${describeEnum(type)}' pressed, the current selected status is $status");
            return true;
          },
          onDropdownChanged: (DropdownType type, dynamic changed, Function(dynamic)? updateSelectedItem) {
            // log("dropdown '${describeEnum(type)}' changed to $changed");
            return true;
          },
          mediaLinkInsertInterceptor: (String url, InsertFileType type) {
            log(url);
            return true;
          },
          mediaUploadInterceptor: (PlatformFile file, InsertFileType type) async {
            log(file.name); //filename
            log(file.size.toString()); //size in bytes
            log(file.extension.toString()); //file extension (eg jpeg or mp4)
            return true;
          },
        ),
        otherOptions: const OtherOptions(height: 550),
        callbacks: Callbacks(onBeforeCommand: (String? currentHtml) {
          log('html before change is $currentHtml');
        }, onChangeContent: (String? changed) {
          log('content changed to $changed');
        }, onChangeCodeview: (String? changed) {
          log('code changed to $changed');
        }, onChangeSelection: (EditorSettings settings) {
          log('parent element is ${settings.parentElement}');
          log('font name is ${settings.fontName}');
        }, onDialogShown: () {
          log('dialog shown');
        }, onEnter: () {
          log('enter/return pressed');
        }, onFocus: () {
          log('editor focused');
        }, onBlur: () {
          log('editor unfocused');
        }, onBlurCodeview: () {
          log('codeview either focused or unfocused');
        }, onInit: () {
          log('init');
        },
            //this is commented because it overrides the default Summernote handlers
            /*onImageLinkInsert: (String? url) {
            log(url ?? "unknown url");
          },
          onImageUpload: (FileUpload file) async {
            log(file.name);
            log(file.size);
            log(file.type);
            log(file.base64);
          },*/
            onImageUploadError: (FileUpload? file, String? base64Str,
                UploadError error) {
          // log(describeEnum(error));
          log(base64Str ?? '');
          if (file != null) {
            log(file.name!);
            log(file.size.toString());
            log(file.type!);
          }
        }, onKeyDown: (int? keyCode) {
          log('$keyCode key downed');
          // log('current character count: ${controller.characterCount}');
        }, onKeyUp: (int? keyCode) {
          log('$keyCode key released');
        }, onMouseDown: () {
          log('mouse downed');
        }, onMouseUp: () {
          log('mouse released');
        }, onNavigationRequestMobile: (String url) {
          log(url);
          return NavigationActionPolicy.ALLOW;
        }, onPaste: () {
          log('pasted into editor');
        }, onScroll: () {
          log('editor scrolled');
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
                log(value);
              }),
        ],
      ),
    );
  }
}
 