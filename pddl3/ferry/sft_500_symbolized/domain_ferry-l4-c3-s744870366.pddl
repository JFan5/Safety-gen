(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v1)
		(pred_6 ?v6)
		(pred_5 ?v3)
		(pred_3 ?v3)
		(pred_1 ?v6 ?v3)
		(pred_2)
		(pred_4 ?v6))

   (:action op_1
       :parameters  (?v5 ?v4)
       :precondition (and (not-eq ?v5 ?v4) 
                          (pred_5 ?v5) (pred_5 ?v4) (pred_3 ?v5))
       :effect (and  (pred_3 ?v4)
		     (not (pred_3 ?v5))))


   (:action op_2
       :parameters (?v7 ?v2)
       :precondition  (and  (pred_6 ?v7) (pred_5 ?v2)
			    (pred_1 ?v7 ?v2) (pred_3 ?v2) (pred_2))
       :effect (and (pred_4 ?v7)
		    (not (pred_1 ?v7 ?v2)) 
		    (not (pred_2))))

   (:action op_3
       :parameters  (?v7  ?v2)
       :precondition  (and  (pred_6 ?v7) (pred_5 ?v2)
			    (pred_4 ?v7) (pred_3 ?v2))
       :effect (and (pred_1 ?v7 ?v2)
		    (pred_2)
		    (not (pred_4 ?v7)))))
