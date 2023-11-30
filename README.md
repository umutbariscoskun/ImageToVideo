# image_to_video

Convert your images into video with FFmpek kit library

### ARCHITECTURE: 

- Clean Architecture

![image](https://github.com/umutbariscoskun/ApiCrudAPP/assets/45595606/9e8d7eec-8de0-416f-ad1b-eee5a4561a61)

[You can find more about this architecture in my article.](https://medium.com/@umutbariscoskun/flutter-clean-architecture-paketi-ve-mimari-kullan%C4%B1m%C4%B1-beae4d09e0c3)



### UI: 
![gif](https://github.com/umutbariscoskun/ImageToVideo/assets/45595606/37efd236-9ecb-4497-aa6c-7a898a340e0b)

We needed to know the name and location of the image for the ffmpeg command, and all the images to be processed should be in the same folder.
So, the locations of the images were changed and they were renamed, allowing them to be processed with the ffmpeg command below.
You can find all these operations in the file manager.

```dart
 "${destination.path}/image%03d.jpg",

```




# ImageToVideo
