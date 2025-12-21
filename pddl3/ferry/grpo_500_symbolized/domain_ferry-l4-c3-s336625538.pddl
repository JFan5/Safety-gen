(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v7 ?v8)
		(pred_4 ?v2)
		(pred_1 ?v1)
		(pred_6 ?v1)
		(pred_3 ?v2 ?v1)
		(pred_5)
		(pred_2 ?v2))

   (:action op_1
       :parameters  (?v6 ?v5)
       :precondition (and (not-eq ?v6 ?v5) 
                          (pred_1 ?v6) (pred_1 ?v5) (pred_6 ?v6))
       :effect (and  (pred_6 ?v5)
		     (not (pred_6 ?v6))))


   (:action op_2
       :parameters (?v3 ?v4)
       :precondition  (and  (pred_4 ?v3) (pred_1 ?v4)
			    (pred_3 ?v3 ?v4) (pred_6 ?v4) (pred_5))
       :effect (and (pred_2 ?v3)
		    (not (pred_3 ?v3 ?v4)) 
		    (not (pred_5))))

   (:action op_3
       :parameters  (?v3  ?v4)
       :precondition  (and  (pred_4 ?v3) (pred_1 ?v4)
			    (pred_2 ?v3) (pred_6 ?v4))
       :effect (and (pred_3 ?v3 ?v4)
		    (pred_5)
		    (not (pred_2 ?v3)))))
