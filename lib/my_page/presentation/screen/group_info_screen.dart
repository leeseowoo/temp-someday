import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:someday/common/components/default_layout.dart';
import 'package:someday/my_page/presentation/view_model/group_state_notifier.dart';

class GroupInfoScreen extends ConsumerStatefulWidget {
  final bool isLeader;
  final String groupId;

  const GroupInfoScreen(
      {super.key, required this.isLeader, required this.groupId});

  @override
  ConsumerState<GroupInfoScreen> createState() => _GroupInfoScreenState();
}

class _GroupInfoScreenState extends ConsumerState<GroupInfoScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(groupStateProvider.notifier)
          .getGroupInfo(groupId: widget.groupId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final groupInfoState = ref.watch(groupStateProvider);

    return DefaultLayout(
      title: widget.isLeader ? '그룹 관리' : '그룹 정보',
      child: Column(
        children: [
          Center(
            child: Text(groupInfoState.name),
          )
        ],
      ),
    );
  }
}
