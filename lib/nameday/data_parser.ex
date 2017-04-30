defmodule Namedays.Nameday.DataParser do
  use HTTPoison.Base
  @nameday_link "https://gist.githubusercontent.com/laacz/5cccb056a533dffb2165/raw/559d66104537b029e6a4ac489d7b5f68bd5ab384/namedays.json"

  def process_url(url) do
    @nameday_link <> url
  end
  
  def process_response_body(body) do
    body
    |> Poison.decode!
    |> Enum.map(fn({k, v}) -> {String.to_atom(k), v} end)
  end  

  def get_data() do
    {_,data}= get("")
    data.body()
  end  
end  
