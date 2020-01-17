public void setup() 
{
	String[] lines = loadStrings("words.txt");
	System.out.println("there are " + lines.length + " lines");
	for (int i = 0 ; i < lines.length; i++) 
	{
	  System.out.println(pigLatin(lines[i]));
	}
}
public void draw()
{
        //not used
}
public int findFirstVowel(String word)
//precondition: sWord is a valid String of length greater than 0.
//postcondition: returns the position of the first vowel in sWord.  If there are no vowels, returns -1
{
	int retVal=-1;
	for(int i=0; i<word.length(); i++) {
    	if(i==word.length()-1) {
      		if(word.substring(i).equals("a") || word.substring(i).equals("e") || word.substring(i).equals("i") || word.substring(i).equals("o") || word.substring(i).equals("u")) {
        		retVal=i;
        		break;
      		}
    	}
		else if(word.substring(i, i+1).equals("a") || word.substring(i, i+1).equals("e") || word.substring(i, i+1).equals("i") || word.substring(i, i+1).equals("o") || word.substring(i, i+1).equals("u")) {
    		retVal=i;
    		break;
    	}
  	}
	return retVal;
}
public int findLeadingConsonants(String word) {
	int finalConPos=-1;
	for(int i=0; i<word.length(); i++) {
		if(word.charAt(i)=='a' || word.charAt(i)=='e' || word.charAt(i)=='i' || word.charAt(i)=='o' || word.charAt(i)=='u') {
			break;
		}
		else {
			finalConPos=i;
		}
	}
	return finalConPos;
}

public String pigLatin(String word)
//precondition: sWord is a valid String of length greater than 0
//postcondition: returns the pig latin equivalent of sWord
{
	if(findFirstVowel(word) == -1)
	{
		return word + "ay";
	}
	else if(word.substring(0,1).equals("a") || word.substring(0,1).equals("e") || word.substring(0,1).equals("i") || word.substring(0,1).equals("o") || word.substring(0,1).equals("u")) {
		return word + "way";
	}
	else if(word.substring(0,2).equals("qu")) {
		return word.substring(2) + "quay";
	}
	else if (findLeadingConsonants(word) != -1) {
		return word.substring(findLeadingConsonants(word)+1) + word.substring(0,findLeadingConsonants(word)+1) + "ay";
	}
	else
	{
		return "ERROR!";
	}
}
