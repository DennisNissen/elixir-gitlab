defmodule Gitlab.Notes.NewNote do
  defstruct body: nil, created_at: nil

  defimpl Jason.Encoder, for: __MODULE__ do
    def encode(value, opts) do
      Jason.Encode.map(Map.drop(value, [:__struct__]), opts)
    end
  end
end
