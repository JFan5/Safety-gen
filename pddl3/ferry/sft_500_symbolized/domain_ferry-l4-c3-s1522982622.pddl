(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v7 ?v6)
		(pred_4 ?v4)
		(pred_1 ?v5)
		(pred_3 ?v5)
		(pred_2 ?v4 ?v5)
		(pred_5)
		(pred_6 ?v4))

   (:action op_1
       :parameters  (?v2 ?v3)
       :precondition (and (not-eq ?v2 ?v3) 
                          (pred_1 ?v2) (pred_1 ?v3) (pred_3 ?v2))
       :effect (and  (pred_3 ?v3)
		     (not (pred_3 ?v2))))


   (:action op_2
       :parameters (?v1 ?v8)
       :precondition  (and  (pred_4 ?v1) (pred_1 ?v8)
			    (pred_2 ?v1 ?v8) (pred_3 ?v8) (pred_5))
       :effect (and (pred_6 ?v1)
		    (not (pred_2 ?v1 ?v8)) 
		    (not (pred_5))))

   (:action op_3
       :parameters  (?v1  ?v8)
       :precondition  (and  (pred_4 ?v1) (pred_1 ?v8)
			    (pred_6 ?v1) (pred_3 ?v8))
       :effect (and (pred_2 ?v1 ?v8)
		    (pred_5)
		    (not (pred_6 ?v1)))))
