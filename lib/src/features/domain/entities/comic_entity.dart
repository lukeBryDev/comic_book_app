import 'package:equatable/equatable.dart';

class ComicEntity extends Equatable {
  final int id;
  final String image;
  final DateTime? firstStoresSoldDate;
  final String? name;
  final String number;

  const ComicEntity({
    required this.id,
    required this.image,
    required this.firstStoresSoldDate,
    required this.name,
    required this.number,
  });

  @override
  List<Object?> get props => [id, image, firstStoresSoldDate, name, number];
}
