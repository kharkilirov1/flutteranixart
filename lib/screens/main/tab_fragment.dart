import 'package:flutter/material.dart';

abstract class TabFragment extends StatefulWidget {
  final String title;

  const TabFragment({
    super.key,
    required this.title,
  });
}

abstract class TabFragmentState<T extends TabFragment> extends State<T> {
  bool _isLoading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData();

  void setLoading(bool loading) {
    setState(() {
      _isLoading = loading;
      if (loading) {
        _error = null;
      }
    });
  }

  void setError(String error) {
    setState(() {
      _error = error;
      _isLoading = false;
    });
  }

  Widget buildContent(BuildContext context);

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _error!,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.red),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: loadData,
              child: const Text('Повторить'),
            ),
          ],
        ),
      );
    }

    return buildContent(context);
  }
}
