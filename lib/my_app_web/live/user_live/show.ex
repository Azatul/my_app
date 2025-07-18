defmodule MyAppWeb.UserLive.Show do
  use MyAppWeb, :live_view

  alias MyApp.Account

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:user, Account.get_user!(id))}
  end

  defp page_title(:show), do: "Show User"
  defp page_title(:edit), do: "Edit User"
  defp page_title(:bmi_calculator), do: "BMI Calculator"
  defp page_title(:ic_info), do: "IC Info Analyzer"

end
