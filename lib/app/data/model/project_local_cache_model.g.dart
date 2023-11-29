// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_local_cache_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProjectLocalCacheModelAdapter
    extends TypeAdapter<ProjectLocalCacheModel> {
  @override
  final int typeId = 1;

  @override
  ProjectLocalCacheModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProjectLocalCacheModel(
      projectId: fields[0] as String,
      projectPath: fields[1] as String,
      projectImages: (fields[2] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, ProjectLocalCacheModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.projectId)
      ..writeByte(1)
      ..write(obj.projectPath)
      ..writeByte(2)
      ..write(obj.projectImages);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProjectLocalCacheModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
