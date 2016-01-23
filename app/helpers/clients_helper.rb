module ClientsHelper
  def total_amount_client_path
    "/clients/#{@client.id}/total_amount_of/"
  end
end
