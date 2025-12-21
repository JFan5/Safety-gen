(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v8)
		(pred_5 ?v6)
		(pred_2 ?v1)
		(pred_6 ?v1)
		(pred_1 ?v6 ?v1)
		(pred_4)
		(pred_3 ?v6))

   (:action op_2
       :parameters  (?v7 ?v2)
       :precondition (and (not-eq ?v7 ?v2) 
                          (pred_2 ?v7) (pred_2 ?v2) (pred_6 ?v7))
       :effect (and  (pred_6 ?v2)
		     (not (pred_6 ?v7))))


   (:action op_1
       :parameters (?v4 ?v5)
       :precondition  (and  (pred_5 ?v4) (pred_2 ?v5)
			    (pred_1 ?v4 ?v5) (pred_6 ?v5) (pred_4))
       :effect (and (pred_3 ?v4)
		    (not (pred_1 ?v4 ?v5)) 
		    (not (pred_4))))

   (:action op_3
       :parameters  (?v4  ?v5)
       :precondition  (and  (pred_5 ?v4) (pred_2 ?v5)
			    (pred_3 ?v4) (pred_6 ?v5))
       :effect (and (pred_1 ?v4 ?v5)
		    (pred_4)
		    (not (pred_3 ?v4)))))
