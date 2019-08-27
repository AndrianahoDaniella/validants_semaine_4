class Gossip
    attr_accessor :name, :text    
    def initialize(author , content)
        @name = author
        @text = content
    end
    
    def save
        CSV.open("db/gossip.csv", "ab") do |csv|
           csv << [@name, @text]
        end
    end
    
    def self.all
         all_gossips = []
         CSV.read("db/gossip.csv").each do |csv_line|
           all_gossips << Gossip.new(csv_line[0], csv_line[1])
         end
     return all_gossips
    end
    
    def self.find(machin)
        i = 1
        Gossip.all.each do |ss|
            if i==machin
                return [ss , machin]
                break
            end
            i += 1
            end
    end
end