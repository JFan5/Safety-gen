(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v8)
		(pred_6 ?v7)
		(pred_2 ?v6)
		(pred_1 ?v6)
		(pred_4 ?v7 ?v6)
		(pred_5)
		(pred_3 ?v7))

   (:action op_2
       :parameters  (?v5 ?v3)
       :precondition (and (not-eq ?v5 ?v3) 
                          (pred_2 ?v5) (pred_2 ?v3) (pred_1 ?v5))
       :effect (and  (pred_1 ?v3)
		     (not (pred_1 ?v5))))


   (:action op_1
       :parameters (?v4 ?v2)
       :precondition  (and  (pred_6 ?v4) (pred_2 ?v2)
			    (pred_4 ?v4 ?v2) (pred_1 ?v2) (pred_5))
       :effect (and (pred_3 ?v4)
		    (not (pred_4 ?v4 ?v2)) 
		    (not (pred_5))))

   (:action op_3
       :parameters  (?v4  ?v2)
       :precondition  (and  (pred_6 ?v4) (pred_2 ?v2)
			    (pred_3 ?v4) (pred_1 ?v2))
       :effect (and (pred_4 ?v4 ?v2)
		    (pred_5)
		    (not (pred_3 ?v4)))))
