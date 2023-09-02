import 'package:flutter/material.dart';
import 'package:projeto_dio_flutter/model/card_detail_model.dart';
import 'package:projeto_dio_flutter/pages/card_detail_page.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  var cardDetail = CardDetail(1,"Meu Card", "https://hermes.digitalinnovation.one/assets/diome/logo.png", "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.");
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          width: double.infinity,
          child: Hero(
            tag: cardDetail.id,
            child: Card(
              elevation: 8,
              shadowColor: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.network(cardDetail.url
                        ,height: 20,),
                        Text(cardDetail.title, style:
                          const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Text(cardDetail.text,
                    textAlign: TextAlign.justify,
                      style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.normal,

                    ),),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed:(){
                            Navigator.push(context,
                                MaterialPageRoute(builder:
                            (contex) =>  CardDetailPage(cardDetail: cardDetail,)));
                          },
                          child: const Text("Ler Mais",
                          style: TextStyle(
                            decoration: TextDecoration.underline
                          ),)),
                    )
                  ],
                ),
              ),
            ),
          )
          ,
        )
      ],
    );
  }
}