import 'package:flutter/material.dart';
import 'package:goldy/core/networking/network_service.dart';

class ConnectivityListener extends StatefulWidget {
  final Widget child;
  final VoidCallback? onConnectivityChanged;

  const ConnectivityListener({
    Key? key,
    required this.child,
    this.onConnectivityChanged,
  }) : super(key: key);

  @override
  State<ConnectivityListener> createState() => _ConnectivityListenerState();
}

class _ConnectivityListenerState extends State<ConnectivityListener> {
  bool _isConnected = true;
  bool _showSnackBar = false;

  @override
  void initState() {
    super.initState();
    _checkInitialConnection();
    _listenToConnectivity();
  }

  Future<void> _checkInitialConnection() async {
    final connected = await NetworkService.isConnected();
    if (mounted) {
      setState(() {
        _isConnected = connected;
      });
    }
  }

  void _listenToConnectivity() {
    NetworkService.onConnectivityChanged.listen((results) {
      final isConnected = results.contains('mobile') || 
                         results.contains('wifi') || 
                         results.contains('ethernet');
      
      if (mounted) {
        setState(() {
          _isConnected = isConnected;
          _showSnackBar = !isConnected;
        });
        
        widget.onConnectivityChanged?.call();
        
        if (!isConnected) {
          _showNoInternetSnackBar();
        }
      }
    });
  }

  void _showNoInternetSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Row(
          children: [
            Icon(Icons.wifi_off, color: Colors.white),
            SizedBox(width: 8),
            Text('No internet connection'),
          ],
        ),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
