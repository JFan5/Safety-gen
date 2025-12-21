(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v7 ?v5)
		(pred_1 ?v8)
		(pred_3 ?v1)
		(pred_2 ?v1)
		(pred_5 ?v8 ?v1)
		(pred_4)
		(pred_6 ?v8))

   (:action op_2
       :parameters  (?v4 ?v3)
       :precondition (and (not-eq ?v4 ?v3) 
                          (pred_3 ?v4) (pred_3 ?v3) (pred_2 ?v4))
       :effect (and  (pred_2 ?v3)
		     (not (pred_2 ?v4))))


   (:action op_3
       :parameters (?v6 ?v2)
       :precondition  (and  (pred_1 ?v6) (pred_3 ?v2)
			    (pred_5 ?v6 ?v2) (pred_2 ?v2) (pred_4))
       :effect (and (pred_6 ?v6)
		    (not (pred_5 ?v6 ?v2)) 
		    (not (pred_4))))

   (:action op_1
       :parameters  (?v6  ?v2)
       :precondition  (and  (pred_1 ?v6) (pred_3 ?v2)
			    (pred_6 ?v6) (pred_2 ?v2))
       :effect (and (pred_5 ?v6 ?v2)
		    (pred_4)
		    (not (pred_6 ?v6)))))
