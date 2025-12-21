(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v7 ?v8)
		(pred_5 ?v2)
		(pred_1 ?v3)
		(pred_2 ?v3)
		(pred_3 ?v2 ?v3)
		(pred_6)
		(pred_4 ?v2))

   (:action op_2
       :parameters  (?v4 ?v6)
       :precondition (and (not-eq ?v4 ?v6) 
                          (pred_1 ?v4) (pred_1 ?v6) (pred_2 ?v4))
       :effect (and  (pred_2 ?v6)
		     (not (pred_2 ?v4))))


   (:action op_3
       :parameters (?v1 ?v5)
       :precondition  (and  (pred_5 ?v1) (pred_1 ?v5)
			    (pred_3 ?v1 ?v5) (pred_2 ?v5) (pred_6))
       :effect (and (pred_4 ?v1)
		    (not (pred_3 ?v1 ?v5)) 
		    (not (pred_6))))

   (:action op_1
       :parameters  (?v1  ?v5)
       :precondition  (and  (pred_5 ?v1) (pred_1 ?v5)
			    (pred_4 ?v1) (pred_2 ?v5))
       :effect (and (pred_3 ?v1 ?v5)
		    (pred_6)
		    (not (pred_4 ?v1)))))
