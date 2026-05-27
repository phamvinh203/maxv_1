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
  <title v="Hóa đơn dịch vụ" e="Service Invoice"></title>
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
      <items style="Grid" controller="EIARDetail" row="1">
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
        <![CDATA[<encrypted>5ku1Z/39BOg6dV256NGYL6Hq3vzOwLq6cNSCHf6M3bXoZsaAVilshOdP6HiMvDrmVXBQWBq7LgPq9mzEU5/C4DsPGgRxYmU7TJFxZCjf9Rqaoj7bEOZI7+YaBx+HjlSp5g7QlutWMVyLO6lXpNP1oQGkFbimuLmx3fjM5jm/A4ngsJmcx8UguPj/d3K9x3stshVHMXoKAO3UjXPakeakLXbkU4EUVrnjU18L/IyxWmENoKaXJoMjDAS+c8eTllZS8mQEhczps0nJFFThaQZYbrdCuTlt0cvqnLE0nBSopNJBTM+nRKDxukv77ZZeUF8S8z1axq0U/eZOkfVTgM4LC6ZEWbxfrXYCB9dEbLzLCUIWfFHiAP39kCSgM7VjeRFfeQwJ2Ujj0JsRFKi4jCzOCWTtADmJgTlmuXaaZq031+HKwGElqSUl7zPwrsnzFUxS/hu6iUgrB5IA+PyVTHb8bg/V6Eo7Xugz0tXJsKuryxVB0sIgDHMVeKz+m6zV3ZZhzvU7HbO0ROXQnNywlLrLp0799StJPqpmzTLLqQdeo2z9hy6eKpiYxYJRZLQdXOCdcE/ee2cyqqzzRNGGTsLsB2a8GPKYPc4AtYG3h0beZVXSknvozm3GPi/x0THYlUZHg85roFFW5mebidHL91s55MlFR+3GNnkWG/ms+CtIVmWkIWkwzZAcLV3Y2sX8X31ut0XaqiyZzS6Y8DFlv1E+Rqs7UKOnhY9c69U8SwsCspcG0kcPCEkdVLQrjp/+r90gbT3hIuzghtlHmIHCmrn2KQEvutnvGQ3fMgmTp+QML3ewSTOJfnNpkPkfYdUwozG9SbkDGmTdt0Vj4AGPsMO3GNkYkyg4JjOISeIHt0SKI4WggPWTMfU9VxGk+Os8fNa699g1nNw1ficn6A+o9Fm9wsvHbF/V66kb7qMNzpOYA8yvqW59CLSalF+3ipKEq/wu2+vd3YhhNc+di6O/wM1UgLUiLlr+VB5617cNa/oYz17mie1khJdr662y3aKW4HICRNA9PmgMV3klXsvDQLuHsCxLn78MtQ7kT4uup8uQFiLUylGhrHdF0F8zS3EEMc3hiK5NVNYlwUBxrqocCIwvjJyHFQr8GJqqbSLCxWDvp/sSkS04pPwGH22BBPKBP3FP+3PMW34l6llSYvs1Qids/RmhBUAVw23C72fXY++cN+/EgX07KHxp0LTTdMfxthJidBYsJvjXS2nKe+5w1WTYb8uuc7H1P8xyxXZvJjoFwV67bLowI/oJgBhkFiwcEvBvUGNTI8OxeqlfeQv2vmhJddiY76KzzXwlGgXSKmPBfCRodprTgXCGYz9CAf7Scko68rnyNwKKQD2cd7kPGScQ3gkDheOQcNkMdFc1PQeAcIkI5dQxDTw2h1DAHfUAv4Oj3kUoRKBGvxsHpiPfv0ArhA==</encrypted>]]>&LockedDate;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7SSXc7y1oRcLl01Q2YJfqTQyfIdHe3T7sJGpQqRga6nzSY4pieAnZquTBzRrGgY0jrCVKDrtlpU6betvz/OV/YtKF2s35A8bKtHvLj5JKEZZVnQWbXSgu0hpapQVb4ExMMzjSwRwej1EYpm6AxIDAhQ=</encrypted>]]>&LockedDate;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7SSXc7y1oRcLl01Q2YJfqTQyfIdHe3T7sJGpQqRga6nz2ouxVfydhGUYLpd54e2lDuGj+OZTQ4fMHnJG5HA9f0j1FhqbxLsV/N08dJpaGc4IFKS1wNk69kxvjcz88ypdHQ==</encrypted>]]>&LockedDate;<![CDATA[<encrypted>91yOMxhMrQH9LIcivhCr7SSXc7y1oRcLl01Q2YJfqTQyfIdHe3T7sJGpQqRga6nz+FiYehLkzYTnHs0xn78VJsi6eRHXs7WJHUlWsorLJI4WX+vZ59DZr5Hdk/jq1k3+89u9dDuWzYx01Jii4f33SEWUncpwczcNj/0dhp+L/bg=</encrypted>]]>&LockedDate;<![CDATA[<encrypted>xwNBm35eWryFADCIMjpiMeQLDbqlfwYbDQYieplgVlJADAfNJ+fj/cD3F4/YDgXqmpco+4am+LVSdIksfJ55OxC1Nb1kVuL3dtLcgupTfJLDDz1hBtOUae85KedF5NwMyyaNZJM3BCiF2F04YyTl9/5QX0T49Y8L6Hy+IP4SqzrMCy7V0CJdicNXcXrd7Rkz</encrypted>]]>&LockedDate;<![CDATA[<encrypted>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</encrypted>]]>
      </text>
    </command>
	
  </commands>
 <script>
   <text>
     <![CDATA[<encrypted>86GeIvpP8uqde/6k1R4/OTt+PR2iqMTL7YZRk6X3JhqdbamhmKnmf8Rd04ZvdWm/dwSiRiWQnRUcesoyw/5H9+nUBa9R6KGz8ZVWK0QHRuihdjCNB7K+IiJ6Wk4SONf/J4XkQtYLnMLUEYVS+EphYG1cCFw6/X3ciaJK7wf8lcujdL4iH0TO1jkWEe5YGqkBNgfoNTRQxwft9WjiFLAefjQ73P/+XMaFQnAAqjSTbjzQYq7HSE75RH50oDee79JjJpLsPT9jjb0Q+go5d7DWYtamsC35qZorxx77SiTH9nBexhR+fhQz5TxM1lwcb8YN7+/x9QrdUNTbs5byzKZY9IQyLB2o6lMZUfWvyiSJdGjCbdt48EVRqES4SBJsLaJDlDZfzfMFRVihAVHLqO1OBdnX0CVyieE1KlbDTXgfn8Ei7S61wJe5JyGZ9qtdmTOtpOR5P13FN9UsppJAlh2gWVE4GYZxPvnl9G6T6c7s8/nRoO1hynmltX/raBQjAsVPZxvj5FXtz8Fr2cWfQTJQwbtGuDoZ6JVn1sBLyvvbnUwjpwVxe9Y6Q0ZxpRzMCKbXdCjQ3KSolS7DARnd2wS3QR6uYUHcJhcpU6n9E4bd4O0RgdpA07HGk4P2oPQQDhtH2wNhtsYhVx4WmMm6ezpliJSsUpFkZScwzjLlRkSpxqA=</encrypted>]]>
    </text>
  </script>

</dir>


