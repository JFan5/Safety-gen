(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v8)
		(pred_3 ?v5)
		(pred_5 ?v6)
		(pred_6 ?v6)
		(pred_2 ?v5 ?v6)
		(pred_4)
		(pred_1 ?v5))

   (:action op_2
       :parameters  (?v7 ?v2)
       :precondition (and (not-eq ?v7 ?v2) 
                          (pred_5 ?v7) (pred_5 ?v2) (pred_6 ?v7))
       :effect (and  (pred_6 ?v2)
		     (not (pred_6 ?v7))))


   (:action op_1
       :parameters (?v3 ?v4)
       :precondition  (and  (pred_3 ?v3) (pred_5 ?v4)
			    (pred_2 ?v3 ?v4) (pred_6 ?v4) (pred_4))
       :effect (and (pred_1 ?v3)
		    (not (pred_2 ?v3 ?v4)) 
		    (not (pred_4))))

   (:action op_3
       :parameters  (?v3  ?v4)
       :precondition  (and  (pred_3 ?v3) (pred_5 ?v4)
			    (pred_1 ?v3) (pred_6 ?v4))
       :effect (and (pred_2 ?v3 ?v4)
		    (pred_4)
		    (not (pred_1 ?v3)))))
