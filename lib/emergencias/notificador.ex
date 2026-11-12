defmodule Emergencias.Notificador do
  @moduledoc """
  Avisa que los datos cambiaron, para que la interfaz web se actualice al
  instante (también cuando el cambio se hizo desde la consola o desde un
  cliente en otro nodo).

  El núcleo no depende de la web: si Phoenix.PubSub no está en ejecución
  (por ejemplo, en un nodo cliente iniciado con --no-start) no hace nada.
  """

  @servidor Emergencias.PubSub
  @tema "cambios"

  def tema, do: @tema

  def notificar do
    if Process.whereis(@servidor) do
      Phoenix.PubSub.broadcast(@servidor, @tema, :datos_actualizados)
    end

    :ok
  end
end
