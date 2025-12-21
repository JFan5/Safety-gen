(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v8)
		(pred_2 ?v5)
		(pred_6 ?v2)
		(pred_3 ?v2)
		(pred_1 ?v5 ?v2)
		(pred_4)
		(pred_5 ?v5))

   (:action op_1
       :parameters  (?v1 ?v3)
       :precondition (and (not-eq ?v1 ?v3) 
                          (pred_6 ?v1) (pred_6 ?v3) (pred_3 ?v1))
       :effect (and  (pred_3 ?v3)
		     (not (pred_3 ?v1))))


   (:action op_2
       :parameters (?v7 ?v4)
       :precondition  (and  (pred_2 ?v7) (pred_6 ?v4)
			    (pred_1 ?v7 ?v4) (pred_3 ?v4) (pred_4))
       :effect (and (pred_5 ?v7)
		    (not (pred_1 ?v7 ?v4)) 
		    (not (pred_4))))

   (:action op_3
       :parameters  (?v7  ?v4)
       :precondition  (and  (pred_2 ?v7) (pred_6 ?v4)
			    (pred_5 ?v7) (pred_3 ?v4))
       :effect (and (pred_1 ?v7 ?v4)
		    (pred_4)
		    (not (pred_5 ?v7)))))
