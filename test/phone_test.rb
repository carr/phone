require File.expand_path(File.dirname(__FILE__) + '/test_helper')

class PhoneTest < Test::Unit::TestCase
  
  def test_number_without_country_code_initialize    
    Phone.default_country_code = nil
    
    assert_raise RuntimeError do
      pn = Phone.new '5125486', '91'
    end
  end
  
  def test_number_without_country_and_area_code_initialize    
    Phone.default_country_code = nil
    Phone.default_area_code = nil    
    
    assert_raise RuntimeError do
      pn = Phone.new '451588'
    end
  end  
  
  def test_number_with_default_area_code_initialize    
    Phone.default_country_code = '385'
    Phone.default_area_code = '47'    
    
    pn = Phone.new '451588'
    assert pn.number == '451588'
    assert pn.area_code == '47'    
    assert pn.country_code == '385' 
  end    
  
  def test_number_with_default_country_code_initialize
    Phone.default_country_code = '386'
    
    pn = Phone.new '5125486', '91'
    assert pn.number == '5125486'
    assert pn.area_code == '91'    
    assert pn.country_code == '386'    
  end  
  
  def test_number_with_country_code_initialize
    Phone.default_country_code = '387'
    
    pn = Phone.new '5125486', '91', '385'
    assert pn.number == '5125486'
    assert pn.area_code == '91'
    assert pn.country_code == '385'
  end  
  
  def test_parse_empty
    assert_equal Phone.parse(''), nil
    assert_equal Phone.parse(nil), nil
  end
  
  def test_parse_short_without_special_characters_without_country
    Phone.default_country_code = nil
     
    assert_raise RuntimeError do   
      pn = Phone.parse "0915125486"
    end
  end  
  
  def test_parse_short_with_special_characters_without_country
    Phone.default_country_code = nil
        
    assert_raise RuntimeError do
      pn = Phone.parse "091/512-5486"
    end
  end
  
  def test_to_s
    Phone.default_country_code = nil    
    pn = Phone.new '5125486', '91', '385'
    assert pn.to_s == '+385915125486'
  end  
  
  def test_to_s_without_country_code
    Phone.default_country_code = '385'   
    pn = Phone.new '5125486', '91'
    assert pn.format("0%a%n") == '0915125486'
  end
  
  def test_format_special_with_country_code
    Phone.default_country_code = nil    
    pn = Phone.new '5125486', '91', '385'
    assert pn.format("+ %c (%a) %n") == '+ 385 (91) 5125486'
  end  
  
  def test_format_special_without_country_code
    Phone.default_country_code = '385'    
    pn = Phone.new '5125486', '91'
    assert_equal pn.format("%A/%f-%l"), '091/512-5486'
  end  
  
  def test_format_with_symbol_specifier
    Phone.default_country_code = nil    
    pn = Phone.new '5125486', '91', '385'
    assert_equal pn.format(:europe), '+385 (0) 91 512 5486'
  end    
  
  def test_doesnt_validate
    assert_equal Phone.valid?('asdas'), false
    assert_equal Phone.valid?('385915125486'), false
  end
  
end
