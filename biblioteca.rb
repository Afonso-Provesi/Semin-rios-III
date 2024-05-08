class Livro
    attr_accessor :titulo,:autor
    attr_reader :disponivel

    def initialize(titulo, autor)
        @titulo = titulo
        @autor = autor
        @disponivel = true
    end

    def mostrar
        p "#{@titulo}, #{@autor} - #{@disponivel}"
    end
    
    def emprestar
        @disponivel = false
    end

    def devolver
        @disponivel = true
    end

end

class Biblioteca
    attr_accessor :catalogo

    def initialize
        @catalogo = []
    end

    def adicionar_livro(livro)
        @catalogo << livro
        p "livro adicionado no catalogo"
    end

    def listar_livros
        @catalogo.each do |livro|
            status = livro.disponivel ? "disponivel" : "emprestado"
            p "#{livro.titulo}, #{livro.autor} - #{status}"
        end
    end

    def emprestar(titulo)
        #buscar os livros
        livro = @catalogo.find {|livro|livro.titulo == titulo && livro.disponivel}
        if livro
            livro.emprestar
        else
            p "emprestado"
        end
        
    end

    def devolver(titulo)
        livro = @catalogo.find {|livro|livro.titulo == titulo && !livro.disponivel}
        if livro
            livro.devolver
        else
            p "devolvido"
        end
    end

end

livro1 = Livro.new("Tolkien", "sda")
livro2 = Livro.new("Al", "Ruby")

biblioteca = Biblioteca.new
biblioteca.adicionar_livro(livro1)
biblioteca.adicionar_livro(livro2)

biblioteca.listar_livros
biblioteca.emprestar("Al")
biblioteca.listar_livros
biblioteca.devolver("Al")
biblioteca.listar_livros