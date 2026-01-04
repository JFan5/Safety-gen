(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v4)
		(pred_1 ?v1)
		(pred_3 ?v7)
		(pred_6 ?v7)
		(pred_5 ?v1 ?v7)
		(pred_2)
		(pred_4 ?v1))

   (:action op_1
       :parameters  (?v6 ?v3)
       :precondition (and (not-eq ?v6 ?v3) 
                          (pred_3 ?v6) (pred_3 ?v3) (pred_6 ?v6))
       :effect (and  (pred_6 ?v3)
		     (not (pred_6 ?v6))))


   (:action op_3
       :parameters (?v5 ?v8)
       :precondition  (and  (pred_1 ?v5) (pred_3 ?v8)
			    (pred_5 ?v5 ?v8) (pred_6 ?v8) (pred_2))
       :effect (and (pred_4 ?v5)
		    (not (pred_5 ?v5 ?v8)) 
		    (not (pred_2))))

   (:action op_2
       :parameters  (?v5  ?v8)
       :precondition  (and  (pred_1 ?v5) (pred_3 ?v8)
			    (pred_4 ?v5) (pred_6 ?v8))
       :effect (and (pred_5 ?v5 ?v8)
		    (pred_2)
		    (not (pred_4 ?v5)))))
