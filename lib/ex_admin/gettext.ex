defmodule ExAdmin.Gettext do
  # use Gettext, otp_app: :ex_admin

  def gettext(msgid) do
    msgid
  end

  def gettext(msgid, bindings) do
    msgid
    |> String.split(~r/%\{[^\}]+\}/, include_captures: true)
    |> Enum.map(fn s -> case Regex.run(~r/%\{([^\}]+)\}/, s) do
                          nil -> s
                          [_, v] -> bindings[String.to_atom(v)]
                        end
    end)
    |> Enum.join()
  end

  def ngettext(msgid, msgid_plural, n, bindings \\ %{}) do
    case n do
      1 -> gettext(msgid, bindings)
      _ -> gettext(msgid_plural, bindings)
    end
  end
end
