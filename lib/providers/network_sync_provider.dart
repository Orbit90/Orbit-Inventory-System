import 'package:flutter/foundation.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'dart:io';
import 'dart:convert';

class NetworkSyncProvider with ChangeNotifier {
  final int _port = 8080;
  HttpServer? _server;
  final List<String> _connectedPeers = [];
  
  Future<void> startServer() async {
    final info = NetworkInfo();
    final wifiIP = await info.getWifiIP();
    
    try {
      _server = await HttpServer.bind(wifiIP, _port);
      _server!.listen((HttpRequest request) async {
        if (request.method == 'POST') {
          final content = await utf8.decoder.bind(request).join();
          final data = json.decode(content);
          await _handleSyncData(data);
        }
        request.response
          ..statusCode = HttpStatus.ok
          ..write('Sync received')
          ..close();
      });
    } catch (e) {
      print('Failed to start server: $e');
    }
  }

  Future<void> discoverPeers() async {
    final info = NetworkInfo();
    final wifiIP = await info.getWifiIP();
    if (wifiIP == null) return;

    final subnet = wifiIP.substring(0, wifiIP.lastIndexOf('.'));
    for (var i = 1; i < 255; i++) {
      final host = '$subnet.$i';
      try {
        final socket = await Socket.connect(host, _port, timeout: const Duration(milliseconds: 100));
        socket.destroy();
        if (!_connectedPeers.contains(host)) {
          _connectedPeers.add(host);
          notifyListeners();
        }
      } catch (_) {}
    }
  }

  Future<void> syncWithPeers(Map<String, dynamic> data) async {
    for (final peer in _connectedPeers) {
      try {
        final socket = await Socket.connect(peer, _port);
        socket.write(json.encode(data));
        await socket.close();
      } catch (e) {
        print('Failed to sync with peer $peer: $e');
      }
    }
  }

  Future<void> _handleSyncData(Map<String, dynamic> data) async {
    // Update local database with received data
    // This is where you would integrate with your InventoryProvider and SalesProvider
    notifyListeners();
  }

  @override
  void dispose() {
    _server?.close();
    super.dispose();
  }
}

