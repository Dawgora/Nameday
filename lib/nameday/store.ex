defmodule Namedays.Nameday.Store do
  use GenServer, Timex
  alias Namedays.Nameday.DataParser

  def start_link do
    GenServer.start_link(__MODULE__, %{}, name: :nameday_store)
  end 

  def init(_) do
    {:ok, DataParser.get_data}
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
