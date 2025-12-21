(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v6)
		(pred_1 ?v8)
		(pred_4 ?v7)
		(pred_3 ?v7)
		(pred_6 ?v8 ?v7)
		(pred_5)
		(pred_2 ?v8))

   (:action op_2
       :parameters  (?v4 ?v5)
       :precondition (and (not-eq ?v4 ?v5) 
                          (pred_4 ?v4) (pred_4 ?v5) (pred_3 ?v4))
       :effect (and  (pred_3 ?v5)
		     (not (pred_3 ?v4))))


   (:action op_3
       :parameters (?v3 ?v2)
       :precondition  (and  (pred_1 ?v3) (pred_4 ?v2)
			    (pred_6 ?v3 ?v2) (pred_3 ?v2) (pred_5))
       :effect (and (pred_2 ?v3)
		    (not (pred_6 ?v3 ?v2)) 
		    (not (pred_5))))

   (:action op_1
       :parameters  (?v3  ?v2)
       :precondition  (and  (pred_1 ?v3) (pred_4 ?v2)
			    (pred_2 ?v3) (pred_3 ?v2))
       :effect (and (pred_6 ?v3 ?v2)
		    (pred_5)
		    (not (pred_2 ?v3)))))
