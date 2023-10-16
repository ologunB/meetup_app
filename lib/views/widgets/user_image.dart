import 'meetup_text.dart';

class UserImage extends StatelessWidget {
  const UserImage({
    super.key,
    this.file,
    this.imageUrl,
    required this.size,
    required this.radius,
  });

  final Uint8List? file;
  final String? imageUrl;
  final double size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: file == null
          ? CachedNetworkImage(
              imageUrl: imageUrl ??
                  'https://firebasestorage.googleapis.com/v0/b/flagmode-test.appspot.com/o/profilePictures%2Fuser.png?alt=media&token=b31835e4-dab4-4eab-b838-c678be035eba',
              height: size,
              width: size,
              fit: BoxFit.cover,
              placeholder: (_, __) => Image.asset(
                'person'.png,
                height: size,
                width: size,
                fit: BoxFit.cover,
              ),
              errorWidget: (_, __, ___) => Image.asset(
                'person'.png,
                height: size,
                width: size,
                fit: BoxFit.cover,
              ),
            )
          : Image.memory(
              file!,
              height: size,
              width: size,
              fit: BoxFit.fill,
            ),
    );
  }
}
