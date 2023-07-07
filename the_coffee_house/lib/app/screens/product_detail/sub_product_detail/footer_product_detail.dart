import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_coffee_house/app/screens/product_detail/product_detail_bloc.dart';
import 'package:the_coffee_house/app/screens/product_detail/product_detail_events.dart';
import 'package:the_coffee_house/app/screens/product_detail/product_detail_state.dart';
import 'package:the_coffee_house/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class FooterProductDetail extends StatelessWidget {
  const FooterProductDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(
          thickness: 7.5,
          color: theme.splashColor,
          height: 0,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.title_otherRequirements.tr(),
                style: theme.textTheme.subtitle2,
              ),
              Padding(padding: const EdgeInsets.only(top: 3.0)),
              Text(
                LocaleKeys.text_otherOptions.tr(),
                style: theme.primaryTextTheme.caption,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
              ),
              SizedBox(
                width: double.infinity,
                child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
                    builder: (_context, state) {
                  return OutlinedButton(
                    onPressed: () => _showPopupNote(context, state.noteProduct),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: (state.noteProduct?.isNotEmpty == true)
                          ? Text(
                              state.noteProduct!,
                              style: theme.primaryTextTheme.caption,
                            )
                          : Text(
                              LocaleKeys.text_addNotes.tr(),
                              style: theme.primaryTextTheme.caption,
                            ),
                    ),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.all(13.0),
                      primary: theme.selectedRowColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(8.0),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        )
      ],
    );
  }

  Future _showPopupNote(BuildContext context, String? noteProduct) {
    ThemeData theme = Theme.of(context);
    ProductDetailBloc productDetailBloc =
        BlocProvider.of<ProductDetailBloc>(context);
    var note = TextEditingController();
    note.text = noteProduct ?? '';
    return showModalBottomSheet(
      context: context,
      backgroundColor: theme.colorScheme.background,
      shape: const RoundedRectangleBorder(
        borderRadius: const BorderRadius.vertical(
          top: const Radius.circular(15.0),
        ),
      ),
      isScrollControlled: true,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    child: Text(
                      LocaleKeys.title_productNotes.tr(),
                      style:
                          theme.textTheme.subtitle2?.copyWith(fontSize: 16.0),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(
                        Icons.clear_rounded,
                        color: theme.colorScheme.onBackground,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1.0,
              height: 0,
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 15.0,
                  left: 15.0,
                  right: 15.0,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: TextField(
                controller: note,
                cursorHeight: 20,
                keyboardType: TextInputType.multiline,
                maxLength: 50,
                maxLines: 2,
                decoration: InputDecoration(
                  hintText: LocaleKeys.text_addNotes.tr(),
                  hintStyle: theme.primaryTextTheme.caption,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: theme.selectedRowColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: theme.selectedRowColor),
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 1.0,
              height: 0,
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    if (note.text != noteProduct) {
                      productDetailBloc.add(
                        NoteProductEvent(
                          note.text,
                        ),
                      );
                    }
                    Navigator.of(context).pop();
                  },
                  style: OutlinedButton.styleFrom(
                    primary: theme.backgroundColor,
                  ),
                  child: Text(
                    LocaleKeys.button_btnDone.tr(),
                    style: theme.textTheme.subtitle2?.copyWith(
                      fontSize: 15.0,
                      color: theme.colorScheme.secondary,
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
