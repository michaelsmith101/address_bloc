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
        p "5 - View Entry Number n"
        p "6 - Exit"
        print "Enter your selection: "
       
        selection = gets.to_i
        
        case selection
           when 1
             system "clear"
             p "test"
             view_all_entries
             main_menu
           when 2
             system "clear"
             create_entry
             main_menu
           when 3
             system "clear"
             search_entries
             main_menu
           when 4
             system "clear"
             read_csv
             main_menu
           when 5
             system "clear"
             view_entry
             main_menu
           when 6
             p "Good-bye!"
             exit(0)
           else
             system "clear"
             p "Sorry, that is not a valid input"
             main_menu
        end
   end
   
   def view_entry
      
      record_count = @address_book.entries.count
      
      if record_count == 0
        p "There are no entries in the address book at this time. Press enter to return to Main Menu"
        gets.chomp
        system "clear"
      else
        print "Enter entry number to view: "
        selection = gets.to_i
        if selection < record_count
            p @address_book.entries[selection]
            p "Press enter to return to the main menu"
            gets.chomp
            system "clear"
        else
            p "#{selection} does not exist, enter a valid number (0 through #{record_count - 1})"
            view_entry
        end
      end
        
   end
 
    def view_all_entries
       
        address_book.entries.each do |entry|
           system "clear"
           p entry.to_s

           entry_submenu(entry)
        end
 
         system "clear"
         puts "End of entries"
    end
    
    def entry_submenu(entry)

     p "n - next entry"
     p "d - delete entry"
     p "e - edit this entry"
     p "m - return to main menu"
 
     selection = gets.chomp
 
     case selection

       when "n"

       when "d"
       when "e"

       when "m"
         system "clear"
         main_menu
       else
         system "clear"
         puts "#{selection} is not a valid input"
         entry_submenu(entry)
     end
     
    end
 
   def create_entry
     system "clear"
     p "New AddressBloc Entry"
     
     print "Name: "
     name = gets.chomp
     print "Phone number: "
     phone = gets.chomp
     print "Email: "
     email = gets.chomp
 
     address_book.add_entry(name, phone, email)
 
     system "clear"
     p "New entry created"
   end
 
   def search_entries
   end
 
   def read_csv
    
   end
   
end