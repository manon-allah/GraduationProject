import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../lang/locale_keys.g.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../../../auth/presentation/manager/cubit/auth_cubit.dart';
import '../manager/cubit/home_cubit.dart';
import 'widgets/like/custom_following_body.dart';
import 'widgets/like/custom_like_body.dart';

class LikePage extends StatefulWidget {
  const LikePage({super.key});

  @override
  State<LikePage> createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
  late final homeCubit = context.read<HomeCubit>();
  late final authCubit = context.read<AuthCubit>();

  UserEntity? currentUser;

  @override
  void initState() {
    super.initState();
    getDatas();
  }

  Future<void> getDatas() async {
    final currentUser = authCubit.currentUser;
    homeCubit.getData(currentUser!.uid);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            dividerColor: Colors.transparent,
            labelColor: Theme.of(context).colorScheme.inversePrimary,
            unselectedLabelColor: Theme.of(context).colorScheme.primary,
            tabs: [
              Tab(
                text: LocaleKeys.followingTitleLike.tr(),
              ),
              Tab(
                text: LocaleKeys.youTitle.tr(),
              ),
            ],
          ),
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeSuccess) {
              final like = state.likes;
              final user = state.following;
              final posts = state.posts;
              return TabBarView(
                children: [
                  CustomFollowingBody(
                    text: LocaleKeys.isFollowingYouTitle.tr(),
                    context: context,
                    emptyMessage: LocaleKeys.nofollowingTitle.tr(),
                    uIds: user.following,
                    posts: posts,
                  ),
                  CustomLikeBody(
                    posts: posts,
                    text: LocaleKeys.likedPostTitle.tr(),
                    context: context,
                    emptyMessage: LocaleKeys.noLikesTitle.tr(),
                    uIds: like,
                  ),
                ],
              );
            } else if (state is HomeLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return const Center(
                child: Text('Error'),
              );
            }
          },
        ),
      ),
    );
  }
}
