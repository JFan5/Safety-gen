(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v2)
		(pred_6 ?v7)
		(pred_1 ?v6)
		(pred_2 ?v6)
		(pred_4 ?v7 ?v6)
		(pred_5)
		(pred_3 ?v7))

   (:action op_1
       :parameters  (?v4 ?v3)
       :precondition (and (not-eq ?v4 ?v3) 
                          (pred_1 ?v4) (pred_1 ?v3) (pred_2 ?v4))
       :effect (and  (pred_2 ?v3)
		     (not (pred_2 ?v4))))


   (:action op_2
       :parameters (?v5 ?v8)
       :precondition  (and  (pred_6 ?v5) (pred_1 ?v8)
			    (pred_4 ?v5 ?v8) (pred_2 ?v8) (pred_5))
       :effect (and (pred_3 ?v5)
		    (not (pred_4 ?v5 ?v8)) 
		    (not (pred_5))))

   (:action op_3
       :parameters  (?v5  ?v8)
       :precondition  (and  (pred_6 ?v5) (pred_1 ?v8)
			    (pred_3 ?v5) (pred_2 ?v8))
       :effect (and (pred_4 ?v5 ?v8)
		    (pred_5)
		    (not (pred_3 ?v5)))))
