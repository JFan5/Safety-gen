(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v5)
		(pred_2 ?v6)
		(pred_5 ?v1)
		(pred_6 ?v1)
		(pred_4 ?v6 ?v1)
		(pred_1)
		(pred_3 ?v6))

   (:action op_1
       :parameters  (?v4 ?v8)
       :precondition (and (not-eq ?v4 ?v8) 
                          (pred_5 ?v4) (pred_5 ?v8) (pred_6 ?v4))
       :effect (and  (pred_6 ?v8)
		     (not (pred_6 ?v4))))


   (:action op_3
       :parameters (?v7 ?v2)
       :precondition  (and  (pred_2 ?v7) (pred_5 ?v2)
			    (pred_4 ?v7 ?v2) (pred_6 ?v2) (pred_1))
       :effect (and (pred_3 ?v7)
		    (not (pred_4 ?v7 ?v2)) 
		    (not (pred_1))))

   (:action op_2
       :parameters  (?v7  ?v2)
       :precondition  (and  (pred_2 ?v7) (pred_5 ?v2)
			    (pred_3 ?v7) (pred_6 ?v2))
       :effect (and (pred_4 ?v7 ?v2)
		    (pred_1)
		    (not (pred_3 ?v7)))))
