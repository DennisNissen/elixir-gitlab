defmodule Gitlab.Notes.Note do
  # alias Gitlab.Notes
  alias Gitlab.Endpoint

  @behaviour Endpoint

  @type id :: integer()

  defstruct id: nil,
            body: nil,
            system: nil,
            resolvable: nil,
            noteable_id: nil,
            noteable_type: nil,
            noteable_iid: nil,
            updated_at: nil,
            created_at: nil

  @impl Endpoint
  def endpoint_name() do
    "notes"
  end

  def parent_scope(note = %__MODULE__{}) do
    case note.notable_type do
      "Issue" -> {Issue, note.notable_iid}
    end
  end

  defimpl Jason.Encoder, for: __MODULE__ do
    def encode(value, opts) do
      Jason.Encode.map(Map.drop(value, [:__struct__]), opts)
    end
  end
end
