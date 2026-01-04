(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v8)
		(pred_4 ?v1)
		(pred_2 ?v6)
		(pred_3 ?v6)
		(pred_1 ?v1 ?v6)
		(pred_5)
		(pred_6 ?v1))

   (:action op_3
       :parameters  (?v4 ?v7)
       :precondition (and (not-eq ?v4 ?v7) 
                          (pred_2 ?v4) (pred_2 ?v7) (pred_3 ?v4))
       :effect (and  (pred_3 ?v7)
		     (not (pred_3 ?v4))))


   (:action op_2
       :parameters (?v5 ?v2)
       :precondition  (and  (pred_4 ?v5) (pred_2 ?v2)
			    (pred_1 ?v5 ?v2) (pred_3 ?v2) (pred_5))
       :effect (and (pred_6 ?v5)
		    (not (pred_1 ?v5 ?v2)) 
		    (not (pred_5))))

   (:action op_1
       :parameters  (?v5  ?v2)
       :precondition  (and  (pred_4 ?v5) (pred_2 ?v2)
			    (pred_6 ?v5) (pred_3 ?v2))
       :effect (and (pred_1 ?v5 ?v2)
		    (pred_5)
		    (not (pred_6 ?v5)))))
