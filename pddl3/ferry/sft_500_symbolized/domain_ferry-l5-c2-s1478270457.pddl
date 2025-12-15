(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v7 ?v3)
		(pred_2 ?v5)
		(pred_5 ?v8)
		(pred_6 ?v8)
		(pred_1 ?v5 ?v8)
		(pred_4)
		(pred_3 ?v5))

   (:action op_2
       :parameters  (?v6 ?v4)
       :precondition (and (not-eq ?v6 ?v4) 
                          (pred_5 ?v6) (pred_5 ?v4) (pred_6 ?v6))
       :effect (and  (pred_6 ?v4)
		     (not (pred_6 ?v6))))


   (:action op_3
       :parameters (?v1 ?v2)
       :precondition  (and  (pred_2 ?v1) (pred_5 ?v2)
			    (pred_1 ?v1 ?v2) (pred_6 ?v2) (pred_4))
       :effect (and (pred_3 ?v1)
		    (not (pred_1 ?v1 ?v2)) 
		    (not (pred_4))))

   (:action op_1
       :parameters  (?v1  ?v2)
       :precondition  (and  (pred_2 ?v1) (pred_5 ?v2)
			    (pred_3 ?v1) (pred_6 ?v2))
       :effect (and (pred_1 ?v1 ?v2)
		    (pred_4)
		    (not (pred_3 ?v1)))))
