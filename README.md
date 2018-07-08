# Gilded rose tech test

This is a well known kata developed by [Terry Hughes](http://iamnotmyself.com/2011/02/13/refactor-this-the-gilded-rose-kata/). This is commonly used as a tech test to assess a candidate's ability to read, refactor and extend legacy code.

Here is the text of the kata:

*"Hi and welcome to team Gilded Rose. As you know, we are a small inn with a prime location in a prominent city run by a friendly innkeeper named Allison. We also buy and sell only the finest goods. Unfortunately, our goods are constantly degrading in quality as they approach their sell by date. We have a system in place that updates our inventory for us. It was developed by a no-nonsense type named Leeroy, who has moved on to new adventures. Your task is to add the new feature to our system so that we can begin selling a new category of items. First an introduction to our system:

All items have a SellIn value which denotes the number of days we have to sell the item. All items have a Quality value which denotes how valuable the item is. At the end of each day our system lowers both values for every item. Pretty simple, right? Well this is where it gets interesting:

- Once the sell by date has passed, Quality degrades twice as fast
- The Quality of an item is never negative
- “Aged Brie” actually increases in Quality the older it gets
- The Quality of an item is never more than 50
- “Sulfuras”, being a legendary item, never has to be sold or decreases in Quality
- “Backstage passes”, like aged brie, increases in Quality as it’s SellIn value approaches; Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert

We have recently signed a supplier of conjured items. This requires an update to our system:

* “Conjured” items degrade in Quality twice as fast as normal items

Feel free to make any changes to the UpdateQuality method and add any new code as long as everything still works correctly. However, do not alter the Item class or Items property as those belong to the goblin in the corner who will insta-rage and one-shot you as he doesn’t believe in shared code ownership (you can make the UpdateQuality method and Items property static if you like, we’ll cover for you)."*

## The brief:

Choose [legacy code](https://github.com/emilybache/GildedRose-Refactoring-Kata) (translated by Emily Bache) in the language of your choice. The aim is to practice good design in the language of your choice. Refactor the code in such a way that adding the new "conjured" functionality is easy.

## Installation

* Begin by forking this repo
* Clone it to your local machine using `git clone` followed by your HTTPS
* Type `ruby visit_shop.rb` into the terminal to see all the available goods and their respective sell_in and quality values for a selected number of days
* To edit the number of days to print goods out for, and to edit which goods are listed, go inside the visit_shop.rb file in your editor

## Approach

* The first thing I did was to write up a feature test for the legacy code. This allowed me to double check that everything was working as it should be, and it also served as an indicator for diverging away from desired functionality as I refactored the code.

* The next step was to extract all the huge conditional statements in the legacy code into small chunks, by making private methods. At the end of this process, I had 10 private methods. The public update_quality method simply called 3 of these private functions: update_standard_item, update_brie and update_backstage_pass.

* Now that the code was a lot more readable, I started to encapsulate functionality into classes. The first step was to pull the prewritten Item class into its own file.

* I then created a class for each type of item, using inheritance and polymorphism in order to keep the code clean and DRY.

* All of these classes were unit test driven.

* Thanks to the polymorphism and inheritance, once the classes were extracted, all that was left to do in GildedRose class was to call the `update_item` method on each element of the array that gets passed to it.

* Finally, once I was sure all the feature tests still passed, I deleted all the now redundant private methods of GildedRose class. 

## Testing
This challenge was Test Driven using Rspec for unit testing. You can view all the passing unit tests by typing `rspec` in the terminal when in the project directory.
