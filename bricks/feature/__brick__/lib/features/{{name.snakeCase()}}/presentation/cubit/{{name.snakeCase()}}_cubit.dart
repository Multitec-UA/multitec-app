import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitec_app/features/{{name.snakeCase()}}/presentation/cubit/{{name.snakeCase()}}_state.dart';

class {{name.pascalCase()}}Cubit extends Cubit<{{name.pascalCase()}}State> {
  {{name.pascalCase()}}Cubit() : super(const {{name.pascalCase()}}State());
}
