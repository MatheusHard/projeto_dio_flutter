import 'package:flutter/material.dart';
import 'package:projeto_dio_flutter/pages/shared/utils/app_images.dart';

class ListViewVertical extends StatefulWidget {
  const ListViewVertical({super.key});

  @override
  State<ListViewVertical> createState() => _ListViewVerticalState();
}

class _ListViewVerticalState extends State<ListViewVertical> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Image.asset(AppImages.zangado),
          title: const Text("Zangalo"),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Quebra uma mesa"),
              Text("08:50"),
            ],
          ),
          trailing: PopupMenuButton(
                            onSelected: (menu){
                              if(menu == 'menu1'){
                                print("escolheu menu 1");
                              }else if(menu == 'menu2'){
                                print("escolheu menu 2");
                              }else if(menu == 'menu3'){
                                print("escolheu menu 3");
                              }
                            },
                            itemBuilder: (BuildContext bd){
                            return <PopupMenuEntry<String>>[
                              const PopupMenuItem<String>(
                                value: "menu1",
                                child: Text("menn1"),
                              ),
                              const PopupMenuItem<String>(
                                value: "menu2",
                                child: Text("menn2"),
                              ),
                              const PopupMenuItem<String>(
                                value: "menu3",
                                child: Text("menn3"),
                              ),
                            ];
                        }),
          isThreeLine: true,
        ),
        ListTile(
          leading: Image.asset(AppImages.woman),
          title: const Text("Pretty Woman"),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Beautiful"),
              Text("09:50"),
            ],
          ),
          trailing: PopupMenuButton(
              onSelected: (menu){
                if(menu == 'menu1'){
                  print("escolheu menu 1");
                }else if(menu == 'menu2'){
                  print("escolheu menu 2");
                }else if(menu == 'menu3'){
                  print("escolheu menu 3");
                }
              },
              itemBuilder: (BuildContext bd){
                return <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: "menu1",
                    child: Text("menn1"),
                  ),
                  const PopupMenuItem<String>(
                    value: "menu2",
                    child: Text("menn2"),
                  ),
                  const PopupMenuItem<String>(
                    value: "menu3",
                    child: Text("menn3"),
                  ),
                ];
              }),
          isThreeLine: true,
        )
      ],
    );
  }
}
