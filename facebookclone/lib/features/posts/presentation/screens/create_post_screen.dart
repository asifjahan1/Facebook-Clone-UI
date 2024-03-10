import 'dart:io';

import 'package:facebookclone/core/constants/app_colors.dart';
import 'package:facebookclone/core/constants/constants.dart';
import 'package:facebookclone/core/utils/utils.dart';
import 'package:facebookclone/core/widgets/round_button.dart';
import 'package:facebookclone/features/posts/presentation/widgets/image_video_view.dart';
import 'package:facebookclone/features/posts/presentation/widgets/profile_info.dart';
import 'package:facebookclone/features/posts/providers/posts_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreatePostScreen extends ConsumerStatefulWidget {
  const CreatePostScreen({super.key});

  static const routeName = '/create-post';

  @override
  ConsumerState<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends ConsumerState<CreatePostScreen> {
  late final TextEditingController _postController;
  File? file;
  String fileType = 'image';
  bool isLoading = false;

  @override
  void initState() {
    _postController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _postController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: makePost,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.blue), // Set background color
                foregroundColor: MaterialStateProperty.all<Color>(
                    Colors.white), // Set text color
              ),
              child: const Text('Post'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: Constants.defaultPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProfileInfo(),
              // post text field
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _postController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    // Use OutlineInputBorder for a border
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ), // Set border color
                    borderRadius:
                        BorderRadius.circular(10.0), // Set border radius
                  ),
                  hintText: 'What\'s on your mind?',
                  hintStyle: const TextStyle(
                    fontSize: 18,
                    color: AppColors.darkGreyColor,
                  ),
                ),
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 10,
              ),
              const SizedBox(height: 20),
              file != null
                  ? ImageVideoView(
                      file: file!,
                      fileType: fileType,
                    )
                  : PickFileWidget(
                      pickImage: () async {
                        fileType = 'image';
                        file = await pickImage();
                        setState(() {});
                      },
                      pickVideo: () async {
                        fileType = 'video';
                        file = await pickVideo();
                        setState(() {});
                      },
                    ),
              const SizedBox(height: 20),
              isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : RoundButton(
                      onPressed: makePost,
                      label: 'Post',
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> makePost() async {
    if (!mounted) return; // Check if the widget is mounted

    setState(() => isLoading = true);

    try {
      await ref.read(postsProvider).makePost(
            content: _postController.text,
            file: file!,
            postType: fileType,
          );
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
    } catch (error) {
      if (kDebugMode) {
        print(error);
      } // Handle error appropriately
    } finally {
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }
}

class PickFileWidget extends StatelessWidget {
  const PickFileWidget({
    super.key,
    required this.pickImage,
    required this.pickVideo,
  });

  final VoidCallback pickImage;
  final VoidCallback pickVideo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: pickImage,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue, // Change the text color to white
            padding: const EdgeInsets.all(16), // Add padding
            textStyle: const TextStyle(fontSize: 18), // Change text style
          ),
          child: const Text('Pick Image'),
        ),
        const Divider(),
        TextButton(
          onPressed: pickVideo,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue, // Change the text color to white
            padding: const EdgeInsets.all(16), // Add padding
            textStyle: const TextStyle(fontSize: 18), // Change text style
          ),
          child: const Text('Pick Video'),
        ),
      ],
    );
  }
}
