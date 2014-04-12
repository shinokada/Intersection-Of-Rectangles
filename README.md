# Intersection of Rectangles

[Problem details](http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=0059)

![Intersection of rectangle](/img/intersection.gif)

## Problem

Two rectangles must not have the same size. Input is 4 coordinates of two rectangle as seen in the image above. If they intersect or touch each other, then output should be YES. 


## Input

    xa1 ya1 xa2 ya2 xb1 yb1 xb2 yb2 (First data: float)
    xa1 ya1 xa2 ya2 xb1 yb1 xb2 yb2 (Second data: float)
    xa1 ya1 xa2 ya2 xb1 yb1 xb2 yb2 (Third data: float)

## Output

    YES or NO 
    YES or NO 
    YES or NO 

## Sample Input

    0.0 0.0 5.0 5.0 1.0 1.0 4.0 4.0
    0.0 0.0 4.0 5.0 1.0 1.0 5.0 5.0
    0.0 0.0 4.0 4.0 -3.0 -5.0 2.0 -1.0
    1.0 1.0 2.0 3.0 2.0 1.0 4.0 2.0

## Output for the Sample Input

    YES
    YES
    NO
    YES

## Sample

### Same size 
Even though the following images are touching, since they have the same size the result should give false.

![Sample 1](/img/sample1.png)

Input coordinates are: (1,1)(2,3)(2,1)(4,2)

### True/Yes
The following should give true.

![Sample 2](/img/sample2.png)

Input coordinates are: (0,0)(4,4)(-3,-5)(2,2)

### One of rectangle is in another.
In this case also it should give true/Yes.

![Sample 2](/img/sample2.png)

Input coordinates are: (0,0)(4,4)(-2,-2)(5,5)

or

(-2,-2)(5,5)(0,0)(4,4)

### Unidentified coordinate is in another.

This should give true/Yes.

![Sample 2](/img/sample2.png)

Input coordinates are: (0,0)(4,4)(2,-5)(10,2)

## Algorithm

Firstly this checks if two rectangles have the same size. If it doesn't then it finds all integer coordinate of one of rectangles and put it in an array. 
It needs to find all four coordinates of the second rectangle. Then it checks if any of them is in the first array.  
