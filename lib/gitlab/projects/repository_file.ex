defmodule Gitlab.Projects.RepositoryFile do
  alias Gitlab.Endpoint

  @behaviour Endpoint

  defstruct file_name: nil,
            file_path: nil,
            size: nil,
            encoding: nil,
            content: nil,
            content_sha256: nil,
            ref: nil,
            blob_id: nil,
            commit_id: nil,
            last_commit_id: nil

  @impl Endpoint
  def endpoint_name() do
    "repository/files"
  end

  def encode_file_path(path) do
    URI.encode_www_form(path)
  end
end
