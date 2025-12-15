(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v7 ?v5)
		(pred_1 ?v2)
		(pred_2 ?v1)
		(pred_3 ?v1)
		(pred_5 ?v2 ?v1)
		(pred_4)
		(pred_6 ?v2))

   (:action op_2
       :parameters  (?v6 ?v8)
       :precondition (and (not-eq ?v6 ?v8) 
                          (pred_2 ?v6) (pred_2 ?v8) (pred_3 ?v6))
       :effect (and  (pred_3 ?v8)
		     (not (pred_3 ?v6))))


   (:action op_3
       :parameters (?v4 ?v3)
       :precondition  (and  (pred_1 ?v4) (pred_2 ?v3)
			    (pred_5 ?v4 ?v3) (pred_3 ?v3) (pred_4))
       :effect (and (pred_6 ?v4)
		    (not (pred_5 ?v4 ?v3)) 
		    (not (pred_4))))

   (:action op_1
       :parameters  (?v4  ?v3)
       :precondition  (and  (pred_1 ?v4) (pred_2 ?v3)
			    (pred_6 ?v4) (pred_3 ?v3))
       :effect (and (pred_5 ?v4 ?v3)
		    (pred_4)
		    (not (pred_6 ?v4)))))
