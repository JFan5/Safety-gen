(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v7 ?v6)
		(pred_1 ?v3)
		(pred_3 ?v4)
		(pred_6 ?v4)
		(pred_4 ?v3 ?v4)
		(pred_5)
		(pred_2 ?v3))

   (:action op_3
       :parameters  (?v5 ?v1)
       :precondition (and (not-eq ?v5 ?v1) 
                          (pred_3 ?v5) (pred_3 ?v1) (pred_6 ?v5))
       :effect (and  (pred_6 ?v1)
		     (not (pred_6 ?v5))))


   (:action op_1
       :parameters (?v8 ?v2)
       :precondition  (and  (pred_1 ?v8) (pred_3 ?v2)
			    (pred_4 ?v8 ?v2) (pred_6 ?v2) (pred_5))
       :effect (and (pred_2 ?v8)
		    (not (pred_4 ?v8 ?v2)) 
		    (not (pred_5))))

   (:action op_2
       :parameters  (?v8  ?v2)
       :precondition  (and  (pred_1 ?v8) (pred_3 ?v2)
			    (pred_2 ?v8) (pred_6 ?v2))
       :effect (and (pred_4 ?v8 ?v2)
		    (pred_5)
		    (not (pred_2 ?v8)))))
