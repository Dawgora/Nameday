defmodule NamedaysTest do
  use ExUnit.Case
  use Timex
  alias Namedays.Nameday.Store

  test "returns my nameday" do
    names = Store.get_names("01-22")
    assert names == ["Austris"]
  end

  test "returns date by name" do
    date = Store.get_by_name("Austris")
    assert date == "01-22"
  end  

end
