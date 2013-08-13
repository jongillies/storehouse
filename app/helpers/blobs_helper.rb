module BlobsHelper

  def pretty_json(object)
    begin
      JSON.pretty_generate(JSON.parse(object))
    rescue Exception => e
      e.message
    end
  end
end
