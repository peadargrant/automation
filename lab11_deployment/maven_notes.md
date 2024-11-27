Maven

Aim is to produce a "fat jar" file that includes non-standard dependencies.

Set finalName to the main class.
(Should be the same main class that your IDE is set to run.)

Make sure to use the Maven Assembly plugin to set the main class name.
It won't happen automatically from the IDE.

