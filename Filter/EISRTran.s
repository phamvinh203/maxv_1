<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
    <!ENTITY LockedDate "
if @r is not null begin
  select @locked as message
  return
end
">
  <!ENTITY Error "
if @r is not null begin
  select '' as message, @field as field, @r as record
  return
end
">
]>
<dir table="ct50" code="stt_rec" order="stt_rec"  xmlns="urn:schemas-maxv-com:data-dir">
  <title v="Phiếu nhập hàng bán trả lại" e="Sales Return"></title>
 <fields>
    <field name="stt_rec" readOnly ="true" hidden="true">
      <header v="stt rec" e="stt rec"></header>
    </field>
    <field name="ma_dvcs" readOnly ="true" hidden="true">
      <header v="ma_dvcs" e="ma_dvcs"></header>
    </field>
	
    <field name="ct50gl" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="300" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="EISRDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>
	
  </fields>

  <views>
    <view id="Dir" height="400" anchor="1" >
	 <item value="110, 300, 100, 100, 100, 100, 100, 37, 100, 100, 15, 62, 55, 100, 0, 0"/>
	 
	 <item value="11--------: [ma_dvcs],[stt_rec]"/>
	 <item value="1: [ct50gl]"/>
	 <categories>
        <category index="1" columns="1388" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
      </categories>	

    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7fV8Db63cIL6Wa9pQWQxqQ5c270Lyday4oS85jUTh7MILz7PtlSlgzHpqfpLQ9EtdC+6oFCHdSwXB+fY7U1LofI=</encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7f1h8IuHH30pVWY0Ih8jlSK4GR23//r9+Df1x7Rxvy4fUaWT5nIzqqYkQ+lL+LaUs6TURi0Gn0dfVR8nYIBwr0Y=</encrypted>]]>
      </text>
    </command>
    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>5ku1Z/39BOg6dV256NGYL0iPVp5tM9+b9KEU27SVd8D47tYdPmLcG4kHGwNf4vF7Q65R/jViBYmav4kDK3sDIS0f8ygwkjSSqjuLMrPPixhwZWBDE66vdTl1+3ba2pvla37VEsakCS+OhOstN5k7b2arMM6TIxfQtXP2Xnxt7A9+aqtlZ+nDAcsSqoveCBddrlTmV6mFd4KeVpTz7LYAxhcA5TkzH6E0fwNRIoOOOmGDAwDh/ZUSqyWgiZwOyKlK0TXkzXWuCwKhjkFTdAaDdFgXVjikcziYNFMaJ7mIX8YiRSO8h4LmygfodWzc23Nz9ewLZVlHFFHlCXBJg5bl24npuhZa8heiZLIo/Uq+aluqHeTgiHq+WOFaELjVBCOTH2bG9IdmsUy9Y/qPQ5oTspffnl/+CWm2lcEiBL9fxrV03q2BLnCeHaMYmH/Qs609jNau5zyUwLGr8NwSasSDOZ+wXakApYZgJto0PnBr18eI9i/vkyNBfUZrzn0ncclI9F8yT/6bT5R2baXe8K7XwZ0tsMg6P/aAnhsaoBYHy6/UuMKdVVDBJOhtrU4Ww/fzelE+ArRX2yOjpLhJhZlUu5ox7P/TWHBRPkzSa0PunbY8/1J73IVw9fP5ct1YPdK7TG3Too+WQu/nfopgl/wvml2fiZZ2nz1g9xb5lzqD6IuRBYX4nYt/rIPUkn7wxwzSYjtBPGljaUCyHMesebAzKgbJx5Scn6v7HKQHBaF63YpBZviBi4EcyUf0TinPnCCA/nXL71g4Ny+e+JkyoZJwMSifQM72Mi1nqOe55Kbj0Gf7Um/DkkZ/aLwVERyi9E9RG7O8KdmTa5MsTYa8p0JwJ6+roDLs8VB70E/iF5RI0ast8V+Nql5J+TxfVkqL4636Or6HoT79bKHsdPjLXy1P5YS8Y6IVE+QFnDacV6dRePwoJ2Khd+ST3YadGMC7EOhTH6ykZDUarAKeoMxSmXcAeCgWfbzrPnnrp9LeeIcS7aMwtvp0xWt0aW7yWdguxlCIyrzQwTE1ecUFcKGQ2p3FMlAmu8eqExl8l+FCtXiUTIJzAivOfZ14iBNWcbzp181+LzHPnjWfIaoI4HtClNpIAh6AXcSgceRV9okBUIwz8l38pkT75WtdS77YDCMyWBKElTICzmgrk+gz4TvcrmxKjUVVN/jfccRBSnQ1a59axQkf0vRhC10+qWapyUyQWskwdapIPWNWmN5+x+Rmq7GLQjPr0kLyYLzRrd8EOsi3WmXhCwapCOwXUmbJL19DWik7wRXklMZ+R7cCoDlEs9t31Wgzsq3IC2jigMiG1cXm/NkaiO5YZ1CAWfTchTQz3FN4tVH5B0WW21rX6AjEBdo9AURPUgU+WOvYxLpDKQa4UG5TNlvxaA76gMteKvpc4mrDQGWoG0updxjEpqh/1taAgQiP9KwmSr6cEIRapOcxGEs3+ziq/b6C5DN/evMnrWtmwJPSVHUhKZV0rYSZ3NhFKVWu4ljtPz4/ZOXuops2G8ZfCFtvpU0HJWRs83O4JxMv</encrypted>]]>&LockedDate;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7SSXc7y1oRcLl01Q2YJfqTQyfIdHe3T7sJGpQqRga6nzSY4pieAnZquTBzRrGgY0jrCVKDrtlpU6betvz/OV/YtKF2s35A8bKtHvLj5JKEZZVnQWbXSgu0hpapQVb4ExMMzjSwRwej1EYpm6AxIDAhQ=</encrypted>]]>&LockedDate;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7SSXc7y1oRcLl01Q2YJfqTQyfIdHe3T7sJGpQqRga6nziegGQvvdPwmPZ8tiRoanrC2ulR1RITZewuMzKk7ZpMLH/62tqNDlieaoGELLod34qkI+BJ3fWGM9xuvTqh7TF1Y6Aua6rMZoMbY6R0p+MOc=</encrypted>]]>&LockedDate;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7SSXc7y1oRcLl01Q2YJfqTQyfIdHe3T7sJGpQqRga6nz+FiYehLkzYTnHs0xn78VJsi6eRHXs7WJHUlWsorLJI4WX+vZ59DZr5Hdk/jq1k3+89u9dDuWzYx01Jii4f33SEWUncpwczcNj/0dhp+L/bg=</encrypted>]]>&LockedDate;<![CDATA[<encrypted>xwNBm35eWryFADCIMjpiMeQLDbqlfwYbDQYieplgVlJADAfNJ+fj/cD3F4/YDgXqmpco+4am+LVSdIksfJ55OxC1Nb1kVuL3dtLcgupTfJLDDz1hBtOUae85KedF5NwMyyaNZJM3BCiF2F04YyTl9/5QX0T49Y8L6Hy+IP4SqzrMCy7V0CJdicNXcXrd7Rkz</encrypted>]]>&LockedDate;<![CDATA[<encrypted>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</encrypted>]]>
      </text>
    </command>
	
  </commands>
 <script>
   <text>
     <![CDATA[<encrypted>86GeIvpP8uqde/6k1R4/OTt+PR2iqMTL7YZRk6X3JhqdbamhmKnmf8Rd04ZvdWm/dwSiRiWQnRUcesoyw/5H9+nUBa9R6KGz8ZVWK0QHRuihdjCNB7K+IiJ6Wk4SONf/J4XkQtYLnMLUEYVS+EphYG1cCFw6/X3ciaJK7wf8lcujdL4iH0TO1jkWEe5YGqkBNgfoNTRQxwft9WjiFLAefjQ73P/+XMaFQnAAqjSTbjzQYq7HSE75RH50oDee79JjJpLsPT9jjb0Q+go5d7DWYtamsC35qZorxx77SiTH9nBexhR+fhQz5TxM1lwcb8YN7+/x9QrdUNTbs5byzKZY9IQyLB2o6lMZUfWvyiSJdGjCbdt48EVRqES4SBJsLaJDlDZfzfMFRVihAVHLqO1OBdnX0CVyieE1KlbDTXgfn8Ei7S61wJe5JyGZ9qtdmTOtpOR5P13FN9UsppJAlh2gWVE4GYZxPvnl9G6T6c7s8/nRoO1hynmltX/raBQjAsVPZxvj5FXtz8Fr2cWfQTJQwbtGuDoZ6JVn1sBLyvvbnUwjpwVxe9Y6Q0ZxpRzMCKbXdCjQ3KSolS7DARnd2wS3QR6uYUHcJhcpU6n9E4bd4O0RgdpA07HGk4P2oPQQDhtH2wNhtsYhVx4WmMm6ezpliJSsUpFkZScwzjLlRkSpxqA=</encrypted>]]>
    </text>
  </script>

</dir>


