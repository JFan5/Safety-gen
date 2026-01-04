(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v6)
		(pred_3 ?v2)
		(pred_2 ?v7)
		(pred_5 ?v7)
		(pred_4 ?v2 ?v7)
		(pred_1)
		(pred_6 ?v2))

   (:action op_1
       :parameters  (?v4 ?v5)
       :precondition (and (not-eq ?v4 ?v5) 
                          (pred_2 ?v4) (pred_2 ?v5) (pred_5 ?v4))
       :effect (and  (pred_5 ?v5)
		     (not (pred_5 ?v4))))


   (:action op_2
       :parameters (?v8 ?v1)
       :precondition  (and  (pred_3 ?v8) (pred_2 ?v1)
			    (pred_4 ?v8 ?v1) (pred_5 ?v1) (pred_1))
       :effect (and (pred_6 ?v8)
		    (not (pred_4 ?v8 ?v1)) 
		    (not (pred_1))))

   (:action op_3
       :parameters  (?v8  ?v1)
       :precondition  (and  (pred_3 ?v8) (pred_2 ?v1)
			    (pred_6 ?v8) (pred_5 ?v1))
       :effect (and (pred_4 ?v8 ?v1)
		    (pred_1)
		    (not (pred_6 ?v8)))))
