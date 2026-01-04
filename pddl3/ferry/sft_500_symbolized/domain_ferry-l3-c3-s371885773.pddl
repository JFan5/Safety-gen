(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v6)
		(pred_6 ?v1)
		(pred_5 ?v7)
		(pred_4 ?v7)
		(pred_3 ?v1 ?v7)
		(pred_2)
		(pred_1 ?v1))

   (:action op_2
       :parameters  (?v5 ?v8)
       :precondition (and (not-eq ?v5 ?v8) 
                          (pred_5 ?v5) (pred_5 ?v8) (pred_4 ?v5))
       :effect (and  (pred_4 ?v8)
		     (not (pred_4 ?v5))))


   (:action op_3
       :parameters (?v2 ?v3)
       :precondition  (and  (pred_6 ?v2) (pred_5 ?v3)
			    (pred_3 ?v2 ?v3) (pred_4 ?v3) (pred_2))
       :effect (and (pred_1 ?v2)
		    (not (pred_3 ?v2 ?v3)) 
		    (not (pred_2))))

   (:action op_1
       :parameters  (?v2  ?v3)
       :precondition  (and  (pred_6 ?v2) (pred_5 ?v3)
			    (pred_1 ?v2) (pred_4 ?v3))
       :effect (and (pred_3 ?v2 ?v3)
		    (pred_2)
		    (not (pred_1 ?v2)))))
