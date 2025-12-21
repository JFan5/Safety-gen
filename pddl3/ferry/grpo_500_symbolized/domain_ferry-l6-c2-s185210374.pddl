(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v3)
		(pred_2 ?v6)
		(pred_1 ?v1)
		(pred_3 ?v1)
		(pred_4 ?v6 ?v1)
		(pred_6)
		(pred_5 ?v6))

   (:action op_3
       :parameters  (?v4 ?v2)
       :precondition (and (not-eq ?v4 ?v2) 
                          (pred_1 ?v4) (pred_1 ?v2) (pred_3 ?v4))
       :effect (and  (pred_3 ?v2)
		     (not (pred_3 ?v4))))


   (:action op_2
       :parameters (?v7 ?v5)
       :precondition  (and  (pred_2 ?v7) (pred_1 ?v5)
			    (pred_4 ?v7 ?v5) (pred_3 ?v5) (pred_6))
       :effect (and (pred_5 ?v7)
		    (not (pred_4 ?v7 ?v5)) 
		    (not (pred_6))))

   (:action op_1
       :parameters  (?v7  ?v5)
       :precondition  (and  (pred_2 ?v7) (pred_1 ?v5)
			    (pred_5 ?v7) (pred_3 ?v5))
       :effect (and (pred_4 ?v7 ?v5)
		    (pred_6)
		    (not (pred_5 ?v7)))))
