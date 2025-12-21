(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v2)
		(pred_1 ?v8)
		(pred_3 ?v5)
		(pred_4 ?v5)
		(pred_5 ?v8 ?v5)
		(pred_6)
		(pred_2 ?v8))

   (:action op_2
       :parameters  (?v4 ?v3)
       :precondition (and (not-eq ?v4 ?v3) 
                          (pred_3 ?v4) (pred_3 ?v3) (pred_4 ?v4))
       :effect (and  (pred_4 ?v3)
		     (not (pred_4 ?v4))))


   (:action op_3
       :parameters (?v7 ?v6)
       :precondition  (and  (pred_1 ?v7) (pred_3 ?v6)
			    (pred_5 ?v7 ?v6) (pred_4 ?v6) (pred_6))
       :effect (and (pred_2 ?v7)
		    (not (pred_5 ?v7 ?v6)) 
		    (not (pred_6))))

   (:action op_1
       :parameters  (?v7  ?v6)
       :precondition  (and  (pred_1 ?v7) (pred_3 ?v6)
			    (pred_2 ?v7) (pred_4 ?v6))
       :effect (and (pred_5 ?v7 ?v6)
		    (pred_6)
		    (not (pred_2 ?v7)))))
