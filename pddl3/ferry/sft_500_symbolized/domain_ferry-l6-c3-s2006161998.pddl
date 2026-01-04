(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v2)
		(pred_5 ?v7)
		(pred_4 ?v4)
		(pred_1 ?v4)
		(pred_3 ?v7 ?v4)
		(pred_2)
		(pred_6 ?v7))

   (:action op_1
       :parameters  (?v5 ?v1)
       :precondition (and (not-eq ?v5 ?v1) 
                          (pred_4 ?v5) (pred_4 ?v1) (pred_1 ?v5))
       :effect (and  (pred_1 ?v1)
		     (not (pred_1 ?v5))))


   (:action op_2
       :parameters (?v8 ?v3)
       :precondition  (and  (pred_5 ?v8) (pred_4 ?v3)
			    (pred_3 ?v8 ?v3) (pred_1 ?v3) (pred_2))
       :effect (and (pred_6 ?v8)
		    (not (pred_3 ?v8 ?v3)) 
		    (not (pred_2))))

   (:action op_3
       :parameters  (?v8  ?v3)
       :precondition  (and  (pred_5 ?v8) (pred_4 ?v3)
			    (pred_6 ?v8) (pred_1 ?v3))
       :effect (and (pred_3 ?v8 ?v3)
		    (pred_2)
		    (not (pred_6 ?v8)))))
