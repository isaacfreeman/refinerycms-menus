module Refinery
  module Menus
    class Menu < Refinery::Core::BaseModel
      self.table_name = "refinery_menus"

      has_many :links, :class_name => "::Refinery::Menus::MenuLink", :foreign_key => :refinery_menu_id, :dependent => :destroy

      validates :title, :presence => true, :uniqueness => true
      validates :permatitle, :presence => true, :uniqueness => true
      validates_associated :links

      accepts_nested_attributes_for :links, :allow_destroy => true

      def roots
        @roots ||= links.select {|pos| pos.parent_id.nil?}
      end
    end
  end
end
