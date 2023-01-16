# 화면 간 데이터 전달

## 부모 -> 자식 , stf
    부모: 
    return MyDialog(context, job, description: description, image: image);

    자식:
    class MyDialog extends StatefulWidget {
        const MyDialog(context, this.job, {Key? key, required this.description, required this.image }) : super(key: key);
        final String job;
        final String description;
        final dynamic image;
    
    UI:
    child: Text("des: ${widget.image}")

## 부모 -> 자식 , stl
    부모: 
    return MyDialog(context, job, description: description, image: image);

    자식:
    class MyDialog extends StatelessWidget {
        const MyDialog(context, this.job, {Key? key, required this.description, required this.image }) : super(key: key);
        final String job;
        final String description;
        final dynamic image;

    UI:
    child: Text("des: $des"),

## 자식 -> 부모
    자식:
    Navigator.pop(context, returnData);

    부모:
    if( returnData != null ){
      print("modified: $returnData");
    }