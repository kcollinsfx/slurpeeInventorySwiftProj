// Slurpee's Inventory Swift App
import Foundation
import Glibc

// This function will just display the basic inventory
// with their corresponding prices.
func inv_menu(){
  print("=============================================================")
  print("\t\t\t\t\tSLURPIE'S INVENTORY")
  print("=============================================================")
  print("Items\t\t\t\t\t\t\t\t\t\t\tPrice")
  print("========\t\t\t\t\t\t\t\t\t\t=====")
  print("A. Xtreme Slurpies\t\t\t\t\t\t\t\t$7.99")
  print("B. Regular Chips\t\t\t\t\t\t\t\t$0.99")
  print("C. Large Chips\t\t\t\t\t\t\t\t\t$1.49")
  print("D. Water\t\t\t\t\t\t\t\t\t\t$0.99")
  print("E. Soda\t\t\t\t\t\t\t\t\t\t\t$1.09")
  print("F. Candy\t\t\t\t\t\t\t\t\t\t$0.99")
  print("G. Sunflower Seeds\t\t\t\t\t\t\t\t$1.29")
  print("H. Peanuts/Almonds/Cashews/Mixed nuts\t\t\t$1.49")
  print("I. Small Beef Jerky\t\t\t\t\t\t\t\t$0.99")
  print("J. Bag of Beef Jerky\t\t\t\t\t\t\t$3.99")
  print("K. Fountain Drinks\t\t\t\t\t\t\t\t$1.39")
  print("L. Hot Counter Items [Anything cooked such\n   as chicken strips, hotdogs and so on]\t\t$4.99")
  print("M. Cookies\t\t\t\t\t\t\t\t\t\t$0.50")
  print("N. Small Pizza\t\t\t\t\t\t\t\t\t$5.99")
  print("O. Large Pizza\t\t\t\t\t\t\t\t\t$9.99")
  print("P. Gas\t\t\t\t\t\t\t\t\t\t\t$2.15/Gallon")
  print("=============================================================")
  print("\t\t\t\t\t\t\tPURCHASE")
  print("=============================================================")
}

func item_selection() -> Character{ // purchase() opening bracket
  // Create an array to hold the characters representing the items
  let item_list:[Character] = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n", "o"]
  
  // Variable to hold the char of the selected item
  var item_choice:Character = " "
  
  //Ask the user how much of how many they are buying
  while(true){ // openning brackets 1st while()
    print("Enter the letter of the item you wish to purchase: ", terminator: "")
    if let item = readLine(){
      for chars in item.lowercased() {
            // Get the first char then break the loop
            item_choice = chars
            break
      }
    }
    // Variable to determine whether entered character
    // of the list
    var is_contained:Bool = item_list.contains(item_choice)

    if(is_contained == true){
      // Then the value is cotained [a-o]
      break
    }
    else if (item_choice == "p"){
      // Then p is contained
      break
    }
    else{
      print("Sorry Invalid entry try again.")
      item_choice = " "
      continue; 
    }
  } // Closing brackets 1st while loop
  return item_choice
}  // purchase() closing brackets

//totals_calc() Function 
func totals_calc(item_char:Character) -> Float{ // Open price_calc()
  var temp_totals:Float = 0.0 // Holds the temporary amount
  
  // Ask the user to enter the amount of
  while(true){ // First while loop opnening brace
    if(item_char != "p"){
      while(true){
        // Here we are going to get number as int
        print("Enter the amount of the item you want to purchase (whole number): ", terminator:"")
        if let amount = readLine(){
          if(Int(amount) != nil && Int(amount)! > 0){
            let totals = Float(Int(amount)!)
            temp_totals = totals
            break
          }
          else{
            print("Invalid Entry. Try again.")
            temp_totals = 0.0
            continue
          }
        }
      } // If - inner while loop closing brace
    } // If closing brace
    else {
      while(true){ // Else - inner while loop() opening brace
        // Here we are going to get number as float
        print("Enter the amount you want to enter (decimal): ", terminator:"")
        if let amount = readLine(){
          if(Float(amount) != nil && Float(amount)! > 0.0){
            temp_totals += Float(amount)!
            break
          }
          else {
            print("Invalid Entry. Try again.")
            temp_totals = 0.0
            continue
          }
        }
      }
    } // Else - closing brace
    break
  } // First while loop closing brace
  return temp_totals
} //price_calc() closing brace 

