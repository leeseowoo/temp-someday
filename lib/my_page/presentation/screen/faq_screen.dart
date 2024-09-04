import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:someday/common/components/default_layout.dart';
import 'package:someday/common/presentation/error_screen.dart';
import 'package:someday/common/style/text_style.dart';
import 'package:someday/my_page/presentation/view_model/faq_state_notifier.dart';

class FaqScreen extends ConsumerStatefulWidget {
  const FaqScreen({super.key});

  @override
  ConsumerState<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends ConsumerState<FaqScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(faqListProvider.notifier).fetchFaqList();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(faqListProvider);

    if (state.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state.isListFetchFail) {
      return const DefaultLayout(
        title: '자주 묻는 질문',
        child: ErrorScreen(errorMsg: 'FAQ 목록을 불러오는데 실패하였습니다.\n잠시후 다시 시도해주세요.'),
      );
    } else {
      return DefaultLayout(
        title: '자주 묻는 질문',
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 32.0),
              ExpansionPanelList(
                elevation: 0.0,
                materialGapSize: 0.0,
                dividerColor: Colors.transparent,
                expansionCallback: (int index, bool isExpanded) {
                  ref.read(faqListProvider.notifier).togglePanel(index);
                },
                expandedHeaderPadding: const EdgeInsets.all(0.0),
                children: state.faqList.map(
                  (item) {
                    return ExpansionPanel(
                        backgroundColor: Colors.white,
                        canTapOnHeader: true,
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return ListTile(
                            title: Text(
                              item.title,
                              style: SUB_TITLE.copyWith(
                                  fontWeight: FontWeight.w500),
                            ),
                          );
                        },
                        body: Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.grey, width: 0.5))),
                          child: ListTile(
                            title: Text(
                              item.content,
                              style: PARAGRAPH_TEXT,
                            ),
                          ),
                        ),
                        isExpanded: item.isExpanded);
                  },
                ).toList(),
              ),
            ],
          ),
        ),
      );
    }
  }
}
