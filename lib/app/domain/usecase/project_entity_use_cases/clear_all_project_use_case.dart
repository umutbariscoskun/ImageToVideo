part of 'project_use_cases.dart';

@immutable
@injectable
class ClearAllProjectUseCase extends UseCase<void, NoParams> {
  ClearAllProjectUseCase(this._projectLocalRepository);

  final ProjectLocalRepository _projectLocalRepository;

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return _projectLocalRepository.clearAll(params);
  }
}
