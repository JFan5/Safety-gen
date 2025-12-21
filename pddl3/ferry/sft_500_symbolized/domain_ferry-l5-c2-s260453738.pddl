(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v8)
		(pred_6 ?v1)
		(pred_4 ?v6)
		(pred_5 ?v6)
		(pred_1 ?v1 ?v6)
		(pred_2)
		(pred_3 ?v1))

   (:action op_2
       :parameters  (?v5 ?v3)
       :precondition (and (not-eq ?v5 ?v3) 
                          (pred_4 ?v5) (pred_4 ?v3) (pred_5 ?v5))
       :effect (and  (pred_5 ?v3)
		     (not (pred_5 ?v5))))


   (:action op_1
       :parameters (?v7 ?v2)
       :precondition  (and  (pred_6 ?v7) (pred_4 ?v2)
			    (pred_1 ?v7 ?v2) (pred_5 ?v2) (pred_2))
       :effect (and (pred_3 ?v7)
		    (not (pred_1 ?v7 ?v2)) 
		    (not (pred_2))))

   (:action op_3
       :parameters  (?v7  ?v2)
       :precondition  (and  (pred_6 ?v7) (pred_4 ?v2)
			    (pred_3 ?v7) (pred_5 ?v2))
       :effect (and (pred_1 ?v7 ?v2)
		    (pred_2)
		    (not (pred_3 ?v7)))))
