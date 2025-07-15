import 'package:equatable/equatable.dart';
import 'package:jdphotomap/src/features/custom_navigation_bar/presentation/widget/destination.dart';

class DestinationRoute extends Equatable {
  const DestinationRoute({
    required this.page,
    required this.path,
    required this.destinaton,
  });
  final int page;
  final String path;
  final Destination destinaton;

  @override
  List<Object?> get props => <Object?>[page, path, destinaton];
}
