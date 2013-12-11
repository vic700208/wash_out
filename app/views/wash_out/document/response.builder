xml.instruct!
xml.tag! "soap:Envelope", "xmlns:soap" => 'http://schemas.xmlsoap.org/soap/envelope/',
                          "xmlns:xsd" => 'http://www.w3.org/2001/XMLSchema',
                          "xmlns:tns" => @namespace do
  xml.tag! "soap:Body" do
    key = "tns:#{@operation}#{controller.soap_config.camelize_wsdl ? 'Response' : '_response'}"
    attr_proc = @action_spec[:response_attr]
    attributes = attr_proc.call if attr_proc

    xml.tag! @action_spec[:response_tag] || key, attributes do
      wsdl_data xml, result
    end
  end
end
