import 'package:flutter/material.dart';
import 'package:projeto_dio_flutter/model/card_detail_model.dart';
import 'package:projeto_dio_flutter/pages/card_detail_page.dart';
import 'package:projeto_dio_flutter/repository/card_detail_repository.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {

  CardDetail? cardDetail;
  var cardDetailRepository = CardDetailRepository();
  @override
  void initState() {
    carregarCard();
    super.initState();
  }

  carregarCard() async{
    cardDetail = await cardDetailRepository.findByName();
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          width: double.infinity,
          child: cardDetail == null ?
          const LinearProgressIndicator():
          Hero(
            tag: cardDetail!.id,
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
                        Image.network(cardDetail!.url
                        ,height: 20,),
                        Text(cardDetail!.title, style:
                          const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Text(cardDetail!.text,
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
                            (contex) =>  CardDetailPage(cardDetail: cardDetail!,)));
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
