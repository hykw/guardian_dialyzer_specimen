defmodule Specimen.PageController do
  use Specimen.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
