part of 'project_use_cases.dart';

@immutable
@injectable
class AddProjectUseCase extends UseCase<void, AddProjectParams> {
  AddProjectUseCase(this._projectLocalRepository);

  final ProjectLocalRepository _projectLocalRepository;

  @override
  Future<Either<Failure, void>> call(AddProjectParams params) async {
    return _projectLocalRepository.addItem(params.entity);
  }
}

class AddProjectParams {
  AddProjectParams(this.entity);

  final ProjectEntity entity;
}
