(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v1)
		(pred_4 ?v6)
		(pred_5 ?v4)
		(pred_6 ?v4)
		(pred_1 ?v6 ?v4)
		(pred_2)
		(pred_3 ?v6))

   (:action op_3
       :parameters  (?v7 ?v8)
       :precondition (and (not-eq ?v7 ?v8) 
                          (pred_5 ?v7) (pred_5 ?v8) (pred_6 ?v7))
       :effect (and  (pred_6 ?v8)
		     (not (pred_6 ?v7))))


   (:action op_1
       :parameters (?v5 ?v3)
       :precondition  (and  (pred_4 ?v5) (pred_5 ?v3)
			    (pred_1 ?v5 ?v3) (pred_6 ?v3) (pred_2))
       :effect (and (pred_3 ?v5)
		    (not (pred_1 ?v5 ?v3)) 
		    (not (pred_2))))

   (:action op_2
       :parameters  (?v5  ?v3)
       :precondition  (and  (pred_4 ?v5) (pred_5 ?v3)
			    (pred_3 ?v5) (pred_6 ?v3))
       :effect (and (pred_1 ?v5 ?v3)
		    (pred_2)
		    (not (pred_3 ?v5)))))
