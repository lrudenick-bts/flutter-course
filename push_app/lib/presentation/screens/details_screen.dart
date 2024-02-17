import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push_app/config/domain/entities/push_message.dart';
import 'package:push_app/presentation/blocs/notification_bloc/notification_bloc.dart';

class DetailsScreen extends StatelessWidget {
  final String messageId;

  const DetailsScreen({super.key, required this.messageId});

  @override
  Widget build(BuildContext context) {
    final PushMessage? message = context.read<NotificationBloc>().getMessageById(messageId);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification details'),
      ),
      body: message != null
        ? _DetailsView(message: message) 
        : const Center(child: Text('Notification not found')),
    );
  }
}

class _DetailsView extends StatelessWidget {

  final PushMessage message;

  const _DetailsView({required this.message});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          if(message.imageUrl != null)
            Image.network(
              message.imageUrl!,
            ),

          const SizedBox(height: 30),
          Text(message.title, style: textTheme.titleMedium),
          Text(message.body),
          const Divider(),
          Text(message.data.toString())

        ],
      ),
    );
  }
}