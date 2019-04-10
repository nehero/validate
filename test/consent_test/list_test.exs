defmodule ConsentTest.List do
  use ExUnit.Case
  alias Consent.List
  doctest Consent.List

  test "returns error when input is not present" do
    input = %{}

    rules = %{
      "cities" => [&List.list/1]
    }

    assert Consent.validate(input, rules) == {:error, %{"cities" => "not a list"}}
  end

  test "returns error when input is an int" do
    input = %{
      "cities" => 123
    }

    rules = %{
      "cities" => [&List.list/1]
    }

    assert Consent.validate(input, rules) == {:error, %{"cities" => "not a list"}}
  end

  test "returns error when input is a map" do
    input = %{
      "cities" => %{"key" => "value"}
    }

    rules = %{
      "cities" => [&List.list/1]
    }

    assert Consent.validate(input, rules) == {:error, %{"cities" => "not a list"}}
  end

  test "returns error when input is a string" do
    input = %{
      "cities" => "123"
    }

    rules = %{
      "cities" => [&List.list/1]
    }

    assert Consent.validate(input, rules) == {:error, %{"cities" => "not a list"}}
  end

  test "returns ok when input is a string" do
    input = %{
      "cities" => ["saskatoon", "regina"]
    }

    rules = %{
      "cities" => [&List.list/1]
    }

    assert Consent.validate(input, rules) == {:ok, %{"cities" => ["saskatoon", "regina"]}}
  end
end
