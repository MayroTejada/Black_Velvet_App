import 'package:auto_route/auto_route.dart';
import 'package:black_velvet_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:black_velvet_app/features/profile/presentation/profile_bloc/events/get_profile_event.dart';
import 'package:black_velvet_app/features/profile/presentation/profile_bloc/profile_bloc.dart';
import 'package:black_velvet_app/features/profile/presentation/profile_bloc/states/profile_states.dart';
import 'package:black_velvet_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => getIt<AuthBloc>()..add(CheckAuthEvent()),
        ),
        BlocProvider(
          create: (context) => getIt<ProfileBloc>(),
        ),
      ],
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.authStateEnum == AuthStateEnum.success) {
            context
                .read<ProfileBloc>()
                .add(GetProfileEvent(profileId: state.user!.profileId));
          }
        },
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            return Center(
              child: Text(state.profile.toString()),
            );
          },
        ),
      ),
    );
  }
}
