defmodule Gitlab.Issues.NewIssue do
  defstruct title: nil,
            description: nil,
            confidential: nil,
            assignee_ids: nil,
            milestone_id: nil,
            labels: nil,
            created_at: nil,
            due_date: nil,
            weight: nil

  # field :merge_request_to_resolve_discussions_of, integer()
  # field :discussion_to_resolve: String.t()

  defimpl Jason.Encoder, for: __MODULE__ do
    def encode(value, opts) do
      Jason.Encode.map(Map.drop(value, [:__struct__]), opts)
    end
  end
end
