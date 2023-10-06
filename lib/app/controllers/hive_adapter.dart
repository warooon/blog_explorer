import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:blog_explorer/app/data/blog_data.dart';

class BlogAdapter extends TypeAdapter<Blog> {
  @override
  final int typeId = 0; 

  @override
  Blog read(BinaryReader reader) {
    return Blog(
      id: reader.readString(),
      title: reader.readString(),
      imageUrl: reader.readString(),
      isFav: reader.readBool().obs,
    );
  }

  @override
  void write(BinaryWriter writer, Blog obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.title);
    writer.writeString(obj.imageUrl);
    writer.writeBool(obj.isFav.value);
  }
}
