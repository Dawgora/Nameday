defmodule NamedaysTest do
  use ExUnit.Case
  use Timex
  alias Namedays.Nameday.Store

  test "returns my nameday" do
    names = Store.get_names("01-22")
    assert names == ["Austris"]
  end

end
