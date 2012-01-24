require 'active_record'

module Rangetastic
  
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def acts_as_rangetastic(options = {:fields => []})
      @fields = options[:fields]
      scope :between, lambda{ |start_date, end_date, fieldname|
        field = @fields.include?(fieldname) ? fieldname : raise(ActiveRecord::StatementInvalid)
        where("#{field} BETWEEN ? AND ?", start_date, end_date)
      }
      
      datetime_columns.each do |c|
        scope_name = scope_name(c.name)
        make_scope(scope_name, c.name)
      end
    end
    
    private
      def datetime_columns
        columns.select{|c| [:datetime, :date, :time].include? c.type }
      end
      
      def scope_name(field)
        if field.end_with?("_at")
          "#{field.to_s.gsub("_at","")}_between"
        elsif field.end_with?("_on")
          "#{field.to_s.gsub("_on","")}_between"
        else
          "#{field.to_s}_between"
        end
      end
      
      def make_scope(scope_name, field)
        scope scope_name, lambda{ |start_date, end_date|
          where("#{field} BETWEEN ? AND ?", start_date, end_date)
        }
      end
  end
end

ActiveRecord::Base.class_eval do
  include Rangetastic
end
