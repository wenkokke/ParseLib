package parselib.examples;

import parselib.examples.Arith.TExpr;
import frege.prelude.PreludeBase.TMaybe;
import frege.prelude.PreludeBase.TMaybe.DJust;
import frege.runtime.Lazy;

import static parselib.examples.Arith.parse;

public final class JArith {

	public static void main(String[] args) {
		
    // some simple demonstrations
    ppExpr("(+ 1 3)");
    ppExpr("(* -5 2)");
    ppExpr("(* (+ 10 4) (* 3 8))");
    
    // some junk that won't parse
    ppExpr("(+)");
    ppExpr("(+ a)");
    ppExpr("(1 2 3)");
	}
  
  public static final void ppExpr(String expr) {
    System.out.printf("runParser %-20s -> %s\n", expr, show(fromJust(parse(expr))));
  }
	
	public static final String show(TExpr expr) {
		return (expr == null) ? "no parse" : Arith.IShow_Expr.show(expr);
	}
	
	public static final TExpr fromJust(TMaybe maybe) {
		final DJust dJust = maybe.<TMaybe> forced()._Just();
		return (dJust == null) ? null : ((Lazy) dJust.mem1).<TExpr> forced();
	}

}
