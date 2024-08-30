import 'package:equatable/equatable.dart';

class ComicDetailItemEntity extends Equatable {
  final String image;
  final String name;
  final String? role;

  const ComicDetailItemEntity(
      {required this.image, required this.name, required this.role});

  @override
  List<Object?> get props => [image, name, role];
}
