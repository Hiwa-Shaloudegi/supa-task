import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:supa_task/core/router/app_routes.dart';
import 'package:supa_task/core/widgets/drawer/app_drawer.dart';
import 'package:supa_task/domain/repository/task/query/list_tasks_query.dart';
import 'package:supa_task/ui/home/widgets/header_section.dart';
import 'package:supa_task/ui/home/widgets/stats_section.dart';
import 'package:supa_task/ui/home/widgets/task_list_section.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      drawer: const AppDrawer(),
      floatingActionButton: ShadButton(
        onPressed: () => context.pushNamed(AppRoutes.upsertTask),
        size: ShadButtonSize.lg,
        leading: Icon(Icons.add, size: 18),

        child: Text("Add Task"),
      ),

      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => ref.refresh(listTasksQueryProvider.future),
          child: CustomScrollView(
            slivers: [
              // AppBar
              SliverAppBar(
                floating: true,
                pinned: false,
                elevation: 0,
                leading: Builder(
                  builder: (context) {
                    return ShadButton.ghost(
                      child: const Icon(LucideIcons.menu),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    );
                  },
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  child: HeaderSection(),
                ),
              ),

              SliverToBoxAdapter(child: const SizedBox(height: 10)),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  child: StatsSection(),
                ),
              ),

              TaskListSection(),
            ],
          ),
        ),
      ),
    );
  }
}
