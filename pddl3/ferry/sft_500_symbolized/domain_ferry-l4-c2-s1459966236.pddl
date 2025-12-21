(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v2)
		(pred_3 ?v3)
		(pred_1 ?v6)
		(pred_6 ?v6)
		(pred_4 ?v3 ?v6)
		(pred_2)
		(pred_5 ?v3))

   (:action op_1
       :parameters  (?v7 ?v8)
       :precondition (and (not-eq ?v7 ?v8) 
                          (pred_1 ?v7) (pred_1 ?v8) (pred_6 ?v7))
       :effect (and  (pred_6 ?v8)
		     (not (pred_6 ?v7))))


   (:action op_2
       :parameters (?v4 ?v5)
       :precondition  (and  (pred_3 ?v4) (pred_1 ?v5)
			    (pred_4 ?v4 ?v5) (pred_6 ?v5) (pred_2))
       :effect (and (pred_5 ?v4)
		    (not (pred_4 ?v4 ?v5)) 
		    (not (pred_2))))

   (:action op_3
       :parameters  (?v4  ?v5)
       :precondition  (and  (pred_3 ?v4) (pred_1 ?v5)
			    (pred_5 ?v4) (pred_6 ?v5))
       :effect (and (pred_4 ?v4 ?v5)
		    (pred_2)
		    (not (pred_5 ?v4)))))
