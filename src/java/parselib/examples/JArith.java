package parselib.examples;

import parselib.examples.Arith.TExpr;
import frege.prelude.PreludeBase.TMaybe;
import frege.prelude.PreludeBase.TMaybe.DJust;
import frege.runtime.Lazy;

public final class JArith {

	
	/**
	 * Output looks as follows.
	 * <pre>
	 * Add (Num 1) (Num 3)
	 * Mul (Add (Num 10) (Num 4)) (Mul (Num 3) (Num 8))
	 * no parse
	 * no parse
	 * </pre?
	 */
	public static void main(String[] args) {
		
    // some simple demonstrations
    show(parse("(+ 1 3)"));
    show(parse("(* -5 2)"));
		show(parse("(* (+ 10 4) (* 3 8))"));
    
    // some junk that won't parse
		show(parse("(+)"));
		show(parse("(+ a)"));
    show(parse("(1 2 3)"));
	}
	
	public static final TExpr parse(String input) {
		return fromJust(Arith.parse(input));
	}
	
	public static final void show(TExpr expr) {
		System.out.println((expr == null) ? "no parse" : Arith.IShow_Expr.show(expr));
	}
	
	public static final <R> R fromJust(TMaybe maybe) {
		final DJust dJust = maybe.<TMaybe> forced()._Just();
		return (dJust == null) ? null : ((Lazy) dJust.mem1).<R> forced();
	}

}
