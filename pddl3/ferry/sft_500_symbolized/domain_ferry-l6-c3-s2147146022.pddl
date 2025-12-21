(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v1)
		(pred_6 ?v8)
		(pred_3 ?v4)
		(pred_2 ?v4)
		(pred_5 ?v8 ?v4)
		(pred_4)
		(pred_1 ?v8))

   (:action op_1
       :parameters  (?v5 ?v3)
       :precondition (and (not-eq ?v5 ?v3) 
                          (pred_3 ?v5) (pred_3 ?v3) (pred_2 ?v5))
       :effect (and  (pred_2 ?v3)
		     (not (pred_2 ?v5))))


   (:action op_3
       :parameters (?v7 ?v2)
       :precondition  (and  (pred_6 ?v7) (pred_3 ?v2)
			    (pred_5 ?v7 ?v2) (pred_2 ?v2) (pred_4))
       :effect (and (pred_1 ?v7)
		    (not (pred_5 ?v7 ?v2)) 
		    (not (pred_4))))

   (:action op_2
       :parameters  (?v7  ?v2)
       :precondition  (and  (pred_6 ?v7) (pred_3 ?v2)
			    (pred_1 ?v7) (pred_2 ?v2))
       :effect (and (pred_5 ?v7 ?v2)
		    (pred_4)
		    (not (pred_1 ?v7)))))
