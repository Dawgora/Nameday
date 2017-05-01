defmodule Namedays.Supervisor do
    use Supervisor

    def start_link do
      Supervisor.start_link(__MODULE__, [])
    end  

    def init ([]) do
      children = [
        supervisor(Namedays.Nameday.Supervisor,[])
      ]

      supervise(children, strategy: :one_for_all)
    end  
end  
