(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v7)
		(pred_2 ?v5)
		(pred_6 ?v1)
		(pred_5 ?v1)
		(pred_1 ?v5 ?v1)
		(pred_3)
		(pred_4 ?v5))

   (:action op_2
       :parameters  (?v3 ?v4)
       :precondition (and (not-eq ?v3 ?v4) 
                          (pred_6 ?v3) (pred_6 ?v4) (pred_5 ?v3))
       :effect (and  (pred_5 ?v4)
		     (not (pred_5 ?v3))))


   (:action op_3
       :parameters (?v8 ?v2)
       :precondition  (and  (pred_2 ?v8) (pred_6 ?v2)
			    (pred_1 ?v8 ?v2) (pred_5 ?v2) (pred_3))
       :effect (and (pred_4 ?v8)
		    (not (pred_1 ?v8 ?v2)) 
		    (not (pred_3))))

   (:action op_1
       :parameters  (?v8  ?v2)
       :precondition  (and  (pred_2 ?v8) (pred_6 ?v2)
			    (pred_4 ?v8) (pred_5 ?v2))
       :effect (and (pred_1 ?v8 ?v2)
		    (pred_3)
		    (not (pred_4 ?v8)))))
