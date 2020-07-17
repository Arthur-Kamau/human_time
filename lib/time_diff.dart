class MessageTimeDifference {
  static String timeDifToHumanReadable( Duration timeDiff) {
  

    if (timeDiff.inSeconds <= 0) {
      return "now";
    } else if (timeDiff.inSeconds > 0 && timeDiff.inSeconds < 60) {
      return "${timeDiff.inSeconds} sec ago";
    } else if (timeDiff.inMinutes >= 0 && timeDiff.inMinutes < 60) {
      return "${timeDiff.inMinutes} mins ago";
    } else if (timeDiff.inHours >= 0 && timeDiff.inHours < 24) {
      return "${timeDiff.inHours} hrs ago";
    } else if (timeDiff.inHours >= 24 && timeDiff.inHours < 48) {
      return "one day ago";
    } else if (timeDiff.inHours >= 48 && timeDiff.inHours < 72) {
      return "two day ago";
    } else if (timeDiff.inDays < 7) {
      return "${timeDiff.inDays} days ago";
    } else if (timeDiff.inDays == 7) {
      return "a week ago";
    } else if (timeDiff.inDays >  7  &&  timeDiff.inDays < 14 ) {
      return "${timeDiff.inDays} days ago";
    }  else if (timeDiff.inDays == 14) {
      return "two weeks ago";
    }else if (timeDiff.inDays  >  14 &&  timeDiff.inDays < 21 ) {
      return "${timeDiff.inDays} days ago";
    } else if (timeDiff.inDays == 21) {
      return "three weeks ago";
    }  else if (timeDiff.inDays > 21 && timeDiff.inDays < 30) {
      return "${timeDiff.inDays} days ago";
    } else if (timeDiff.inDays > 30 && timeDiff.inDays < 365) {
      return "${timeDiff.inDays / 30.toInt()} months ago";
    } else if (timeDiff.inDays > 365) {
      return "${timeDiff.inDays / 365} years ago";
    } else {
      return "long ago";
    }
  }
}
