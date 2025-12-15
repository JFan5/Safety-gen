(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v1)
		(pred_6 ?v6)
		(pred_3 ?v5)
		(pred_5 ?v5)
		(pred_1 ?v6 ?v5)
		(pred_2)
		(pred_4 ?v6))

   (:action op_3
       :parameters  (?v4 ?v7)
       :precondition (and (not-eq ?v4 ?v7) 
                          (pred_3 ?v4) (pred_3 ?v7) (pred_5 ?v4))
       :effect (and  (pred_5 ?v7)
		     (not (pred_5 ?v4))))


   (:action op_2
       :parameters (?v3 ?v8)
       :precondition  (and  (pred_6 ?v3) (pred_3 ?v8)
			    (pred_1 ?v3 ?v8) (pred_5 ?v8) (pred_2))
       :effect (and (pred_4 ?v3)
		    (not (pred_1 ?v3 ?v8)) 
		    (not (pred_2))))

   (:action op_1
       :parameters  (?v3  ?v8)
       :precondition  (and  (pred_6 ?v3) (pred_3 ?v8)
			    (pred_4 ?v3) (pred_5 ?v8))
       :effect (and (pred_1 ?v3 ?v8)
		    (pred_2)
		    (not (pred_4 ?v3)))))
