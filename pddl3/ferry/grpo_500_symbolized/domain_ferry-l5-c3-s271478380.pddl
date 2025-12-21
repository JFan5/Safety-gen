(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v6)
		(pred_3 ?v8)
		(pred_2 ?v7)
		(pred_1 ?v7)
		(pred_5 ?v8 ?v7)
		(pred_6)
		(pred_4 ?v8))

   (:action op_2
       :parameters  (?v2 ?v1)
       :precondition (and (not-eq ?v2 ?v1) 
                          (pred_2 ?v2) (pred_2 ?v1) (pred_1 ?v2))
       :effect (and  (pred_1 ?v1)
		     (not (pred_1 ?v2))))


   (:action op_1
       :parameters (?v3 ?v5)
       :precondition  (and  (pred_3 ?v3) (pred_2 ?v5)
			    (pred_5 ?v3 ?v5) (pred_1 ?v5) (pred_6))
       :effect (and (pred_4 ?v3)
		    (not (pred_5 ?v3 ?v5)) 
		    (not (pred_6))))

   (:action op_3
       :parameters  (?v3  ?v5)
       :precondition  (and  (pred_3 ?v3) (pred_2 ?v5)
			    (pred_4 ?v3) (pred_1 ?v5))
       :effect (and (pred_5 ?v3 ?v5)
		    (pred_6)
		    (not (pred_4 ?v3)))))
