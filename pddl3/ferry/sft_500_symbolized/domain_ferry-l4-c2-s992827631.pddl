(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v7)
		(pred_5 ?v6)
		(pred_3 ?v2)
		(pred_1 ?v2)
		(pred_6 ?v6 ?v2)
		(pred_4)
		(pred_2 ?v6))

   (:action op_2
       :parameters  (?v4 ?v8)
       :precondition (and (not-eq ?v4 ?v8) 
                          (pred_3 ?v4) (pred_3 ?v8) (pred_1 ?v4))
       :effect (and  (pred_1 ?v8)
		     (not (pred_1 ?v4))))


   (:action op_3
       :parameters (?v3 ?v1)
       :precondition  (and  (pred_5 ?v3) (pred_3 ?v1)
			    (pred_6 ?v3 ?v1) (pred_1 ?v1) (pred_4))
       :effect (and (pred_2 ?v3)
		    (not (pred_6 ?v3 ?v1)) 
		    (not (pred_4))))

   (:action op_1
       :parameters  (?v3  ?v1)
       :precondition  (and  (pred_5 ?v3) (pred_3 ?v1)
			    (pred_2 ?v3) (pred_1 ?v1))
       :effect (and (pred_6 ?v3 ?v1)
		    (pred_4)
		    (not (pred_2 ?v3)))))
