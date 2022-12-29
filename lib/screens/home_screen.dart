import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_docs_clone/models/document_model.dart';
import 'package:google_docs_clone/models/error_model.dart';
import 'package:google_docs_clone/repository/auth_repostiory.dart';
import 'package:google_docs_clone/widget/loader.dart';
import 'package:routemaster/routemaster.dart';

import '../repository/document_repository.dart';
import '../utils/colors.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  void signOut(WidgetRef ref) {
    ref.read(authRepositoryProvider).signOut();
    ref.read(userProvider.notifier).update((state) => null);
  }

  void createDocument(WidgetRef ref, BuildContext context) async {
    String token = ref.read(userProvider)!.token;
    final navigator = Routemaster.of(context);
    final snackBar = ScaffoldMessenger.of(context);
    final errorModel =
        await ref.read(documentRepositoryProvider).createDocument(token);

    if (errorModel.data != null) {
      navigator.push("/document/${errorModel.data.id}");
    } else {
      snackBar.showSnackBar(SnackBar(
        content: Text(errorModel.error!),
      ));
    }
  }

  void navigateToDocument(BuildContext context, String documentId){
    Routemaster.of(context).push("/document/$documentId");
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0,
        title: Text("Docs clone",style: TextStyle(
          color: Colors.black
        ),),
        actions: [
          IconButton(
            onPressed: () => createDocument(ref, context),
            icon: const Icon(
              Icons.add,
              color: kBlackColor,
            ),
          ),
          IconButton(
            onPressed: () {
              signOut(ref);
            },
            icon: const Icon(
              Icons.logout,
              color: kRedColor,
            ),
          ),
        ],
      ),
      body: FutureBuilder<ErrorModel>(
          future: ref
              .watch(documentRepositoryProvider)
              .getDocuments(ref.watch(userProvider)!.token),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return Loader();
            }
            return
            ListView.builder(
              padding: EdgeInsets.only(top: 18,bottom: 18,left: 12, right: 12),
              itemCount: snapshot.data!.data.length,
                itemBuilder: (context, index){
                DocumentModel document = snapshot.data!.data[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: ListTile(
                  onTap: ()=>navigateToDocument(context, document.id),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                  tileColor: Colors.red.shade50,
                  title: Text(document.title,
                  style: TextStyle(fontSize: 16),),
                ),
              );
            });
          }),
    );
  }
}
