(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v1)
		(pred_1 ?v5)
		(pred_6 ?v7)
		(pred_3 ?v7)
		(pred_5 ?v5 ?v7)
		(pred_4)
		(pred_2 ?v5))

   (:action op_2
       :parameters  (?v4 ?v3)
       :precondition (and (not-eq ?v4 ?v3) 
                          (pred_6 ?v4) (pred_6 ?v3) (pred_3 ?v4))
       :effect (and  (pred_3 ?v3)
		     (not (pred_3 ?v4))))


   (:action op_3
       :parameters (?v8 ?v2)
       :precondition  (and  (pred_1 ?v8) (pred_6 ?v2)
			    (pred_5 ?v8 ?v2) (pred_3 ?v2) (pred_4))
       :effect (and (pred_2 ?v8)
		    (not (pred_5 ?v8 ?v2)) 
		    (not (pred_4))))

   (:action op_1
       :parameters  (?v8  ?v2)
       :precondition  (and  (pred_1 ?v8) (pred_6 ?v2)
			    (pred_2 ?v8) (pred_3 ?v2))
       :effect (and (pred_5 ?v8 ?v2)
		    (pred_4)
		    (not (pred_2 ?v8)))))
