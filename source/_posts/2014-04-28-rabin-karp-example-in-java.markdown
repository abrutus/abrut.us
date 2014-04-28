---
layout: post
title: "Rabin-Karp example in Java"
date: 2014-04-28 00:11
comments: true
categories: ["programming"]
---
The [Rabin-Karp algorithm](http://en.wikipedia.org/wiki/Rabin%E2%80%93Karp_algorithm) is a string searching algorithm that has an average running time of `O(n+m)` instead of the `O(nm)` that is done when naively looping the small string on every character of the big string. If average of `O(n+m)` is not cutting it, investigate [Boyer-Moore with the inclusion of the Galil rule](http://en.wikipedia.org/wiki/Boyer%E2%80%93Moore_string_search_algorithm#The_Galil_Rule), or [Knuth-Morris-Pratt](http://en.wikipedia.org/wiki/Knuth%E2%80%93Morris%E2%80%93Pratt_algorithm) which  able to offer `O(n+m)` worst case. Rabin-Karp is the algorithm of choice for multiple pattern search.

``` java Rabin-Karp
class RabinKarp {
    // Hashes that simply take the int value of a character
    public static int hash(char a) {
        return (int) a;
    }
    public static int hash(String a) {
        int hash = 0;
        for(char ch : a.toCharArray()) {
            hash += (int)ch;
        }
        return hash;
    }
    
    static public int strpos(String big, String small) {
        if(small.length() > big.length()) return -1;
        int desiredHash = hash(small);
        int actualHash = -1;
        char [] bigArr = big.toCharArray();
        for(int i=0; i<big.length(); i++) {
            if(i + small.length()  > big.length()) break;
            // Calculate hash once O(m)
            if(actualHash == -1) {
                actualHash = hash(big.substring(i, i+small.length()));
            }
            // Rolling hash, constant time on consecutive hashes
            else {
                actualHash -= hash(bigArr[i-1]);
                actualHash += hash(bigArr[i+small.length()-1]);
            }
            if(actualHash == desiredHash) {
                // Could have collided
                if(big.substring(i, i+small.length()).equals(small))
                    return i;
            }
        }
        return -1;
    }
}
```
