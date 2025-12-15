(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v7 ?v8)
		(pred_3 ?v2)
		(pred_4 ?v1)
		(pred_2 ?v1)
		(pred_1 ?v2 ?v1)
		(pred_5)
		(pred_6 ?v2))

   (:action op_1
       :parameters  (?v6 ?v4)
       :precondition (and (not-eq ?v6 ?v4) 
                          (pred_4 ?v6) (pred_4 ?v4) (pred_2 ?v6))
       :effect (and  (pred_2 ?v4)
		     (not (pred_2 ?v6))))


   (:action op_3
       :parameters (?v3 ?v5)
       :precondition  (and  (pred_3 ?v3) (pred_4 ?v5)
			    (pred_1 ?v3 ?v5) (pred_2 ?v5) (pred_5))
       :effect (and (pred_6 ?v3)
		    (not (pred_1 ?v3 ?v5)) 
		    (not (pred_5))))

   (:action op_2
       :parameters  (?v3  ?v5)
       :precondition  (and  (pred_3 ?v3) (pred_4 ?v5)
			    (pred_6 ?v3) (pred_2 ?v5))
       :effect (and (pred_1 ?v3 ?v5)
		    (pred_5)
		    (not (pred_6 ?v3)))))
