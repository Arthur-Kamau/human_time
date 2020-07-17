# human_time
Flutter plugin to show difference in time that humans can easily understand.

# example
`30 minutes ago`

## Methods exposed

* `String timeBetween ({DateTime from , DateTime to })`
    Calculates the time between the two provide timestamps and provides the human readable time

* `String timeFrom (DateTime from)` 
    Calculates the time difference between  the time given and the local time(Based on system time)

* `Stream<String> timeFromStream (DateTime from)`
    Calculates the time difference between  the time given and the local time(Based on system time), but with a time out that will keep emiting changes in time over durations of time.

##  Plans 
add time diff based on time zone.
1. Set timezones as an enum  example :
        * EAT -East Africa time
        * India Standard Time (IST)
        * Coordinated Universal Time
2. Method calls to take in the time and caluclate diff human time.


## Contributers.
Feel free to contribute.  😊