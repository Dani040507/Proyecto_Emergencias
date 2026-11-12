defmodule Emergencias.ConsolaTest do
  use ExUnit.Case

  alias Emergencias.Consola

  test "devuelve un error cuando el archivo del guion no existe" do
    ruta = Path.join(System.tmp_dir!(), "guion_inexistente_12345.txt")

    assert {:error, _razon} = Consola.ejecutar_guion(ruta)
  end
end
