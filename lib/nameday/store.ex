defmodule Namedays.Nameday.Store do
  use GenServer, Timex
  alias Namedays.Nameday.DataParser

  @nameday_link "https://gist.githubusercontent.com/laacz/5cccb056a533dffb2165/raw/559d66104537b029e6a4ac489d7b5f68bd5ab384/namedays.json"
  #@nameday_extended "https://gist.githubusercontent.com/laacz/5cccb056a533dffb2165/raw/559d66104537b029e6a4ac489d7b5f68bd5ab384/namedays-extended.json"

  def start_link do
    GenServer.start_link(__MODULE__, %{}, name: :nameday_store)
  end 

  def init(_) do
    #data = Enum.concat(DataParser.get_data(@nameday_link), DataParser.get_data(@nameday_extended) )
    data = DataParser.get_data(@nameday_link)
    {:ok, data}
  end  

  def get_names(name) do
    GenServer.call(:nameday_store, {:get_namedays, name})
  end  

  def get_today_nameday do
    date = Timex.now("Europe/Riga") 
    {_, date} = Timex.format(date, "%m-%d", :strftime)
    GenServer.call(:nameday_store, {:get_namedays, date})
  end  

  def handle_call({:get_namedays, name}, _from, nameday_list) do
    names = nameday_list[String.to_atom(name)]
    {:reply, names, nameday_list}
  end  

end  
