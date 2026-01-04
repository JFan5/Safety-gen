(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v7)
		(pred_4 ?v6)
		(pred_5 ?v3)
		(pred_3 ?v3)
		(pred_6 ?v6 ?v3)
		(pred_1)
		(pred_2 ?v6))

   (:action op_3
       :parameters  (?v2 ?v4)
       :precondition (and (not-eq ?v2 ?v4) 
                          (pred_5 ?v2) (pred_5 ?v4) (pred_3 ?v2))
       :effect (and  (pred_3 ?v4)
		     (not (pred_3 ?v2))))


   (:action op_2
       :parameters (?v8 ?v1)
       :precondition  (and  (pred_4 ?v8) (pred_5 ?v1)
			    (pred_6 ?v8 ?v1) (pred_3 ?v1) (pred_1))
       :effect (and (pred_2 ?v8)
		    (not (pred_6 ?v8 ?v1)) 
		    (not (pred_1))))

   (:action op_1
       :parameters  (?v8  ?v1)
       :precondition  (and  (pred_4 ?v8) (pred_5 ?v1)
			    (pred_2 ?v8) (pred_3 ?v1))
       :effect (and (pred_6 ?v8 ?v1)
		    (pred_1)
		    (not (pred_2 ?v8)))))
