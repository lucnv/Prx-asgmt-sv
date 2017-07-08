class ValidateBranchXmlData
  prepend SimpleCommand

  # fill it after
  XSD_SCHEMA_FILE_PATH = ""

  def initialize file_path
    @file_path = file_path
  end

  def call
    validate_file_extension && validate_against_schema
  end

  private
  attr_reader :file_path
  def validate_xml_file
    validate_file_extension && validate_against_schema
  end

  def validate_file_extension
    if File.extname(file_path) == ".xml"
      true
    else
      errors.add :validate_xml_file, "file extension is invalid, it is must be .xmlreload!"
      false
    end
  end

  def validate_against_schema
    xsd = Nokogiri::XML::Schema File.read(XSD_SCHEMA_FILE_PATH)
    doc = Nokogiri::XML File.read(file_path)
    if xsd.valid? doc
      true
    else
      errors.add :validate_xml_file, "not valid when validate against schema"
      false
    end
  end
end
