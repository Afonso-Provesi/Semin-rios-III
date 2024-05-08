class Carro
    attr_accessor :modelo,:marca
    attr_reader :disponivel

    def initialize(modelo, marca)
        @modelo = modelo
        @marca = marca
        @disponivel = true
    end

    def mostrar
        p "#{@modelo}, #{@marca} - #{@disponivel}"
    end
    
    def alugar
        @disponivel = false
    end

    def devolver
        @disponivel = true
    end

end

class Concecionaria
    attr_accessor :catalogo

    def initialize
        @catalogo = []
    end

    def adicionar_carro(carro)
        @catalogo << carro
        p "carro adicionado no catalogo"
    end

    def listar_carros
        @catalogo.each do |carro|
            status = carro.disponivel ? "disponivel" : "alugado"
            p "#{carro.modelo}, #{carro.marca} - #{status}"
        end
    end

    def alugar(modelo,locadouro)
        carro = @catalogo.find {|carro|carro.modelo == modelo && carro.disponivel}
        if carro
            carro.alugar
            p "pessoa que alugou: #{locadouro}"
        else
            p "emprestado"
        end
        
    end

    def devolver(modelo)
        carro = @catalogo.find {|carro|carro.modelo == modelo && !carro.disponivel}
        if carro
            carro.devolver
        else
            p "devolvido"
        end
    end

end

p "Nome do contratante do serviço"
locadouro = gets.chomp

p "Qual modelo de carro voce deseja ?"
modelo = gets.chomp

carro1 = Carro.new("Cayenne", "Porsche")
carro2 = Carro.new("Rampage", "RAM")

concecionaria = Concecionaria.new
concecionaria.adicionar_carro(carro1)
concecionaria.adicionar_carro(carro2)

concecionaria.listar_carros
concecionaria.alugar(modelo,locadouro)
concecionaria.listar_carros

p "deseja devolver algum carro ?"
n = gets.chomp
if n == "sim"
    concecionaria.devolver(modelo)
    concecionaria.listar_carros
else
    concecionaria.listar_carros
end
# concecionaria.devolver(modelo)
# concecionaria.listar_carros