// Calculates prices
func price_calc(item_char:Character, totals:Float) -> Float{ 
  // Variables to hold how many of each product that the customer would
  // like to buy.
  var a_totals:Float = 0.0
  var b_totals:Float = 0.0
  var c_totals:Float = 0.0
  var d_totals:Float = 0.0
  var e_totals:Float = 0.0
  var f_totals:Float = 0.0
  var g_totals:Float = 0.0
  var h_totals:Float = 0.0
  var i_totals:Float = 0.0
  var j_totals:Float = 0.0
  var k_totals:Float = 0.0
  var l_totals:Float = 0.0
  var m_totals:Float = 0.0
  var n_totals:Float = 0.0
  var o_totals:Float = 0.0
  var p_totals:Float = 0.0

  // Variable to hold onto the total BEFORE TAX 
  var sum_price:Float = 0.0

  // Variable to hold on the sum total to be paid AFTER TAX [x0.092]
  //var transaction_price:Float = 0.0

  if(item_char == "a"){
    // Initialize the a_totals to the amount passed
    a_totals = totals
    // Add the cash amount to the total sum price
    sum_price += (a_totals * 7.99)
  }
  else if(item_char == "b"){
    // Initialize the b_totals to the amount passed
    b_totals = totals
    sum_price += (b_totals * 0.99)
  }
  else if(item_char == "c"){
    c_totals = totals
    sum_price += (c_totals * 1.49)
  }
  else if(item_char == "d"){
    d_totals = totals
    sum_price += (d_totals * 0.99)
  }
  else if(item_char == "e"){
    e_totals = totals
    sum_price += (e_totals * 1.09)
  }
  else if(item_char == "f"){
    f_totals = totals
    sum_price += (f_totals * 0.99)
  }
  else if(item_char == "g"){
    g_totals = totals
    sum_price += (g_totals * 1.29)
  }
  else if(item_char == "h"){
    h_totals = totals
    sum_price += (h_totals * 1.49)
  }
  else if(item_char == "i"){
    i_totals = totals
    sum_price += (i_totals * 0.99)
  }
  else if(item_char == "j"){
    j_totals = totals
    sum_price += (j_totals * 3.99)
  }
  else if(item_char == "k"){
    k_totals = totals
    sum_price += (k_totals * 1.39)
  }
  else if(item_char == "l"){
    l_totals = totals
    sum_price += (l_totals * 4.99)
  }
  else if(item_char == "m"){
    m_totals = totals
    sum_price += (m_totals * 0.50)
  }
  else if(item_char == "n"){
    n_totals = totals
    sum_price += (n_totals * 5.99)
  }
  else if(item_char == "o"){
    o_totals = totals
    sum_price += (o_totals * 9.99)
  }
  else if(item_char == "p"){
    p_totals = totals
    sum_price += (p_totals * 2.15)
  }

  // Now that we have calculated the sum_price
  // Format to two decimal places
  sum_price = round(sum_price * 100) / 100.0  

  // Return the transaction price
  return sum_price
} // end of price_calc() function 

// Test area 
func test_bench(){ 
  // Show the inventory menu
  inv_menu()
  // Variable to hold sum of all trans_total
  var sum_total_price:Float = 0.0
  var change:Float = 0.0
  while (true){ // First while loop opening
    var choice:Character = " " // Will hold the user's choice
    var item:Character = item_selection()
    var item_amount:Float = totals_calc(item_char: item)
    var trans_total:Float = price_calc(item_char: item, totals: item_amount)
    sum_total_price += trans_total

    // Ask the user whether they want to buy something else
    // add to cart
  print("=============================================================")
    print("Would you like to add another item to your cart? ")
    print("Enter y for YES and n for NO: ", terminator: "")
    if let choice_input = readLine(){
        for chars in choice_input.lowercased() {
            // Get the first char then break the loop
            choice = chars
            break
        }
    }
    // Validate that the user has enterd the correct values
    while (choice != "n" && choice != "y"){ // second loop closing brace
      print("Invalid Entry try again: ", terminator: "")
      if let choice_input = readLine(){
        for chars in choice_input.lowercased() {
            // Get the first char then break the loop
            choice = chars
            break
        }
      }
      if (choice == "n"){
        break
      }
      else if(choice == "y"){
        break
      }
      else {
        continue
      }
    } // second while loop closing braces
    if (choice == "n"){
      break
    }
    else if (choice == "y"){
      continue
    }
  } // First while loop closing braces
  // Let's apply the tax
  sum_total_price += sum_total_price * 0.092
  
  // Format it to 2 decimal places
  sum_total_price = round(sum_total_price * 100) / 100.0

  print("=============================================================")
  print("\t\t\t\t\t\t\tPAYMENT")
  print("=============================================================")
  print("The sum price total was $\(sum_total_price) [After Tax]")

  // Calculate the user's change and let them know how much they are getting
  change = registry(sum_total: sum_total_price)

  // Round the change to the nearest hundredth
  change = round(change * 100) / 100.0

  if(change != -1.0){
  print("=============================================================")
    print("Your change is: $\(change)")
    print("Thank you for shopping at the Slurpie's Convenience Store.")
  print("=============================================================")

  }
  else {
    print()
  }
} // function closing braces 

// The registry function will just take in 
// the cash amount from the user and the last amount 
// Then return the change calculated.
// If negative tell the user to increase the amount
func registry(sum_total:Float) -> Float{ 
  // Ask the user whether he will be paying by check or cash
  var cash_amount:Float = 0.0
  var purch_option:Int = 0
  var change:Float = 0.0
  while (true){
    print("Will it be cash or check?")
    print("\tEnter 1 for cash.")
    print("\tEnter 2 for check.")
    print("\tEnter 3 to cancel transaction.")
    print("Enter your option: ", terminator: "")
    // Get input from the user
    if let option = readLine(){
      if (Int(option) != nil) {
        if(Int(option) == 1){
          purch_option = Int(option)!
          break
        }
        else if (Int(option) == 2){
          purch_option = Int(option)!
          break
        }
        else if(Int(option) == 3){
          purch_option = Int(option)!
          break
        }
        else {
          print("Invalid Entry. Try again!")
          continue
        }  
      }
      else {
        print("Invalid Entry. Try again!")
        continue
      }
    }
    
  } // End First while loop

  // Second while loop to collect money and calculate change
  // 1 - cash
  if(purch_option == 1 || purch_option == 2){
    while(true){ // second while loop open braces
      print("Enter the cash amount you wish to pay $: ", terminator:"")
      if let cash = readLine(){
        if(Float(cash) != nil){
          if(Float(cash)! < sum_total){
            print("Invalid entry. Try again!")
            continue
          }
          else {
            cash_amount = Float(cash)!
            change = cash_amount - sum_total
            break
          }
        }
        else{
          print("Invalid entry. Try again!")
          continue
        }
      }
    } // second while loop closing braces
  }
  else{
  print("=============================================================")
    print("Transaction cancelled......")
  print("=============================================================")

    change = -1;
  }  
  // return change
  return change
} 

// Run the app.
test_bench()