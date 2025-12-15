(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v6)
		(pred_5 ?v7)
		(pred_1 ?v2)
		(pred_6 ?v2)
		(pred_3 ?v7 ?v2)
		(pred_4)
		(pred_2 ?v7))

   (:action op_1
       :parameters  (?v5 ?v1)
       :precondition (and (not-eq ?v5 ?v1) 
                          (pred_1 ?v5) (pred_1 ?v1) (pred_6 ?v5))
       :effect (and  (pred_6 ?v1)
		     (not (pred_6 ?v5))))


   (:action op_3
       :parameters (?v4 ?v3)
       :precondition  (and  (pred_5 ?v4) (pred_1 ?v3)
			    (pred_3 ?v4 ?v3) (pred_6 ?v3) (pred_4))
       :effect (and (pred_2 ?v4)
		    (not (pred_3 ?v4 ?v3)) 
		    (not (pred_4))))

   (:action op_2
       :parameters  (?v4  ?v3)
       :precondition  (and  (pred_5 ?v4) (pred_1 ?v3)
			    (pred_2 ?v4) (pred_6 ?v3))
       :effect (and (pred_3 ?v4 ?v3)
		    (pred_4)
		    (not (pred_2 ?v4)))))
