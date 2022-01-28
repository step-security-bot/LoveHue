import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:relationship_bars/models/userinfo_firestore_collection_model.dart';
import 'package:relationship_bars/providers/partners_info_state.dart';

class UserInfoState with ChangeNotifier {
  static final UserInfoState _instance = UserInfoState._internal();

  static UserInfoState get instance => _instance;

  UserInfoState._internal();
  factory UserInfoState() => _instance;

  StreamSubscription<DocumentSnapshot>? yourInfoSubscription;
  UserInformation? _userInfo;

  UserInformation? get userInfo => _userInfo;

  set userInfo(UserInformation? info) {
    _userInfo = info;
    print("NOTIFY USER");
    notifyListeners();
  }

  String? get userID => userInfo?.userID;

  String? get linkCode => userInfo?.linkCode?.id;

  bool get userExist => (userInfo?.userID != null);
  bool get userPending => (userExist && (userInfo?.linkPending ?? false));

  void setupYourInfoSubscription() {
    if (userExist) {
      yourInfoSubscription = userInfoFirestoreRef.doc(userID).snapshots().listen((snapshot) async {
        print("YOUR INFO SUB");
        UserInformation? yourUserInfo = snapshot.data();
        userInfo = yourUserInfo;
        String? partnerID = yourUserInfo?.partnerID;
        if(partnerID != null && (!PartnersInfoState.instance.partnerExist || PartnersInfoState.instance.partnersID != partnerID)) {
          PartnersInfoState.instance.partnersInfo = await UserInformation.firestoreGet(partnerID);
        }
        if(partnerID == null && PartnersInfoState.instance.partnerExist) {
          PartnersInfoState.instance.partnersInfo = null;
        }
      });
    }
  }
}
