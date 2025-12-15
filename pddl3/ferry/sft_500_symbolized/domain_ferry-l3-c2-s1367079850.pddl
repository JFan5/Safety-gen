(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v3)
		(pred_3 ?v8)
		(pred_1 ?v6)
		(pred_4 ?v6)
		(pred_2 ?v8 ?v6)
		(pred_5)
		(pred_6 ?v8))

   (:action op_3
       :parameters  (?v4 ?v1)
       :precondition (and (not-eq ?v4 ?v1) 
                          (pred_1 ?v4) (pred_1 ?v1) (pred_4 ?v4))
       :effect (and  (pred_4 ?v1)
		     (not (pred_4 ?v4))))


   (:action op_1
       :parameters (?v7 ?v2)
       :precondition  (and  (pred_3 ?v7) (pred_1 ?v2)
			    (pred_2 ?v7 ?v2) (pred_4 ?v2) (pred_5))
       :effect (and (pred_6 ?v7)
		    (not (pred_2 ?v7 ?v2)) 
		    (not (pred_5))))

   (:action op_2
       :parameters  (?v7  ?v2)
       :precondition  (and  (pred_3 ?v7) (pred_1 ?v2)
			    (pred_6 ?v7) (pred_4 ?v2))
       :effect (and (pred_2 ?v7 ?v2)
		    (pred_5)
		    (not (pred_6 ?v7)))))
