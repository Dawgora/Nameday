defmodule Namedays do
  use Application

  def start(_type, _args) do
    Namedays.Supervisor.start_link
  end  
end
