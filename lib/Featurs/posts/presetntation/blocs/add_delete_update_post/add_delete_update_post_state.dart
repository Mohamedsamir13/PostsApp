import 'package:equatable/equatable.dart';

abstract class AddDeleteUpdatePostState extends Equatable{
  const AddDeleteUpdatePostState();
  @override
  List<Object>get props=>[];
}
class AddDeleteUpdatePostInitState extends AddDeleteUpdatePostState{}
class LoadingAddDeleteUpdatePostState extends AddDeleteUpdatePostState{}
class ErorrAddDeleteUpdatePostState extends AddDeleteUpdatePostState{
  final String Message;

  ErorrAddDeleteUpdatePostState({required this.Message});
  @override
  List<Object>get props=>[Message];
}
class MessageAddDeleteUpdatePostState extends AddDeleteUpdatePostState{
  final String message;

  MessageAddDeleteUpdatePostState({required this.message});
  @override
  List<Object>get props=>[message];
}
