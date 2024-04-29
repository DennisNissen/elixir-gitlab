defmodule Gitlab.Issues.Issue do
  alias Gitlab.Endpoint
  alias Gitlab.Projects.Project

  @type id :: integer()
  @type iid :: integer()

  @behaviour Endpoint

  defstruct id: nil,
            iid: nil,
            project_id: nil,
            description: nil,
            state: nil,
            labels: nil,
            upvotes: nil,
            downvotes: nil,
            merge_requests_count: nil,
            title: nil,
            updated_at: nil,
            created_at: nil,
            closed_at: nil,
            user_notes_count: nil,
            due_date: nil,
            web_url: nil,
            confidential: nil,
            discussion_locked: nil

  @impl Endpoint
  def endpoint_name() do
    "issues"
  end

  def endpoint_scope(issue = %__MODULE__{}) do
    {__MODULE__, endpoint_parent_scope(issue), issue.iid}
  end

  def endpoint_parent_scope(issue = %__MODULE__{}) do
    {Project, issue.project_id}
  end

  defimpl Jason.Encoder, for: __MODULE__ do
    def encode(value, opts) do
      Jason.Encode.map(Map.drop(value, [:__struct__]), opts)
    end
  end
end
