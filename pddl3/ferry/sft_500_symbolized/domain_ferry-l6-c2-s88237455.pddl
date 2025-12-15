(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v8)
		(pred_1 ?v1)
		(pred_4 ?v2)
		(pred_6 ?v2)
		(pred_5 ?v1 ?v2)
		(pred_2)
		(pred_3 ?v1))

   (:action op_3
       :parameters  (?v6 ?v5)
       :precondition (and (not-eq ?v6 ?v5) 
                          (pred_4 ?v6) (pred_4 ?v5) (pred_6 ?v6))
       :effect (and  (pred_6 ?v5)
		     (not (pred_6 ?v6))))


   (:action op_2
       :parameters (?v7 ?v3)
       :precondition  (and  (pred_1 ?v7) (pred_4 ?v3)
			    (pred_5 ?v7 ?v3) (pred_6 ?v3) (pred_2))
       :effect (and (pred_3 ?v7)
		    (not (pred_5 ?v7 ?v3)) 
		    (not (pred_2))))

   (:action op_1
       :parameters  (?v7  ?v3)
       :precondition  (and  (pred_1 ?v7) (pred_4 ?v3)
			    (pred_3 ?v7) (pred_6 ?v3))
       :effect (and (pred_5 ?v7 ?v3)
		    (pred_2)
		    (not (pred_3 ?v7)))))
