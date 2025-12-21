(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v4)
		(pred_6 ?v7)
		(pred_3 ?v1)
		(pred_4 ?v1)
		(pred_1 ?v7 ?v1)
		(pred_2)
		(pred_5 ?v7))

   (:action op_1
       :parameters  (?v3 ?v5)
       :precondition (and (not-eq ?v3 ?v5) 
                          (pred_3 ?v3) (pred_3 ?v5) (pred_4 ?v3))
       :effect (and  (pred_4 ?v5)
		     (not (pred_4 ?v3))))


   (:action op_2
       :parameters (?v8 ?v2)
       :precondition  (and  (pred_6 ?v8) (pred_3 ?v2)
			    (pred_1 ?v8 ?v2) (pred_4 ?v2) (pred_2))
       :effect (and (pred_5 ?v8)
		    (not (pred_1 ?v8 ?v2)) 
		    (not (pred_2))))

   (:action op_3
       :parameters  (?v8  ?v2)
       :precondition  (and  (pred_6 ?v8) (pred_3 ?v2)
			    (pred_5 ?v8) (pred_4 ?v2))
       :effect (and (pred_1 ?v8 ?v2)
		    (pred_2)
		    (not (pred_5 ?v8)))))
