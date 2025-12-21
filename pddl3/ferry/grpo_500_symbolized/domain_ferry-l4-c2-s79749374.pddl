(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v4)
		(pred_6 ?v6)
		(pred_3 ?v1)
		(pred_5 ?v1)
		(pred_4 ?v6 ?v1)
		(pred_2)
		(pred_1 ?v6))

   (:action op_3
       :parameters  (?v7 ?v3)
       :precondition (and (not-eq ?v7 ?v3) 
                          (pred_3 ?v7) (pred_3 ?v3) (pred_5 ?v7))
       :effect (and  (pred_5 ?v3)
		     (not (pred_5 ?v7))))


   (:action op_1
       :parameters (?v5 ?v2)
       :precondition  (and  (pred_6 ?v5) (pred_3 ?v2)
			    (pred_4 ?v5 ?v2) (pred_5 ?v2) (pred_2))
       :effect (and (pred_1 ?v5)
		    (not (pred_4 ?v5 ?v2)) 
		    (not (pred_2))))

   (:action op_2
       :parameters  (?v5  ?v2)
       :precondition  (and  (pred_6 ?v5) (pred_3 ?v2)
			    (pred_1 ?v5) (pred_5 ?v2))
       :effect (and (pred_4 ?v5 ?v2)
		    (pred_2)
		    (not (pred_1 ?v5)))))
