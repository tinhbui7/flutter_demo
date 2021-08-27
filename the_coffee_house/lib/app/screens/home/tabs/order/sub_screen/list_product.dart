import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_coffee_house/app/widgets/content/content_empty.dart';
import 'package:the_coffee_house/domain/entities/entities.dart';

class ListProduct extends StatelessWidget {
  const ListProduct({
    Key? key,
    required this.listSection,
  }) : super(key: key);

  final List<SectionEntity> listSection;

  @override
  Widget build(BuildContext context) {
    List<ProductEntity> _listProduct = [];
    ThemeData theme = Theme.of(context);
    return Expanded(
      child: Container(
        color: theme.selectedRowColor,
        child: listSection.isNotEmpty == true
            ? ListView.builder(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16.0),
                itemCount: listSection.length,
                itemBuilder: (context, index) {
                  _listProduct = listSection[index].lstProduct!;
                  return _buildSection(
                      context, listSection[index].name!, _listProduct);
                },
              )
            : ContentEmpty(),
      ),
    );
  }

  Widget _buildSection(
      BuildContext context, String section, List<ProductEntity> products) {
    ThemeData theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            section,
            style: theme.textTheme.headline6,
          ),
          Padding(padding: const EdgeInsets.only(bottom: 10.0)),
          products.isNotEmpty == true
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * .135,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: theme.backgroundColor,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      products[index].name!,
                                      style: theme.textTheme.subtitle2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      products[index].intro!,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text('${products[index].price}đ'),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                              ),
                              Image.network(
                                products[index].imageUrl!,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              : ContentEmpty(),
        ],
      ),
    );
  }
}
