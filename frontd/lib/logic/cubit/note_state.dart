part of 'note_cubit.dart';

@immutable
abstract class NoteState {}

class NoteInitial extends NoteState {}

// ignore: must_be_immutable
class Successloaded extends NoteState {
List<NoteData> data;

  Successloaded({
    required this.data,
  });
}
class ServerLoading extends NoteState {}

// ignore: must_be_immutable
class FailLoaded extends NoteState {
  String error;
  FailLoaded({
    required this.error,
  });
}
