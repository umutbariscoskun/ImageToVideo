part of 'project_use_cases.dart';

@immutable
@injectable
class GetProjectsUseCase extends UseCase<List<ProjectEntity>, NoParams> {
  GetProjectsUseCase(this._projectLocalRepository);

  final ProjectLocalRepository _projectLocalRepository;

  @override
  Future<Either<Failure, List<ProjectEntity>>> call(NoParams params) {
    return Future.value(_projectLocalRepository.getValues(params));
  }
}
