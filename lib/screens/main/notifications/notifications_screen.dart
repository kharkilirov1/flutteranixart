import 'package:flutter/material.dart';
import '../tab_fragment.dart';

class NotificationsScreen extends TabFragment {
  const NotificationsScreen({super.key}) : super(title: 'Уведомления');

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends TabFragmentState<NotificationsScreen> {
  @override
  Future<void> loadData() async {
    setLoading(true);
    try {
      await Future.delayed(const Duration(seconds: 1));
      setLoading(false);
    } catch (e) {
      setError(e.toString());
    }
  }

  @override
  Widget buildContent(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            child: const Icon(Icons.notifications, color: Colors.white),
          ),
          title: Text('Уведомление ${index + 1}'),
          subtitle: Text(
            'Описание уведомления ${index + 1}',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Text(
            '${index + 1} мин назад',
            style: const TextStyle(color: Colors.grey),
          ),
          onTap: () {
            // TODO: Открыть детали уведомления
          },
        );
      },
    );
  }
}
