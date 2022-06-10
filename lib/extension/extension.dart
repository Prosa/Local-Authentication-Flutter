

extension StringNullExt on String?{
  bool? toBool(){
    if(this==null){
      return null;
    }
    if(this!.toLowerCase()=='true'){
      return true;
    }else if(this!.toLowerCase()=='false'){
      return false;
    }
    return null;
  }

  String? removeLastCharacter() {
    if(this==null){
      return null;
    }
    if(this!.isEmpty){
      return this;
    }

    return this!.substring(0, this!.length - 1);
  }

}

extension StringExt on String{

  bool? toBool(){

    if(toLowerCase()=='true'){
      return true;
    }else if(toLowerCase()=='false'){
      return false;
    }
    return null;
  }

  String removeLastCharacter() {
    if(isEmpty){
      return this;
    }

    return substring(0, length - 1);
  }

}