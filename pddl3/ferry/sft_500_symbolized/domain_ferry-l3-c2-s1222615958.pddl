(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v1)
		(pred_5 ?v8)
		(pred_4 ?v7)
		(pred_3 ?v7)
		(pred_2 ?v8 ?v7)
		(pred_6)
		(pred_1 ?v8))

   (:action op_2
       :parameters  (?v4 ?v6)
       :precondition (and (not-eq ?v4 ?v6) 
                          (pred_4 ?v4) (pred_4 ?v6) (pred_3 ?v4))
       :effect (and  (pred_3 ?v6)
		     (not (pred_3 ?v4))))


   (:action op_3
       :parameters (?v5 ?v3)
       :precondition  (and  (pred_5 ?v5) (pred_4 ?v3)
			    (pred_2 ?v5 ?v3) (pred_3 ?v3) (pred_6))
       :effect (and (pred_1 ?v5)
		    (not (pred_2 ?v5 ?v3)) 
		    (not (pred_6))))

   (:action op_1
       :parameters  (?v5  ?v3)
       :precondition  (and  (pred_5 ?v5) (pred_4 ?v3)
			    (pred_1 ?v5) (pred_3 ?v3))
       :effect (and (pred_2 ?v5 ?v3)
		    (pred_6)
		    (not (pred_1 ?v5)))))
