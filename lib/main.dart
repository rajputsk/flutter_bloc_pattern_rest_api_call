import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_api_call/ProfileModel.dart';
import 'package:flutter_bloc_api_call/profile_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProfileBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter BLoC Api Call'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:  BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileInitial) {
            return Center(child: Text("Click on Button For Api Call"));
          }

          if (state is ProfileLoading) {
            return const CircularProgressIndicator();
          }

          if (state is ProfileSuccess) {
            ProfileModel model = state.model;
            return ListView.separated(
              shrinkWrap: true,
              itemCount: model.data!.length,
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    'First Name: ${model.data![index].firstName}',
                    style: TextStyle(fontSize: 24),
                  ),
                  subtitle: Text(
                    'Last Name: ${model.data![index].lastName}',
                    style: TextStyle(fontSize: 16),
                  ),
                  leading: Text(
                    '${index+1}',
                    style: TextStyle(fontSize: 24),
                  ),
                );
              },
            );
          }
          if (state is ProfileError) {
            return Text(state.msg);
          }
          return const Text("Something wrong");
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ProfileBloc>().add(ButtonClicked());
        },
        tooltip: 'Call API',
        child: const Icon(Icons.add),
      ),
    );
  }
}
