defmodule Specimen.PageController do
  use Specimen.Web, :controller

  def index(conn, _params) do
    user = %Specimen.User{}
    perms = %{user: [:normal_login]}

    # OK
    Guardian.Plug.sign_in(conn, user, :token)
    Guardian.Plug.sign_in(conn, user, :token, %{})


    # NG
    Guardian.Plug.sign_in(conn, user, :token, [])
    Guardian.Plug.sign_in(conn, user, :token, perms: perms)

    render conn, "index.html"
  end

end
