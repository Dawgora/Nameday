defmodule Namedays.Nameday.DataParser do
  use HTTPoison.Base

  def process_url(url) do
    url
  end

  def process_response_body(body) do
    body
    |> Poison.decode!
    |> Enum.map(fn({k, v}) -> {String.to_atom(k), v} end)
  end  

  def get_data(link) do
    {_,data}= get(link)
    data.body()
  end  
end  
