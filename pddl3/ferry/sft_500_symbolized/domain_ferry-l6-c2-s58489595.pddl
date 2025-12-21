(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v6)
		(pred_3 ?v7)
		(pred_5 ?v2)
		(pred_2 ?v2)
		(pred_6 ?v7 ?v2)
		(pred_1)
		(pred_4 ?v7))

   (:action op_3
       :parameters  (?v4 ?v3)
       :precondition (and (not-eq ?v4 ?v3) 
                          (pred_5 ?v4) (pred_5 ?v3) (pred_2 ?v4))
       :effect (and  (pred_2 ?v3)
		     (not (pred_2 ?v4))))


   (:action op_1
       :parameters (?v1 ?v8)
       :precondition  (and  (pred_3 ?v1) (pred_5 ?v8)
			    (pred_6 ?v1 ?v8) (pred_2 ?v8) (pred_1))
       :effect (and (pred_4 ?v1)
		    (not (pred_6 ?v1 ?v8)) 
		    (not (pred_1))))

   (:action op_2
       :parameters  (?v1  ?v8)
       :precondition  (and  (pred_3 ?v1) (pred_5 ?v8)
			    (pred_4 ?v1) (pred_2 ?v8))
       :effect (and (pred_6 ?v1 ?v8)
		    (pred_1)
		    (not (pred_4 ?v1)))))
