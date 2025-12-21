(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v7)
		(pred_1 ?v5)
		(pred_2 ?v2)
		(pred_5 ?v2)
		(pred_3 ?v5 ?v2)
		(pred_6)
		(pred_4 ?v5))

   (:action op_3
       :parameters  (?v4 ?v6)
       :precondition (and (not-eq ?v4 ?v6) 
                          (pred_2 ?v4) (pred_2 ?v6) (pred_5 ?v4))
       :effect (and  (pred_5 ?v6)
		     (not (pred_5 ?v4))))


   (:action op_2
       :parameters (?v3 ?v1)
       :precondition  (and  (pred_1 ?v3) (pred_2 ?v1)
			    (pred_3 ?v3 ?v1) (pred_5 ?v1) (pred_6))
       :effect (and (pred_4 ?v3)
		    (not (pred_3 ?v3 ?v1)) 
		    (not (pred_6))))

   (:action op_1
       :parameters  (?v3  ?v1)
       :precondition  (and  (pred_1 ?v3) (pred_2 ?v1)
			    (pred_4 ?v3) (pred_5 ?v1))
       :effect (and (pred_3 ?v3 ?v1)
		    (pred_6)
		    (not (pred_4 ?v3)))))
