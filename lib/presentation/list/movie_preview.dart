import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movies_app/domain/model/movie.dart';
import 'package:intl/intl.dart';

class MoviePreview extends StatelessWidget {
  static const _size = 100.0;
  final Movie movie;

  const MoviePreview({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat.yMMMd();
    return Card(
      child: Row(
        children: [
          if (movie.imageUrl != null)
            Container(
              padding: const EdgeInsets.only(
                left: 8.0,
                top: 8.0,
                right: 16.0,
                bottom: 8.0,
              ),
              child: SizedBox(
                width: _size,
                height: _size,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: CachedNetworkImage(
                    imageUrl: movie.imageUrl!,
                  ),
                ),
              ),
            )
          else
            Container(
              padding: const EdgeInsets.only(
                left: 8.0,
                top: 8.0,
                right: 16.0,
                bottom: 8.0,
              ),
              child: const _PlaceHolderImage(size: _size),
            ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.only(
                left: 16.0,
                top: 12.0,
                right: 16.0,
                bottom: 12.0,
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      movie.title,
                      style: Theme.of(context).textTheme.titleLarge,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Text(
                        formatter.format(movie.releaseDate),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PlaceHolderImage extends StatelessWidget {
  final double size;

  const _PlaceHolderImage({super.key, required this.size});

  @override
  Widget build(BuildContext context) => Icon(
        Icons.image_not_supported,
        size: size,
        color: Colors.black38,
      );
}
