(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v6)
		(pred_2 ?v5)
		(pred_1 ?v7)
		(pred_5 ?v7)
		(pred_3 ?v5 ?v7)
		(pred_4)
		(pred_6 ?v5))

   (:action op_2
       :parameters  (?v2 ?v8)
       :precondition (and (not-eq ?v2 ?v8) 
                          (pred_1 ?v2) (pred_1 ?v8) (pred_5 ?v2))
       :effect (and  (pred_5 ?v8)
		     (not (pred_5 ?v2))))


   (:action op_1
       :parameters (?v3 ?v1)
       :precondition  (and  (pred_2 ?v3) (pred_1 ?v1)
			    (pred_3 ?v3 ?v1) (pred_5 ?v1) (pred_4))
       :effect (and (pred_6 ?v3)
		    (not (pred_3 ?v3 ?v1)) 
		    (not (pred_4))))

   (:action op_3
       :parameters  (?v3  ?v1)
       :precondition  (and  (pred_2 ?v3) (pred_1 ?v1)
			    (pred_6 ?v3) (pred_5 ?v1))
       :effect (and (pred_3 ?v3 ?v1)
		    (pred_4)
		    (not (pred_6 ?v3)))))
