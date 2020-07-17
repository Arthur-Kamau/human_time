class MessageTimeDifference {
  static String timeDifToHumanReadable(Duration timeDiff) {
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
    } else if (timeDiff.inDays > 7 && timeDiff.inDays < 14) {
      return "${timeDiff.inDays} days ago";
    } else if (timeDiff.inDays == 14) {
      return "two weeks ago";
    } else if (timeDiff.inDays > 14 && timeDiff.inDays < 21) {
      return "${timeDiff.inDays} days ago";
    } else if (timeDiff.inDays == 21) {
      return "three weeks ago";
    } else if (timeDiff.inDays > 21 && timeDiff.inDays < 30) {
      return "${timeDiff.inDays} days ago";
    } else if (timeDiff.inDays > 30 && timeDiff.inDays < 365) {
      return getMonthsAndDays(timeDiff);
    } else if (timeDiff.inDays > 365) {
      return "${timeDiff.inDays / 365} years ago";
    } else {
      return "long ago";
    }
  }

  static String getMonthsAndDays(Duration timeDiff) {
    int months = timeDiff.inDays ~/ 30;
    int days = timeDiff.inDays % 30;
  
    String diffMonth = "";
    if (months > 2) {
      diffMonth = "$months months";
    } else {
      diffMonth = "$months month";
    }

    String diffDays = "";
    if (days == 0) {
      // just ignore
    } else if (days == 1) {
      diffDays = " and a $days day ago";
    } else {
      diffDays = " , $days days ago";
    }

  

    return "$diffMonth$diffDays";
  }
}
