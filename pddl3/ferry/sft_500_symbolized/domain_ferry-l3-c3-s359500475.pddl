(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v8)
		(pred_4 ?v7)
		(pred_1 ?v1)
		(pred_5 ?v1)
		(pred_3 ?v7 ?v1)
		(pred_2)
		(pred_6 ?v7))

   (:action op_2
       :parameters  (?v6 ?v5)
       :precondition (and (not-eq ?v6 ?v5) 
                          (pred_1 ?v6) (pred_1 ?v5) (pred_5 ?v6))
       :effect (and  (pred_5 ?v5)
		     (not (pred_5 ?v6))))


   (:action op_3
       :parameters (?v4 ?v2)
       :precondition  (and  (pred_4 ?v4) (pred_1 ?v2)
			    (pred_3 ?v4 ?v2) (pred_5 ?v2) (pred_2))
       :effect (and (pred_6 ?v4)
		    (not (pred_3 ?v4 ?v2)) 
		    (not (pred_2))))

   (:action op_1
       :parameters  (?v4  ?v2)
       :precondition  (and  (pred_4 ?v4) (pred_1 ?v2)
			    (pred_6 ?v4) (pred_5 ?v2))
       :effect (and (pred_3 ?v4 ?v2)
		    (pred_2)
		    (not (pred_6 ?v4)))))
