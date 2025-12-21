(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v2)
		(pred_6 ?v7)
		(pred_5 ?v6)
		(pred_4 ?v6)
		(pred_1 ?v7 ?v6)
		(pred_2)
		(pred_3 ?v7))

   (:action op_3
       :parameters  (?v4 ?v5)
       :precondition (and (not-eq ?v4 ?v5) 
                          (pred_5 ?v4) (pred_5 ?v5) (pred_4 ?v4))
       :effect (and  (pred_4 ?v5)
		     (not (pred_4 ?v4))))


   (:action op_1
       :parameters (?v8 ?v1)
       :precondition  (and  (pred_6 ?v8) (pred_5 ?v1)
			    (pred_1 ?v8 ?v1) (pred_4 ?v1) (pred_2))
       :effect (and (pred_3 ?v8)
		    (not (pred_1 ?v8 ?v1)) 
		    (not (pred_2))))

   (:action op_2
       :parameters  (?v8  ?v1)
       :precondition  (and  (pred_6 ?v8) (pred_5 ?v1)
			    (pred_3 ?v8) (pred_4 ?v1))
       :effect (and (pred_1 ?v8 ?v1)
		    (pred_2)
		    (not (pred_3 ?v8)))))
