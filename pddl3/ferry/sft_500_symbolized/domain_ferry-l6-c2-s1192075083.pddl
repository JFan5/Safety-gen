(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v6)
		(pred_5 ?v7)
		(pred_1 ?v1)
		(pred_3 ?v1)
		(pred_6 ?v7 ?v1)
		(pred_2)
		(pred_4 ?v7))

   (:action op_1
       :parameters  (?v2 ?v5)
       :precondition (and (not-eq ?v2 ?v5) 
                          (pred_1 ?v2) (pred_1 ?v5) (pred_3 ?v2))
       :effect (and  (pred_3 ?v5)
		     (not (pred_3 ?v2))))


   (:action op_2
       :parameters (?v8 ?v3)
       :precondition  (and  (pred_5 ?v8) (pred_1 ?v3)
			    (pred_6 ?v8 ?v3) (pred_3 ?v3) (pred_2))
       :effect (and (pred_4 ?v8)
		    (not (pred_6 ?v8 ?v3)) 
		    (not (pred_2))))

   (:action op_3
       :parameters  (?v8  ?v3)
       :precondition  (and  (pred_5 ?v8) (pred_1 ?v3)
			    (pred_4 ?v8) (pred_3 ?v3))
       :effect (and (pred_6 ?v8 ?v3)
		    (pred_2)
		    (not (pred_4 ?v8)))))
