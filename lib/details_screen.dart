import 'package:flutflix/colors.dart';
import 'package:flutflix/constants.dart';
import 'package:flutflix/models/movie.dart';
import 'package:flutflix/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'widgets/back_button.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            leading: const Backbtn(),
            backgroundColor: Colours.scaffoldBgColor,
            expandedHeight: 500,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                movie.title,
                style: GoogleFonts.belleza(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                child: Image.network(
                  '${Constants.imagePath}${movie.posterPath}',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Text(
                    'Overview',
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w800,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    movie.overview,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Release date:',
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                movie.releaseDate,
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Rating:',
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Text(
                                '${movie.voteAverage.toStringAsFixed(1)}/10',
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
