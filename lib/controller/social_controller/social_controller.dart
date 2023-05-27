import 'dart:developer';
import 'dart:io';
import 'package:ahamcare/model/social_model/get_social_model.dart';
import 'package:ahamcare/model/social_model/like_post_model.dart';
import 'package:ahamcare/model/social_model/post_social_page.dart';
import 'package:ahamcare/services/social_service/add_post_service.dart';
import 'package:ahamcare/services/social_service/social_service.dart';
import 'package:ahamcare/utils/error_popup/snackbar.dart';
import 'package:ahamcare/view/social_screen/widgets/create_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class SocialController extends ChangeNotifier {
  bool isLoading = false;
  bool isLiked = false;
  File? useravatar;
  bool imageVisible = false;
  List<SocialModel> socialList = [];
  List<PostSocialModel> postList = [];
  final TextEditingController description = TextEditingController();

  void getSocial(context) async {
    isLoading = true;
    notifyListeners();
    await SocialService().getSocialPage(context).then(
      (value) {
        if (value != null) {
          socialList = value;
          notifyListeners();
          isLoading = false;
          notifyListeners();
        } else {
          isLoading = false;
          notifyListeners();
          return null;
        }
      },
    );
    isLoading = false;
    notifyListeners();
  }

  Future<void> pickimage(context) async {
    try {
      await ImagePicker().pickImage(source: ImageSource.camera).then((value) {
        if (value != null) {
          final imageTemp = File(value.path);
          useravatar = imageTemp;
          log(useravatar.toString());

          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return const CreatePostScreen();
            },
          ));
        }
        log("image picked");
        notifyListeners();
      });

      notifyListeners();
    } on PlatformException catch (e) {
      log('Failed to pick image: $e');
    }
  }

  void addPost(
    context,
  ) async {
    log('here');
    isLoading = true;
    notifyListeners();
    final PostSocialModel model = PostSocialModel(
      photo: useravatar!,
      description: description.text,
    );
    await PostService().toPost(model, context).then(
      (value) {
        if (value != null) {
          SnackBarPop.popUp(context, "Post Added  Successfully", Colors.green);
          toPostScreen(context);
          getSocial(context);

          isLoading = false;
          notifyListeners();
        } else {
          isLoading = false;
          notifyListeners();
          return null;
        }
      },
    );
    isLoading = false;
    notifyListeners();
  }

  List<LikePostModel> reactionList = [];

  List<LikePostModel> get reactions => reactionList;

  void like(String userId, String postId) {
    reactionList.add(
        LikePostModel(userId: userId, postId: postId, reactionType: 'like'));
    notifyListeners();
  }

  void dislike(String userId, String postId) {
    reactionList.add(
        LikePostModel(userId: userId, postId: postId, reactionType: 'dislike'));
    notifyListeners();
  }

  void isVisible(img) {
    if (img == null) {
      imageVisible = true;
    } else {
      imageVisible = false;
    }

    notifyListeners();
  }

  SocialModel findById(String id) {
    return socialList.firstWhere((element) => element.id == id);
  }

  void toPostScreen(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return const CreatePostScreen();
        },
      ),
    );
    // Navigator.of(context)
    //     .pushNamed(CreatePostScreen.routeName, arguments: socialList[index].id);
  }
}
