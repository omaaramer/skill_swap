// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:timeago/timeago.dart' as timeago;
// import 'package:provider/provider.dart';
// import '../providers/auth_provider.dart';
// import '../services/db_service.dart';
// import '../services/media_service.dart';
// import '../services/cloud_storage_service.dart';
// import '../models/conversation.dart';
// import '../models/message.dart';

// class ConversationPage extends StatefulWidget {
//   String _conversationID;
//   String _receiverID;
//   String _receiverImage;
//   String _receiverName;

//   ConversationPage(this._conversationID, this._receiverID, this._receiverName,
//       this._receiverImage);

//   @override
//   State<StatefulWidget> createState() {
//     return _ConversationPageState();
//   }
// }

// class _ConversationPageState extends State<ConversationPage> {
//   double _deviceHeight;
//   double _deviceWidth;

//   GlobalKey<FormState> _formKey;
//   ScrollController _listViewController;
//   AuthProvider _auth;

//   String _messageText;

//   _ConversationPageState() {
//     _formKey = GlobalKey<FormState>();
//     _listViewController = ScrollController();
//     _messageText = "";
//   }

//   @override
//   Widget build(BuildContext context) {
//     _deviceHeight = MediaQuery.of(context).size.height;
//     _deviceWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       backgroundColor: Theme.of(context).backgroundColor,
//       appBar: AppBar(
//         backgroundColor: Color.fromRGBO(31, 31, 31, 1.0),
//         title: Text(this.widget._receiverName),
//       ),
//       body: ChangeNotifierProvider<AuthProvider>.value(
//         value: AuthProvider.instance,
//         child: _conversationPageUI(),
//       ),
//     );
//   }

