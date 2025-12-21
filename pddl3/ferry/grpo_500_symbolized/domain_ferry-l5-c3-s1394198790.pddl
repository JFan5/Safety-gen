(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v3)
		(pred_4 ?v4)
		(pred_2 ?v7)
		(pred_6 ?v7)
		(pred_1 ?v4 ?v7)
		(pred_5)
		(pred_3 ?v4))

   (:action op_3
       :parameters  (?v2 ?v6)
       :precondition (and (not-eq ?v2 ?v6) 
                          (pred_2 ?v2) (pred_2 ?v6) (pred_6 ?v2))
       :effect (and  (pred_6 ?v6)
		     (not (pred_6 ?v2))))


   (:action op_1
       :parameters (?v5 ?v1)
       :precondition  (and  (pred_4 ?v5) (pred_2 ?v1)
			    (pred_1 ?v5 ?v1) (pred_6 ?v1) (pred_5))
       :effect (and (pred_3 ?v5)
		    (not (pred_1 ?v5 ?v1)) 
		    (not (pred_5))))

   (:action op_2
       :parameters  (?v5  ?v1)
       :precondition  (and  (pred_4 ?v5) (pred_2 ?v1)
			    (pred_3 ?v5) (pred_6 ?v1))
       :effect (and (pred_1 ?v5 ?v1)
		    (pred_5)
		    (not (pred_3 ?v5)))))
