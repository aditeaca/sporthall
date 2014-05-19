require_relative '../test_helper'
require_relative '../../app/models/hall'

class HallTest < ActiveSupport::TestCase

	def test_import_size	# Testing if there is an increase in the database elements after an import
		blen = Hall.all.size
		f = File.new('.\test\unit\test.xls')
		Hall.import(f)
		f.close
		alen = Hall.all.size
		assert_not_equal(alen,blen,"The database hasn't changed after the import")
	end
		
	def test_import_name	# Testing if the import is valid: does it have an name?
		f = File.new('.\test\unit\test.xls')
		Hall.import(f)
		f.close
		a = Hall.first.nume
		b = ""
		assert_not_equal(a,b,"The imported facility doesn't have a name.")
	end
	
	def test_import_type	# Testing if the import is valid: does it have a type?
		f = File.new('.\test\unit\test.xls')
		Hall.import(f)
		f.close
		a = Hall.first.tipul
		b = ""
		assert_not_equal(a,b,"The imported facility doesn't have a specified type.")
	end
	
	def test_import_postcode	# Testing if the import is valid: does it have a postcode?
		f = File.new('.\test\unit\test.xls')
		Hall.import(f)
		f.close
		a = Hall.first.postcode
		b = "No postcode"
		assert_not_equal(a,b,"The imported facility doesn't have a postcode.")
	end
	
	def test_import_image	# Testing if the import is valid: does it have an image?
		f = File.new('.\test\unit\test.xls')
		Hall.import(f)
		f.close
		a = Hall.first.poza
		b = "No image"
		assert_not_equal(a,b,"The imported facility doesn't have an image.")
	end
	
	def test_db	# Testing if the database isn't empty.
		dblen = Hall.all.size
		assert_not_equal(dblen,0,"The database doesn't read any facilities in it")
	end

  # test "the truth" do
  #   assert true
  # end
  
end
