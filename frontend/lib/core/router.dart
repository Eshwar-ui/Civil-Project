import 'package:flutter/material.dart';
import 'package:frontend/screens/operations/operations_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../screens/common/splash_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/dashboard/dashboard_screen.dart';
import '../screens/projects/projects_screen.dart';
import '../screens/staff/staff_screen.dart';
import '../screens/staff/manager_detail_screen.dart';
import '../screens/staff/edit_manager_details_screen.dart';
import '../screens/insights/insights_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/common/main_shell_screen.dart';
import '../screens/projects/project_details_screen.dart';
import '../screens/operations/operational_screens.dart';
import '../screens/projects/add_project_screen.dart';
import '../screens/staff/add_staff_screen.dart';
import '../screens/operations/add_material_log_screen.dart';
import '../screens/operations/blueprints_screen.dart';
import '../screens/operations/operational_expenses_screen.dart';

part 'router.g.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter goRouter(Ref ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'splash',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const LoginScreen(),
      ),

      // Full page routes
      GoRoute(
        path: '/project-details/:id',
        name: 'project-details',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          final id = state.pathParameters['id'] ?? 'Project';
          return ProjectDetailsScreen(projectId: id);
        },
      ),
      GoRoute(
        path: '/manager-details/:id',
        name: 'manager-details',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          final id = state.pathParameters['id'] ?? '';
          final name = state.uri.queryParameters['name'] ?? 'Manager';
          final role = state.uri.queryParameters['role'] ?? 'Manager';
          final initials = state.uri.queryParameters['initials'] ?? 'M';
          return ManagerDetailScreen(
            managerId: id,
            name: name,
            role: role,
            initials: initials,
          );
        },
      ),
      GoRoute(
        path: '/edit-manager/:id',
        name: 'edit-manager',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          final id = state.pathParameters['id'] ?? '';
          final firstName = state.uri.queryParameters['firstName'];
          final lastName = state.uri.queryParameters['lastName'];
          final position = state.uri.queryParameters['position'];
          final email = state.uri.queryParameters['email'];
          final phone = state.uri.queryParameters['phone'];
          final address = state.uri.queryParameters['address'];
          return EditManagerDetailsScreen(
            managerId: id,
            initialFirstName: firstName,
            initialLastName: lastName,
            initialPosition: position,
            initialEmail: email,
            initialPhone: phone,
            initialAddress: address,
          );
        },
      ),
      GoRoute(
        path: '/materials',
        name: 'materials',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const MaterialsScreen(),
      ),
      GoRoute(
        path: '/machinery',
        name: 'machinery',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const MachineryScreen(),
      ),
      GoRoute(
        path: '/labor',
        name: 'labor',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const LaborScreen(),
      ),
      GoRoute(
        path: '/operational-expenses',
        name: 'operational-expenses',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const OperationsScreen(),
      ),
      // Full page routes
      GoRoute(
        path: '/add-project',
        name: 'add-project',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const AddProjectScreen(),
      ),
      GoRoute(
        path: '/add-staff',
        name: 'add-staff',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const AddStaffScreen(),
      ),
      GoRoute(
        path: '/add-log',
        name: 'add-log',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const AddMaterialLogScreen(),
      ),
      GoRoute(
        path: '/blueprints',
        name: 'blueprints',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const BlueprintsScreen(),
      ),

      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainShellScreen(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/dashboard',
                name: 'dashboard',
                builder: (context, state) => const DashboardScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/projects',
                name: 'projects',
                builder: (context, state) => const ProjectsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/staff',
                name: 'staff',
                builder: (context, state) => const StaffScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/insights',
                name: 'insights',
                builder: (context, state) => const InsightsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                name: 'profile',
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
