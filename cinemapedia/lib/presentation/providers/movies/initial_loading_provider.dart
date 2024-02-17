import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final initialLoadingProvider = Provider<bool>((ref) {
  final nowPlayMoviesIsEmpty = ref.watch(nowPlayingMoviesProvider).isEmpty;
  final popularMoviesIsEmpty = ref.watch(popularMoviesProvider).isEmpty;
  final topRatedMoviesIsEmpty = ref.watch(topRatedMoviesProvider).isEmpty;
  final upcommingMoviesIsEmpty = ref.watch(upcommingMoviesProvider).isEmpty;

  return nowPlayMoviesIsEmpty &&
      popularMoviesIsEmpty &&
      topRatedMoviesIsEmpty &&
      upcommingMoviesIsEmpty;
});
