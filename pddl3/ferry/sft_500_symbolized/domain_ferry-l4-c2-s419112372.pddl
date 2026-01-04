(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v5)
		(pred_2 ?v3)
		(pred_4 ?v6)
		(pred_6 ?v6)
		(pred_5 ?v3 ?v6)
		(pred_3)
		(pred_1 ?v3))

   (:action op_1
       :parameters  (?v4 ?v1)
       :precondition (and (not-eq ?v4 ?v1) 
                          (pred_4 ?v4) (pred_4 ?v1) (pred_6 ?v4))
       :effect (and  (pred_6 ?v1)
		     (not (pred_6 ?v4))))


   (:action op_2
       :parameters (?v7 ?v2)
       :precondition  (and  (pred_2 ?v7) (pred_4 ?v2)
			    (pred_5 ?v7 ?v2) (pred_6 ?v2) (pred_3))
       :effect (and (pred_1 ?v7)
		    (not (pred_5 ?v7 ?v2)) 
		    (not (pred_3))))

   (:action op_3
       :parameters  (?v7  ?v2)
       :precondition  (and  (pred_2 ?v7) (pred_4 ?v2)
			    (pred_1 ?v7) (pred_6 ?v2))
       :effect (and (pred_5 ?v7 ?v2)
		    (pred_3)
		    (not (pred_1 ?v7)))))
