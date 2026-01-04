(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v7 ?v2)
		(pred_6 ?v6)
		(pred_4 ?v3)
		(pred_5 ?v3)
		(pred_1 ?v6 ?v3)
		(pred_2)
		(pred_3 ?v6))

   (:action op_1
       :parameters  (?v5 ?v4)
       :precondition (and (not-eq ?v5 ?v4) 
                          (pred_4 ?v5) (pred_4 ?v4) (pred_5 ?v5))
       :effect (and  (pred_5 ?v4)
		     (not (pred_5 ?v5))))


   (:action op_3
       :parameters (?v1 ?v8)
       :precondition  (and  (pred_6 ?v1) (pred_4 ?v8)
			    (pred_1 ?v1 ?v8) (pred_5 ?v8) (pred_2))
       :effect (and (pred_3 ?v1)
		    (not (pred_1 ?v1 ?v8)) 
		    (not (pred_2))))

   (:action op_2
       :parameters  (?v1  ?v8)
       :precondition  (and  (pred_6 ?v1) (pred_4 ?v8)
			    (pred_3 ?v1) (pred_5 ?v8))
       :effect (and (pred_1 ?v1 ?v8)
		    (pred_2)
		    (not (pred_3 ?v1)))))
