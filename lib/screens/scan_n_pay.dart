import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/utils/constants.dart';
import 'package:yolo/utils/network.dart';
import 'package:yolo/utils/typography.dart';
import 'package:http/http.dart' as http;

final favouriteManagingProvider = StateProvider.autoDispose((ref) async {
  http.Response response = await NetworkUtils.request(
    endpoint: 'api:Srfx-bxR/contact/favourites/manage',
    networkRequestType: NetworkRequestType.post,
    body: requestBody,
    queryParameters: {"x-data-source": "test"},
    headers: {'Content-Type': 'application/json'},
    baseUrltype: BaseUrl.card91,
    protocolType: SSL.https,
  );
  List result = jsonDecode(response.body);
  if (response.statusCode == 200) {
    ref.read(favouriteManagingStatusProvider.notifier).state = result;
  }
  return result;
});

final favouriteManagingStatusProvider = StateProvider.autoDispose((ref) {
  return [];
});

final favouriteContactsProvider = FutureProvider.autoDispose((ref) async {
  http.Response response = await NetworkUtils.request(
    endpoint: 'api:Srfx-bxR/contact/favourites/get',
    networkRequestType: NetworkRequestType.post,
    body: requestBody,
    queryParameters: {"x-data-source": "test"},
    baseUrltype: BaseUrl.card91,
    protocolType: SSL.https,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': Hive.box('db').get('jwt')
    },
  );
  List<dynamic> result = jsonDecode(response.body);
  return result;
});

final cardHolderDataProvider = StateProvider.autoDispose((ref) async {
  http.Response response = await NetworkUtils.request(
    endpoint: 'api:Srfx-bxR/contact/cardholder/details',
    networkRequestType: NetworkRequestType.post,
    body: requestBody,
    queryParameters: {"x-data-source": "test"},
    headers: {
      'Content-Type': 'application/json',
    },
    baseUrltype: BaseUrl.card91,
    protocolType: SSL.https,
  ).whenComplete(() => ref.read(cardHolderLoader.notifier).state = false);
  List result = jsonDecode(response.body);
  if (response.statusCode == 200) {
    ref.read(cardHolderProvider.notifier).state = result;
  }
  return result;
});

final cardHolderProvider = StateProvider.autoDispose((ref) {
  return [];
});

final cardHolderLoader = StateProvider.autoDispose<bool>((ref) {
  return false;
});

class ScanNpay extends ConsumerStatefulWidget {
  const ScanNpay({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ScanNpayState();
}

class _ScanNpayState extends ConsumerState<ScanNpay>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    requestBody = {
      "mobile": Hive.box('db').get('phoneNumber'),
      "card_id": Hive.box('db').get('cardId')
    };
  }

  @override
  Widget build(BuildContext context) {
    final favouriteWatch = ref.watch(favouriteContactsProvider);
    final contactsWatch = ref.watch(cardHolderProvider);
    final contactsLoader = ref.watch(cardHolderLoader);
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'TabBar Sample',
            style: TextStyle(color: AppColors.blackFont),
          ),
          toolbarHeight: 180,
          backgroundColor: AppColors.whiteBgColor,
          elevation: 0,
          bottom: TabBar(
            unselectedLabelColor: AppColors.blackFont,
            indicatorSize: TabBarIndicatorSize
                .tab, // Set indicator size to match the tab width
            tabs: const <Widget>[
              Tab(
                text: "Contacts",
              ),
              Tab(
                text: "Favorite",
              ),
            ],
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(26), // Set rounded corner
              color: Colors.black, // Set indicator color
            ),
            padding: const EdgeInsets.symmetric(horizontal: 18),
          ),
          actions: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 24, right: 24, top: 82, bottom: 0),
                child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.blackFont,
                          width: 6,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(26.0)),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 18.0),
                      hintText: "search anything"),
                  maxLength: 10,
                  onFieldSubmitted: (data) {
                    ref.read(cardHolderLoader.notifier).state = true;
                    requestBody = {
                      "contact_user_mobile": "91$data",
                      "org_id": orgId,
                      "card_program_id": cardProgramId,
                      "issuer": "YES",
                      "primary_user_mobile": "91$data"
                    };
                    ref.read(cardHolderDataProvider);
                  },
                  keyboardType: TextInputType.phone,
                ),
              ),
            ),
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            tabBarView1(
                contactsWatch: contactsWatch, contactsLoader: contactsLoader),
            tabBarView2(favouriteWatch: favouriteWatch),
          ],
        ),
      ),
    );
  }

  Widget tabBarView1(
      {required List<dynamic> contactsWatch, required bool contactsLoader}) {
    return contactsWatch.isEmpty
        ? contactsLoader
            ? Center(
                child: CircularProgressIndicator(
                color: AppColors.blackFont,
              ))
            : const Center(
                child: Text('No contacts'),
              )
        : Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: ListView.builder(
              itemCount: contactsWatch.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {},
                  leading: const CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://i.pravatar.cc/50',
                    ),
                  ),
                  title: Text(
                    contactsWatch[index]['cardHolderName'] ?? 'No name',
                    style: Poppins.semiBold(AppColors.blackFont).s14,
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.star_border_outlined),
                  ),
                );
              },
            ),
          );
  }

  Widget tabBarView2({required AsyncValue<List<dynamic>> favouriteWatch}) {
    return Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: favouriteWatch.when(
            data: (data) {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {},
                    leading: const CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://i.pravatar.cc/50',
                      ),
                    ),
                    title: Text(
                      data[index]['contact_full_name'],
                      style: Poppins.semiBold(AppColors.blackFont).s14,
                    ),
                    trailing: const IconButton(
                      onPressed: null,
                      icon: Icon(Icons.star_border_outlined),
                    ),
                  );
                },
              );
            },
            error: (error, stackTrace) {
              String message = '';
              // if (error is ErrorMessage) {
              //   message = error.message;
              // }

              return Center(
                child: Text(
                  message,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              );
            },
            loading: () => Center(
                    child: CircularProgressIndicator(
                  color: AppColors.blackFont,
                ))));
  }
}
