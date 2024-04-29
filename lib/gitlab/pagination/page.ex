defmodule Gitlab.Pagination.Page do
  @moduledoc """
  Pagination information for a page.

  If the number of resources is more than 10,000, `total`, `total_pages` and `link.last` will be `nil`.
  """

  alias Gitlab.Pagination
  alias Gitlab.Pagination.Link

  defstruct link: nil,
            page: nil,
            next_page: nil,
            prev_page: nil,
            per_page: nil,
            total: nil,
            total_pages: nil,
            transform: nil

  def from_parts(link, parts, transform) do
    parts =
      Enum.filter(parts, fn {_, value} ->
        is_binary(value) and value != ""
      end)

    %__MODULE__{
      link: link,
      page: get_part(parts, :page),
      next_page: get_part(parts, :next_page),
      prev_page: get_part(parts, :prev_page),
      per_page: get_part(parts, :per_page),
      total: get_part(parts, :total),
      total_pages: get_part(parts, :total_pages),
      transform: transform
    }
  end

  defp get_part(parts, key) do
    case Keyword.get(parts, key) do
      nil ->
        nil

      part ->
        String.to_integer(part)
    end
  end
end
