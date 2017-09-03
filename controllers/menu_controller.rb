require_relative '../models/address_book'

class MenuController
   attr_reader :address_book
   
   def initialize
    @address_book = AddressBook.new
   end
   
   def main_menu
      p "Main Menu - #{address_book.entries.count} entries"
      p "1 - View all entries"
      p "2 - Create an entry"
      p "3 - Search for an entry"
      p "4 - Import entries from CSV"
      p "5 - Exit"
      print "Enter your selection: "
   
    selection = gets.to_i
    p "You picked #{selection}"
    
   end
   
end