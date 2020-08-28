$STOCK = {
  "A" => {
    "prices": {
      "unit": 2,
      "pack": 7.00,
    },
    "quantityPackage": 4
  },
  "B" => {
    "prices": {
      "unit": 12.00
    }
  },
  "C" => {
    "prices": {
      "unit": 1.25,
      "pack": 6.00,
    },
    "quantityPackage": 6
  },
  "D" => {
    "prices": {
      "unit": 0.15
    }
  }
}

def store(products)

  $STOCK.keys.each_with_object([]) do |prod, memo|
    amount = products.scan(prod).size
    if $STOCK[prod].has_key?(:quantityPackage)
      packs, unit = amount.divmod($STOCK[prod][:quantityPackage])
      memo << packs * $STOCK[prod][:prices][:pack] + unit * $STOCK[prod][:prices][:unit]
    else
      memo << amount * $STOCK[prod][:prices][:unit]
    end
  end.sum

end

 p store('ABCDABAA') #=> $32.40.
 p store('CCCCCCC') #=> $7.25.
 p store('ABCD') #=> $15.40.
 p store('') #=> $0.
 p store('ASREBTYUCHFFDY') #=> $15.40.