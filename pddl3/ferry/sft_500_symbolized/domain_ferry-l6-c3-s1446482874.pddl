(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v7)
		(pred_5 ?v3)
		(pred_6 ?v2)
		(pred_4 ?v2)
		(pred_2 ?v3 ?v2)
		(pred_1)
		(pred_3 ?v3))

   (:action op_2
       :parameters  (?v1 ?v4)
       :precondition (and (not-eq ?v1 ?v4) 
                          (pred_6 ?v1) (pred_6 ?v4) (pred_4 ?v1))
       :effect (and  (pred_4 ?v4)
		     (not (pred_4 ?v1))))


   (:action op_3
       :parameters (?v5 ?v8)
       :precondition  (and  (pred_5 ?v5) (pred_6 ?v8)
			    (pred_2 ?v5 ?v8) (pred_4 ?v8) (pred_1))
       :effect (and (pred_3 ?v5)
		    (not (pred_2 ?v5 ?v8)) 
		    (not (pred_1))))

   (:action op_1
       :parameters  (?v5  ?v8)
       :precondition  (and  (pred_5 ?v5) (pred_6 ?v8)
			    (pred_3 ?v5) (pred_4 ?v8))
       :effect (and (pred_2 ?v5 ?v8)
		    (pred_1)
		    (not (pred_3 ?v5)))))
