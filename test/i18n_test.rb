require 'test/helper'

class I18nTest < Test::Unit::TestCase
  context "Attachment size validator with message symbol" do
    setup do
      rebuild_model
      
      Dummy.class_eval do
        validates_attachment_size :avatar, :message => :attachment_size_invalid
      end
      
      @dummy = Dummy.new
    end

    should "not raise exception while validating" do
       assert_nothing_raised do
         @dummy.valid?
       end
    end
  end
  
  context "Attachment size validator with message string" do
    setup do
      rebuild_model
      
      Dummy.class_eval do
        validates_attachment_size :avatar, :message => "attachment size invalid"
      end
      
      @dummy = Dummy.new
    end

    should "not raise exception while validating" do
       assert_nothing_raised do
         @dummy.valid?
       end
    end
  end
end

