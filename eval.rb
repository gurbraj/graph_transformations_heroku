

string="x**2"

eval(string.gsub(/x/,'2'))



string="x**2"
string="Math.sin(x)"

def string_to_jax(string)

   transform=string.gsub(/**/,'^').gsub(/Math./,'').gsub(/[/]/,'\over')

   "\(f(x)=" + transform +  "\)"
end





   When $a \ne 0$, there are two solutions to \(f(x)=ax^2 + bx + c = 0\) and they are
   $$x = {-b \pm \sqrt{b^2-4ac} \over 2a}.$$

   '\[a \ne 0\]'
   output:
   `$$a \ne 0$$`


# string_to_jax javascript       ###

var string_to_jax=function(string){

return "\\(f(x)=" + string.replace("**","^").replace("/","\\over").replace("Math.", "") +"\\)"

}
####modifying algebraic expression
current_value=$('#algebraic_expression').html()
$('#algebraic_expression').html("")
$('#algebraic_expression').html(current_value.replace("2 * (x)^2","4* (x)^2"))
MathJax.Hub.Typeset()
https://docs.mathjax.org/en/v2.5-latest/typeset.html


#############here i will put dead code
#
#function that is meant to be used to update mathjax
var update_algebraic_expression=function(a) {

  current_content=$('#algebraic_expression').html();
  //$('#algebraic_expression').empty();

  // updated_algebraic_expression2="<%=@model_function.name%>".replace("f", a + "*"+ "f");
  // updated_algebraic_expression="<%=@model_function.name%>".replace("<%=@model_function.name%>"  ,a + "* ["+"<%=@model_function.name%>"+ "]" );

  replacee_raw=string_to_jax("<%=@model_function.name%>")

  replacee=replacee_raw.substring(7, replacee_raw.length-2)
  //console.log("replacee_raw " + replacee_raw)
  //console.log("replacee " + replacee)

  updated_content=current_content.replace(replacee, a + "* (" + replacee + ")");

$('#transformed_algebraic_expression').html(updated_content);
  //MathJax.Hub.Typeset();
  MathJax.Hub.Queue(["Typeset",MathJax.Hub,'transformed_algebraic_expression' ]);

  //var math = MathJax.Hub.getAllJax("algebraic_expression");


  //MathJax.Hub.Queue(["Text",math,a + "* (" + replacee + ")"]);
  }

############
  <!-- <p>
  original algebraic expression: <h4 id="algebraic_expression">f(x) = </h4>

  <p>
  transformed algebraic expression: <h3 id="transformed_algebraic_expression"> </h3> -->
##############

###############
  var string_to_jax=function(string){

  return "\\(f(x)=" + string.replace("**","^").replace("/","\\over ").replace("Math.", "") +"\\)"

  }
  ###############
  //var algebraic_expression=string_to_jax("<%=@model_function.name%>");
  //$("#algebraic_expression").append(algebraic_expression);
