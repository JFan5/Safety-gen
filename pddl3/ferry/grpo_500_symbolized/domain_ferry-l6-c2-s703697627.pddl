(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v2)
		(pred_5 ?v8)
		(pred_2 ?v3)
		(pred_4 ?v3)
		(pred_1 ?v8 ?v3)
		(pred_6)
		(pred_3 ?v8))

   (:action op_3
       :parameters  (?v4 ?v1)
       :precondition (and (not-eq ?v4 ?v1) 
                          (pred_2 ?v4) (pred_2 ?v1) (pred_4 ?v4))
       :effect (and  (pred_4 ?v1)
		     (not (pred_4 ?v4))))


   (:action op_2
       :parameters (?v7 ?v5)
       :precondition  (and  (pred_5 ?v7) (pred_2 ?v5)
			    (pred_1 ?v7 ?v5) (pred_4 ?v5) (pred_6))
       :effect (and (pred_3 ?v7)
		    (not (pred_1 ?v7 ?v5)) 
		    (not (pred_6))))

   (:action op_1
       :parameters  (?v7  ?v5)
       :precondition  (and  (pred_5 ?v7) (pred_2 ?v5)
			    (pred_3 ?v7) (pred_4 ?v5))
       :effect (and (pred_1 ?v7 ?v5)
		    (pred_6)
		    (not (pred_3 ?v7)))))
