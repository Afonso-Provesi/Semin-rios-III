array_soma = []
while(0==0)
    p "N?"
    n = gets.chomp.to_i
    break if n == 0
    array_soma << n
end

p "digite a operacao. + - soma; - - subtracao; x - multiplicacao; / - divisao"
op = gets.chomp

case op
when "+"
    p array_soma.inject(:+)

when "-"
    p array_soma.inject(:-)

when "x"
    p array_soma.inject(:*)

when "/"
    if array_soma == 0
        p "nao e possivel fazer a operacao"
    
    else
        p array_soma.inject(:/)

    end

else
    p "operacao invalida"
end
#soma = 0
#array_soma.each do |numero|
#    soma += numero
#end
#p soma

#p array_soma.inject(:+)

#p array_soma.sum