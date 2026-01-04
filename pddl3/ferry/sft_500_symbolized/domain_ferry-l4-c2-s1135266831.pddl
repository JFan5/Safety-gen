(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v4)
		(pred_5 ?v3)
		(pred_6 ?v7)
		(pred_2 ?v7)
		(pred_3 ?v3 ?v7)
		(pred_1)
		(pred_4 ?v3))

   (:action op_2
       :parameters  (?v2 ?v5)
       :precondition (and (not-eq ?v2 ?v5) 
                          (pred_6 ?v2) (pred_6 ?v5) (pred_2 ?v2))
       :effect (and  (pred_2 ?v5)
		     (not (pred_2 ?v2))))


   (:action op_3
       :parameters (?v1 ?v8)
       :precondition  (and  (pred_5 ?v1) (pred_6 ?v8)
			    (pred_3 ?v1 ?v8) (pred_2 ?v8) (pred_1))
       :effect (and (pred_4 ?v1)
		    (not (pred_3 ?v1 ?v8)) 
		    (not (pred_1))))

   (:action op_1
       :parameters  (?v1  ?v8)
       :precondition  (and  (pred_5 ?v1) (pred_6 ?v8)
			    (pred_4 ?v1) (pred_2 ?v8))
       :effect (and (pred_3 ?v1 ?v8)
		    (pred_1)
		    (not (pred_4 ?v1)))))
