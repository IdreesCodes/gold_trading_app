import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/api_constants.dart';
import '../../utils/app_constants.dart';
import '../../utils/color_constants.dart';
import 'app_button.dart';

class CustomFilePickerField extends StatefulWidget {
  CustomFilePickerField({
    super.key,
    required this.title,
    this.uploadedUrl,

    required this.onFileSelection,
    required this.onFileDelete,
    this.validator,
    this.allowedExtensions,
  });

  String title;

  String? uploadedUrl;
  final Function(File?) onFileSelection;
  final Function() onFileDelete;
  List<String>? allowedExtensions;
  final String? Function(File?)? validator;

  @override
  State<CustomFilePickerField> createState() => _CustomFilePickerFieldState();
}

class _CustomFilePickerFieldState extends State<CustomFilePickerField> {
  File? file;
  String? fileName;
  String? errorText;

  void _validate() {
    setState(() {
      errorText = widget.validator != null ? widget.validator!(file) : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          widget.title,
          style: TextStyle(
            color:
                 ColorConstants.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: () async {
            FilePickerResult? result = await FilePicker.platform.pickFiles(
              type: widget.allowedExtensions != null && widget.allowedExtensions!.isNotEmpty
                  ? FileType.custom
                  : FileType.any,
              allowedExtensions: widget.allowedExtensions,
            );
            if (result != null) {
              file = File(result.files.single.path!);
              fileName = result.files.single.name;
              String fileExtension = fileName!.split('.').last.toLowerCase();
              if (widget.allowedExtensions != null &&
                  !widget.allowedExtensions!.contains(fileExtension)) {

                setState(() {
                  file = null;
                  fileName = null;
                  errorText = 'Zulässige Dateitypen: ${widget.allowedExtensions!.toString().toUpperCase()}';
                });
              } else {

                widget.onFileSelection(file);
                _validate();
                setState(() {
                  errorText = null;
                });
              }
            }
          },

          child: file != null
              ? Row(
            children: [
              Expanded(
                child: Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0),
                            child: Text(
                              fileName.toString(),
                              overflow: TextOverflow.ellipsis,
                              style: AppConstants.description.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              CustomButton(
                onPress: () {
                  setState(() {
                    file = null;
                    errorText = null; // Clear error when file is deleted
                  });
                  widget.onFileDelete();
                },
                title: 'X',
                titleTextStyle:
                AppConstants.description.copyWith(color: Colors.white),
                bgColor: Colors.redAccent,
                width: 50,
              ),
            ],
          )
              : Container(
            height: 40,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              border: Border.all(),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Text('Dokument hochladen')),
                SizedBox(width: 10),
                Icon(Icons.cloud_upload),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              errorText!,
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
        if (file != null)
          !(file!.path.contains(".docx")) && !(file!.path.contains(".pdf"))
              ? Image.file(
            File(file!.path),
            height: 120,
            width: 100,
          )
              : Image.asset(
            file!.path.contains(".docx")
                ? "assets/images/word.png"
                : file!.path.contains(".pdf")
                ? "assets/images/pdf-file-format.png"
                : "assets/images/png_formate.png",
            height: 80,
            width: 100,
          ),
        if (widget.uploadedUrl != null)
          GestureDetector(
            onTap: () {
              launchUrl(Uri.parse(
                  "${APIConstants.fileBaseUrl}${widget.uploadedUrl}"));
            },
            child: !(widget.uploadedUrl.toString().contains(".docx")) &&
                !(widget.uploadedUrl.toString().contains(".pdf"))
                ? Image.network(
              "${APIConstants.fileBaseUrl}${widget.uploadedUrl}",
              height: 120,
              width: 100,
            )
                : Image.asset(
              widget.uploadedUrl.toString().contains(".docx")
                  ? "assets/images/word.png"
                  : widget.uploadedUrl.toString().contains(".pdf")
                  ? "assets/images/pdf-file-format.png"
                  : "assets/images/png_formate.png",
              height: 80,
              width: 100,
            ),
          ),
        const SizedBox(height: 15),
      ],
    );
  }
}
