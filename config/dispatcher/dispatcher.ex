defmodule Dispatcher do
  use Matcher

  define_accept_types [
    html: [ "text/html", "application/xhtml+html" ],
    json: [ "application/json", "application/vnd.api+json" ],
  ]

  @any %{}
  @json %{ accept: %{ json: true } }

  match "/emails/*path", @any do
    Proxy.forward conn, path, "http://cache/emails/"
  end

  match "/subscribe/*path", @any do
    Proxy.forward conn, path, "http://live-update-notifier/subscribe/"
  end

  match "/subscriptions/*path", @any do
    Proxy.forward conn, path, "http://live-update-notifier/subscriptions/"
  end

  match "_", %{ last_call: true } do
    send_resp( conn, 404, "Route not found.  See config/dispatcher.ex" )
  end

end