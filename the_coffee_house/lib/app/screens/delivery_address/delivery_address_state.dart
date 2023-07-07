import 'package:the_coffee_house/app/base/base_bloc_state.dart';

class DeliveryAddressState extends BaseBlocState {
  const DeliveryAddressState();

  @override
  List<Object> get props {
    return [];
  }

  DeliveryAddressState copyWith() {
    return DeliveryAddressState();
}
}

// class DeliveryAddressState extends BaseBlocState {
//   DeliveryAddressState({
//     DeliveryAddressState? state,
//     bool? isLoading,
//   }) : super(
//           isLoading: isLoading ?? state?.isLoading,
//           timeStamp: DateTime.now().millisecondsSinceEpoch,
//         );
// }
