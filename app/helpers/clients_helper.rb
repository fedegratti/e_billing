module ClientsHelper
  def total_billed_amount_client_path
    "/clients/#{@client.id}/total_billed_amount_of/"
  end
  def amount_of_bills_path
    "/clients/#{@client.id}/amount_of_bills_in/"
  end
end