//   Widget _conversationPageUI() {
//     return Builder(
//       builder: (BuildContext _context) {
//         _auth = Provider.of<AuthProvider>(_context);
//         return Stack(
//           overflow: Overflow.visible,
//           children: <Widget>[
//             _messageListView(),
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: _messageField(_context),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Widget _messageListView() {
//     return Container(
//       height: _deviceHeight * 0.75,
//       width: _deviceWidth,
//       child: StreamBuilder<Conversation>(
//         stream: DBService.instance.getConversation(this.widget._conversationID),
//         builder: (BuildContext _context, _snapshot) {
//           Timer(
//             Duration(milliseconds: 50),
//             () => {
//               _listViewController
//                   .jumpTo(_listViewController.position.maxScrollExtent),
//             },
//           );
//           var _conversationData = _snapshot.data;
//           if (_conversationData != null) {
//             if (_conversationData.messages.length != 0) {
//               return ListView.builder(
//                 controller: _listViewController,
//                 padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//                 itemCount: _conversationData.messages.length,
//                 itemBuilder: (BuildContext _context, int _index) {
//                   var _message = _conversationData.messages[_index];
//                   bool _isOwnMessage = _message.senderID == _auth.user.uid;
//                   return _messageListViewChild(_isOwnMessage, _message);
//                 },
//               );
//             } else {
//               return Align(
//                 alignment: Alignment.center,
//                 child: Text("Let's start a conversation!"),
//               );
//             }
//           } else {
//             return SpinKitWanderingCubes(
//               color: Colors.blue,
//               size: 50.0,
//             );
//           }
//         },
//       ),
//     );
//   }

//   Widget _messageListViewChild(bool _isOwnMessage, Message _message) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: 10),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment:
//             _isOwnMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
//         children: <Widget>[
//           !_isOwnMessage ? _userImageWidget() : Container(),
//           SizedBox(width: _deviceWidth * 0.02),
//           _message.type == MessageType.Text
//               ? _textMessageBubble(
//                   _isOwnMessage, _message.content, _message.timestamp)
//               : _imageMessageBubble(
//                   _isOwnMessage, _message.content, _message.timestamp),
//         ],
//       ),
//     );
//   }

//   Widget _userImageWidget() {
//     double _imageRadius = _deviceHeight * 0.05;
//     return Container(
//       height: _imageRadius,
//       width: _imageRadius,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(500),
//         image: DecorationImage(
//           fit: BoxFit.cover,
//           image: NetworkImage(this.widget._receiverImage),
//         ),
//       ),
//     );
//   }

//   Widget _textMessageBubble(
//       bool _isOwnMessage, String _message, Timestamp _timestamp) {
//     List<Color> _colorScheme = _isOwnMessage
//         ? [Colors.blue, Color.fromRGBO(42, 117, 188, 1)]
//         : [Color.fromRGBO(69, 69, 69, 1), Color.fromRGBO(43, 43, 43, 1)];
//     return Container(
//       height: _deviceHeight * 0.08 + (_message.length / 20 * 5.0),
//       width: _deviceWidth * 0.75,
//       padding: EdgeInsets.symmetric(horizontal: 10),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(15),
//         gradient: LinearGradient(
//           colors: _colorScheme,
//           stops: [0.30, 0.70],
//           begin: Alignment.bottomLeft,
//           end: Alignment.topRight,
//         ),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.max,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: <Widget>[
//           Text(_message),
//           Text(
//             timeago.format(_timestamp.toDate()),
//             style: TextStyle(color: Colors.white70),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _imageMessageBubble(
//       bool _isOwnMessage, String _imageURL, Timestamp _timestamp) {
//     List<Color> _colorScheme = _isOwnMessage
//         ? [Colors.blue, Color.fromRGBO(42, 117, 188, 1)]
//         : [Color.fromRGBO(69, 69, 69, 1), Color.fromRGBO(43, 43, 43, 1)];
//     DecorationImage _image =
//         DecorationImage(image: NetworkImage(_imageURL), fit: BoxFit.cover);
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(15),
//         gradient: LinearGradient(
//           colors: _colorScheme,
//           stops: [0.30, 0.70],
//           begin: Alignment.bottomLeft,
//           end: Alignment.topRight,
//         ),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.max,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: <Widget>[
//           Container(
//             height: _deviceHeight * 0.30,
//             width: _deviceWidth * 0.40,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(15),
//               image: _image,
//             ),
//           ),
//           Text(
//             timeago.format(_timestamp.toDate()),
//             style: TextStyle(color: Colors.white70),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _messageField(BuildContext _context) {
//     return Container(
//       height: _deviceHeight * 0.08,
//       decoration: BoxDecoration(
//         color: Color.fromRGBO(43, 43, 43, 1),
//         borderRadius: BorderRadius.circular(100),
//       ),
//       margin: EdgeInsets.symmetric(
//           horizontal: _deviceWidth * 0.04, vertical: _deviceHeight * 0.03),
//       child: Form(
//         key: _formKey,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisSize: MainAxisSize.max,
//           children: <Widget>[
//             _messageTextField(),
//             _sendMessageButton(_context),
//             _imageMessageButton(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _messageTextField() {
//     return SizedBox(
//       width: _deviceWidth * 0.55,
//       child: TextFormField(
//         validator: (_input) {
//           if (_input.length == 0) {
//             return "Please enter a message";
//           }
//           return null;
//         },
//         onChanged: (_input) {
//           _formKey.currentState.save();
//         },
//         onSaved: (_input) {
//           setState(() {
//             _messageText = _input;
//           });
//         },
//         cursorColor: Colors.white,
//         decoration: InputDecoration(
//             border: InputBorder.none, hintText: "Type a message"),
//         autocorrect: false,
//       ),
//     );
//   }

//   Widget _sendMessageButton(BuildContext _context) {
//     return Container(
//       height: _deviceHeight * 0.05,
//       width: _deviceHeight * 0.05,
//       child: IconButton(
//           icon: Icon(
//             Icons.send,
//             color: Colors.white,
//           ),
//           onPressed: () {
//             if (_formKey.currentState.validate()) {
//               DBService.instance.sendMessage(
//                 this.widget._conversationID,
//                 Message(
//                     content: _messageText,
//                     timestamp: Timestamp.now(),
//                     senderID: _auth.user.uid,
//                     type: MessageType.Text),
//               );
//               _formKey.currentState.reset();
//               FocusScope.of(_context).unfocus();
//             }
//           }),
//     );
//   }

//   Widget _imageMessageButton() {
//     return Container(
//       height: _deviceHeight * 0.05,
//       width: _deviceHeight * 0.05,
//       child: FloatingActionButton(
//         onPressed: () async {
//           var _image = await MediaService.instance.getImageFromLibrary();
//           if (_image != null) {
//             var _result = await CloudStorageService.instance
//                 .uploadMediaMessage(_auth.user.uid, _image);
//             var _imageURL = await _result.ref.getDownloadURL();
//             await DBService.instance.sendMessage(
//               this.widget._conversationID,
//               Message(
//                   content: _imageURL,
//                   senderID: _auth.user.uid,
//                   timestamp: Timestamp.now(),
//                   type: MessageType.Image),
//             );
//           }
//         },
//         child: Icon(Icons.camera_enhance),
//       ),
//     );
//   }
// }



// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// // import 'package:share_plus/share_plus.dart';
// // import 'package:social_network/constants.dart';
// // import 'package:social_network/cubit/cubit.dart';

// // import 'add_post.dart';
// // import 'cubit/state.dart';

// // class PostsScreen extends StatefulWidget {
// //   const PostsScreen({Key? key}) : super(key: key);

// //   @override
// //   State<PostsScreen> createState() => _PostsScreenState();
// // }

// // class _PostsScreenState extends State<PostsScreen> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.grey,
// //       body: AppBloc.get(context).postsList.isNotEmpty
// //           ? ListView.separated(
// //               itemBuilder: (context, index) => BlocBuilder<AppBloc, AppState>(
// //                 builder: (context, state) {
// //                   return Container(
// //                     color: Colors.white,
// //                     child: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         Padding(
// //                           padding: const EdgeInsets.all(16.0),
// //                           child: Row(
// //                             children: [
// //                               if(AppBloc.get(context)
// //                                   .postsList[index]
// //                                   .values
// //                                   .single
// //                                   .ownerImage.isNotEmpty)
// //                                 CircleAvatar(
// //                                 radius: 20.0,
// //                                 backgroundImage: NetworkImage(
// //                                   AppBloc.get(context)
// //                                       .postsList[index]
// //                                       .values
// //                                       .single
// //                                       .ownerImage,
// //                                 ),
// //                               ),
// //                               if(AppBloc.get(context)
// //                                   .postsList[index]
// //                                   .values
// //                                   .single
// //                                   .ownerImage.isEmpty)
// //                                 CircleAvatar(
// //                                   radius: 20.0,
// //                                   child: Center(
// //                                     child: Text(
// //                                       AppBloc.get(context)
// //                                           .postsList[index]
// //                                           .values
// //                                           .single
// //                                           .ownerName.characters.first,
// //                                       style: const TextStyle(
// //                                         fontSize: 26.0,
// //                                         fontWeight: FontWeight.w900,
// //                                       ),
// //                                     ),
// //                                   ),
// //                                 ),
// //                               space10Horizontal(context),
// //                               Expanded(
// //                                 child: Column(
// //                                   crossAxisAlignment: CrossAxisAlignment.start,
// //                                   children: [
// //                                     Text(
// //                                       AppBloc.get(context)
// //                                           .postsList[index]
// //                                           .values
// //                                           .single
// //                                           .ownerName,
// //                                       style: const TextStyle(
// //                                         fontSize: 18.0,
// //                                         fontWeight: FontWeight.w800,
// //                                       ),
// //                                     ),
// //                                     Text(
// //                                       AppBloc.get(context)
// //                                           .postsList[index]
// //                                           .values
// //                                           .single
// //                                           .time,
// //                                       style: TextStyle(
// //                                         fontSize: 14.0,
// //                                         color: Colors.grey[400],
// //                                       ),
// //                                     ),
// //                                   ],
// //                                 ),
// //                               ),

// //                               // IconButton(
// //                               //   padding: EdgeInsets.zero,
// //                               //   onPressed: () {},
// //                               //   icon: Icon(
// //                               //     Icons.more_vert,
// //                               //     size: 16.0,
// //                               //   ),
// //                               // ),
// //                             ],
// //                           ),
// //                         ),
// //                         const MyDivider(),
// //                         Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             Padding(
// //                               padding: const EdgeInsets.all(16.0),
// //                               child: Text(
// //                                 AppBloc.get(context)
// //                                     .postsList[index]
// //                                     .values
// //                                     .single
// //                                     .text,
// //                               ),
// //                             ),
// //                             if (AppBloc.get(context)
// //                                 .postsList[index]
// //                                 .values
// //                                 .single
// //                                 .image
// //                                 .isNotEmpty)
// //                               Image.network(
// //                                 AppBloc.get(context)
// //                                     .postsList[index]
// //                                     .values
// //                                     .single
// //                                     .image,
// //                                 width: double.infinity,
// //                                 height: 220.0,
// //                                 fit: BoxFit.cover,
// //                               ),
// //                             if (AppBloc.get(context)
// //                                 .postsList[index]
// //                                 .values
// //                                 .single
// //                                 .image
// //                                 .isEmpty)
// //                               const MyDivider(),
// //                             space10Vertical(context),
// //                             Padding(
// //                               padding: const EdgeInsets.symmetric(
// //                                 horizontal: 16.0,
// //                               ),
// //                               child: Row(
// //                                 children: [
// //                                   Text(
// //                                     '${AppBloc.get(context).postsList[index].values.single.likes.length} likes',
// //                                   ),
// //                                   Spacer(),
// //                                   Text(
// //                                     '${AppBloc.get(context).postsList[index].values.single.comments.length} comments',
// //                                   ),
// //                                   Text(
// //                                     ' - ',
// //                                   ),
// //                                   Text(
// //                                     '${AppBloc.get(context).postsList[index].values.single.shares} shares',
// //                                   ),
// //                                 ],
// //                               ),
// //                             ),
// //                             space10Vertical(context),
// //                             const MyDivider(),
// //                             Row(
// //                               children: [
// //                                 Expanded(
// //                                   child: MaterialButton(
// //                                     onPressed: () {
// //                                       AppBloc.get(context).updatePostLikes(
// //                                           AppBloc.get(context)
// //                                               .postsList[index]);
// //                                     },
// //                                     child: Icon(
// //                                       AppBloc.get(context)
// //                                               .postsList[index]
// //                                               .values
// //                                               .single
// //                                               .likes
// //                                               .any((element) =>
// //                                                   element ==
// //                                                   AppBloc.get(context)
// //                                                       .user!
// //                                                       .uId)
// //                                           ? Icons.thumb_up
// //                                           : Icons.thumb_up_outlined,
// //                                       size: 16.0,
// //                                     ),
// //                                   ),
// //                                 ),
// //                                 Expanded(
// //                                   child: MaterialButton(
// //                                     onPressed: () {},
// //                                     child: const Icon(
// //                                       FontAwesomeIcons.comment,
// //                                       size: 16.0,
// //                                     ),
// //                                   ),
// //                                 ),
// //                                 Expanded(
// //                                   child: MaterialButton(
// //                                     onPressed: () async {
// //                                       if (AppBloc.get(context)
// //                                           .postsList[index]
// //                                           .values
// //                                           .single
// //                                           .image
// //                                           .isNotEmpty) {
// //                                         final img = await imageFromURL(
// //                                           'temp',
// //                                           AppBloc.get(context)
// //                                               .postsList[index]
// //                                               .values
// //                                               .single
// //                                               .image,
// //                                         );

// //                                         Share.shareFiles(
// //                                           [img!.path],
// //                                           text: AppBloc.get(context)
// //                                               .postsList[index]
// //                                               .values
// //                                               .single
// //                                               .text,
// //                                         ).whenComplete(() {
// //                                           AppBloc.get(context).updatePostShares(AppBloc.get(context).postsList[index]);
// //                                         });
// //                                       } else {
// //                                         Share.share(
// //                                           AppBloc.get(context)
// //                                               .postsList[index]
// //                                               .values
// //                                               .single
// //                                               .text,
// //                                         ).whenComplete(() {
// //                                           AppBloc.get(context).updatePostShares(AppBloc.get(context).postsList[index]);
// //                                         });
// //                                       }
// //                                     },
// //                                     child: const Icon(
// //                                       FontAwesomeIcons.share,
// //                                       size: 16.0,
// //                                     ),
// //                                   ),
// //                                 ),
// //                               ],
// //                             ),
// //                           ],
// //                         ),
// //                       ],
// //                     ),
// //                   );
// //                 },
// //               ),
// //               separatorBuilder: (context, index) => space10Vertical(context),
// //               itemCount: AppBloc.get(context).postsList.length,
// //             )
// //           : const Center(
// //               child: CupertinoActivityIndicator(
// //                 color: Colors.white,
// //               ),
// //             ),
// //       floatingActionButton: FloatingActionButton(
// //         mini: true,
// //         child: const Icon(
// //           Icons.add,
// //         ),
// //         onPressed: () {
// //           navigateTo(
// //             context,
// //             const AddPostScreen(),
// //           );
// //         },
// //         // label: const Text(
// //         //   'Post',
// //         // ),
// //       ),
// //     );
// //   }
// // }