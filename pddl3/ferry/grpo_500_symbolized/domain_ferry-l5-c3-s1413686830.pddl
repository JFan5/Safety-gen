(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v4)
		(pred_3 ?v6)
		(pred_5 ?v1)
		(pred_2 ?v1)
		(pred_1 ?v6 ?v1)
		(pred_6)
		(pred_4 ?v6))

   (:action op_1
       :parameters  (?v2 ?v5)
       :precondition (and (not-eq ?v2 ?v5) 
                          (pred_5 ?v2) (pred_5 ?v5) (pred_2 ?v2))
       :effect (and  (pred_2 ?v5)
		     (not (pred_2 ?v2))))


   (:action op_2
       :parameters (?v7 ?v8)
       :precondition  (and  (pred_3 ?v7) (pred_5 ?v8)
			    (pred_1 ?v7 ?v8) (pred_2 ?v8) (pred_6))
       :effect (and (pred_4 ?v7)
		    (not (pred_1 ?v7 ?v8)) 
		    (not (pred_6))))

   (:action op_3
       :parameters  (?v7  ?v8)
       :precondition  (and  (pred_3 ?v7) (pred_5 ?v8)
			    (pred_4 ?v7) (pred_2 ?v8))
       :effect (and (pred_1 ?v7 ?v8)
		    (pred_6)
		    (not (pred_4 ?v7)))))
