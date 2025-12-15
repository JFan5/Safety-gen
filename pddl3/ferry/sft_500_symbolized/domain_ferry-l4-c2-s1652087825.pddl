(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v7 ?v4)
		(pred_1 ?v5)
		(pred_5 ?v8)
		(pred_2 ?v8)
		(pred_4 ?v5 ?v8)
		(pred_3)
		(pred_6 ?v5))

   (:action op_3
       :parameters  (?v6 ?v1)
       :precondition (and (not-eq ?v6 ?v1) 
                          (pred_5 ?v6) (pred_5 ?v1) (pred_2 ?v6))
       :effect (and  (pred_2 ?v1)
		     (not (pred_2 ?v6))))


   (:action op_1
       :parameters (?v3 ?v2)
       :precondition  (and  (pred_1 ?v3) (pred_5 ?v2)
			    (pred_4 ?v3 ?v2) (pred_2 ?v2) (pred_3))
       :effect (and (pred_6 ?v3)
		    (not (pred_4 ?v3 ?v2)) 
		    (not (pred_3))))

   (:action op_2
       :parameters  (?v3  ?v2)
       :precondition  (and  (pred_1 ?v3) (pred_5 ?v2)
			    (pred_6 ?v3) (pred_2 ?v2))
       :effect (and (pred_4 ?v3 ?v2)
		    (pred_3)
		    (not (pred_6 ?v3)))))
