### **Project: [Store](store.rb)**

### **Introduction:**

Consider a store where each item has a price per unit, and may also have a volume price. For example, apples may be $1.00 each or 4 for $3.00.

Implement a point-of-sale scanning API that accepts an arbitrary ordering of products (similar to what would happen at a checkout line) and then returns the correct total price for an entire shopping cart based on the per unit prices or the volume prices as applicable.

Here are the products listed by code and the prices to use (there is no sales tax)

| Product Code | Price                        |
| :----------- | :--------------------------- | 
| A            | $2.00 each or 4 for $7.00    | 
| B            | $12.00                       | 
| C            | $1.25 or $6 for a six pack   | 
| D            | $0.15                        | 


### **Examples:**

```irb
> store('ABCD')
=> $15.40.
```

```irb
> store('ABCDABAA')
=> $32.40.
```

### **Solution:**

    • First, declare the global variable `$STOCK` as an object.
    • Then I define a store function who has a parameter `products` to get a string of selected products.
    • Start getting the list of available products from stock using the `key` function on the object,
      this will return an array of the object's keys.
    • So I loop through the array using the `each_with_object` function declaring an array as a parameter.
    • In the callback, I declare `prod` which is each element of the products,
      and `memo` which is the empty array declared in the function.
    • At this point we are doing the calculations one product at a time, keeping that in mind, let's continue.
    • We declare the variable `amount` to obtain the quantity of a product, to achieve it we do the following:
      - We use the `scan` function on our string `products` 
      - `scan` receives by parameters the product that it wants to search within our string,
      and returns an array with the matches, eg:
          "AABC".scan ("A") # => ['A', 'A']
      - on the array that is returned, we call the function `size` to give us the amount.
    • Then we declare a conditional that asks if our stock product has the key `: quantityPackage`,
      this helps us to know if it is a product that comes out per package or only per unit.
    • If it returns true our product also comes out in packages, if it returns false, it is only available per unit.
    • Inside the if, to obtain the number of packages and units that it carries we use the `divmod` function that
      accepts by parameters the quantity that a package should have and returns  the divisor and the module,
      thus we obtain the number of packages and units, let's see:
      - If we have 5 `A` products and we know that` A` has a special price in packages of 4,
        we need to separate the number of packages and units,
        we use `divmod` to return those values: 
          5.divmod (4) => [5 / 4.5% 4] => [1,1]
      - And we assign it to our variables `packs` and` units`
          packs, units = [1,1] #=> packs = 1, units = 1
    • Then we push (<<) to our initially declared arrangement (memo) the price of the product packages and units.
    • Within the `else` we do the same only that here we no longer have products that are sold by packages.
    • At this point, after having gone through all our products and having stored their prices in an array,
      we use the `sum` function to add all the results and return the total amount, let's see:
      - At the end of this block we are left with something like this:
          [1,2,3,4]
      - You call the `sum` function to obtain the total value of the array:
          [1,2,3,4].sum #=> 10
    • And that's how we get the total purchase price.

### **References:**

* [keys (Hash)](https://ruby-doc.org/core-2.5.1/Hash.html#method-i-keys)
* [has_key? (Hash)](https://ruby-doc.org/core-2.7.0/Hash.html#method-i-has_key-3F)
* [each_with_object (Enumerable)](https://ruby-doc.org/core-2.7.1/Enumerable.html#method-i-each_with_object)
* [scan (StringScanner)](https://ruby-doc.org/stdlib-2.6.1/libdoc/strscan/rdoc/StringScanner.html#method-i-scan)
* [size (Array)](https://ruby-doc.org/core-2.7.0/Array.html#method-i-size)
* [divmod (Numeric)](https://ruby-doc.org/core-2.5.0/Numeric.html#method-i-divmod)
* [sum (Enumerable)](https://ruby-doc.org/core-2.7.1/Enumerable.html#method-i-sum)