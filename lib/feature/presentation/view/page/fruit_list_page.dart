import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:winfox_test_task/core/_barrel.dart';
import 'package:winfox_test_task/feature/domain/_barrel.dart';
import 'package:winfox_test_task/feature/presentation/_barrel.dart';

@RoutePage(name: 'FruitList')
class FruitListPage extends StatelessWidget {
  const FruitListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FruitBloc>(
      create: (context) {
        return getIt<FruitBloc>()..add(const FruitInitialEvent());
      },
      child: const FruitListPageContent(),
    );
  }
}

class FruitListPageContent extends StatelessWidget {
  const FruitListPageContent({
    super.key,
  });

  Widget _builder(BuildContext context, FruitState state) {
    if (state is FruitLoadedState) {
      return FruitListPageLoadedBody(state: state);
    }

    if (state is FruitFailureState) {
      return const FruitListPageFailureBody();
    }

    return const FruitListPagePendingBody();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FruitBloc, FruitState>(
      builder: _builder,
    );
  }
}

class FruitListPagePendingBody extends StatelessWidget {
  const FruitListPagePendingBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        strokeCap: StrokeCap.round,
      ),
    );
  }
}

class FruitListPageFailureBody extends StatelessWidget {
  const FruitListPageFailureBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Верстал быстро, не вижу смысла декомпозировать такую простую верстку

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_rounded, color: Colors.redAccent),
            const SizedBox(width: 4),
            Text(
              'Something went wrong',
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          'Try again',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.blueGrey,
              ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          style: const ButtonStyle(
            maximumSize: WidgetStatePropertyAll(
              Size(240, 40),
            ),
          ),
          onPressed: () async {
            final fruitBloc = context.read<FruitBloc>();
            final completer = Completer<void>();
            fruitBloc.add(FruitRefreshEvent(completer: completer));

            return completer.future;
          },
          child: const Center(
            child: Text(
              'Refresh page',
            ),
          ),
        )
      ],
    );
  }
}

class FruitListPageLoadedBody extends StatelessWidget {
  final FruitLoadedState state;

  const FruitListPageLoadedBody({
    required this.state,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [const FruitAppBar()];
      },
      body: RefreshIndicator(
        onRefresh: () async {
          final fruitBloc = context.read<FruitBloc>();
          final completer = Completer<void>();
          fruitBloc.add(FruitRefreshEvent(completer: completer));

          return completer.future;
        },
        child: ListView.separated(
          itemCount: state.fruits.length,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            final fruit = state.fruits[index];

            return FruitCard(fruit: fruit);
          },
          separatorBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Divider(
                color: Colors.blueGrey.shade100,
                height: 0,
              ),
            );
          },
        ),
      ),
    );
  }
}

class FruitAppBar extends StatelessWidget {
  const FruitAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      centerTitle: false,
      titleSpacing: 12,
      leading: const SizedBox(),
      leadingWidth: 0,
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.white,
      shadowColor: Colors.blueGrey.shade100,
      elevation: 4,
      title: Text(
        'Fruits',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
