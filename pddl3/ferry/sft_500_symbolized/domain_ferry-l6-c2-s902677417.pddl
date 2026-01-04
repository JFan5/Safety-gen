(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v6)
		(pred_6 ?v7)
		(pred_3 ?v1)
		(pred_4 ?v1)
		(pred_2 ?v7 ?v1)
		(pred_5)
		(pred_1 ?v7))

   (:action op_2
       :parameters  (?v4 ?v5)
       :precondition (and (not-eq ?v4 ?v5) 
                          (pred_3 ?v4) (pred_3 ?v5) (pred_4 ?v4))
       :effect (and  (pred_4 ?v5)
		     (not (pred_4 ?v4))))


   (:action op_3
       :parameters (?v2 ?v3)
       :precondition  (and  (pred_6 ?v2) (pred_3 ?v3)
			    (pred_2 ?v2 ?v3) (pred_4 ?v3) (pred_5))
       :effect (and (pred_1 ?v2)
		    (not (pred_2 ?v2 ?v3)) 
		    (not (pred_5))))

   (:action op_1
       :parameters  (?v2  ?v3)
       :precondition  (and  (pred_6 ?v2) (pred_3 ?v3)
			    (pred_1 ?v2) (pred_4 ?v3))
       :effect (and (pred_2 ?v2 ?v3)
		    (pred_5)
		    (not (pred_1 ?v2)))))
