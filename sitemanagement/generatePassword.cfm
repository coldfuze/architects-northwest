<!---
This library is part of the Common Function Library Project. An open source
	collection of UDF libraries designed for ColdFusion 5.0 and higher. For more information,
	please see the web site at:

		http://www.cflib.org

	Warning:
	You may not need all the functions in this library. If speed
	is _extremely_ important, you may want to consider deleting
	functions you do not plan on using. Normally you should not
	have to worry about the size of the library.

	License:
	This code may be used freely.
	You may modify this code as you see fit, however, this header, and the header
	for the functions must remain intact.

	This code is provided as is.  We make no warranty or guarantee.  Use of this code is at your own risk.
--->

<cfscript>
/**
 * Generates a password the length you specify.
 * v2 by James Moberg.
 * 
 * @param numberOfCharacters 	 Lengh for the generated password. Defaults to 8. (Optional)
 * @param characterFilter 	 Characters filtered from result. Defaults to O,o,0,i,l,1,I,5,S (Optional)
 * @return Returns a string. 
 * @author Tony Blackmon (fluid@sc.rr.com) 
 * @version 2, February 8, 2010 
 */
function generatePassword() {
var placeCharacter = "";
var currentPlace=0;
var group=0;
var subGroup=0;
var numberofCharacters = 8;
var characterFilter = 'O,o,0,i,l,1,I,5,S';
var characterReplace = repeatString(",", listlen(characterFilter)-1);
if(arrayLen(arguments) gte 1) numberofCharacters = val(arguments[1]);
if(arrayLen(arguments) gte 2) {
characterFilter = listsort(rereplace(arguments[2], "([[:alnum:]])", "\1,", "all"),"textnocase");
characterReplace = repeatString(",", listlen(characterFilter)-1);
}
while (len(placeCharacter) LT numberofCharacters) {
group = randRange(1,4, 'SHA1PRNG');
switch(group) {
case "1":
subGroup = rand();
    switch(subGroup) {
case "0":
placeCharacter = placeCharacter & chr(randRange(33,46, 'SHA1PRNG'));
break;
case "1":
placeCharacter = placeCharacter & chr(randRange(58,64, 'SHA1PRNG'));
break;
}
case "2":
placeCharacter = placeCharacter & chr(randRange(97,122, 'SHA1PRNG'));
break;
case "3":
placeCharacter = placeCharacter & chr(randRange(65,90, 'SHA1PRNG'));
break;
case "4":
placeCharacter = placeCharacter & chr(randRange(48,57, 'SHA1PRNG'));
break;
}
if (listLen(characterFilter)) {
placeCharacter = replacelist(placeCharacter, characterFilter, characterReplace);
}
}
return placeCharacter;
}
</cfscript>