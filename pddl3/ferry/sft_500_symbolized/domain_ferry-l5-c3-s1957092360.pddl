(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v7)
		(pred_1 ?v6)
		(pred_3 ?v3)
		(pred_6 ?v3)
		(pred_2 ?v6 ?v3)
		(pred_5)
		(pred_4 ?v6))

   (:action op_2
       :parameters  (?v1 ?v4)
       :precondition (and (not-eq ?v1 ?v4) 
                          (pred_3 ?v1) (pred_3 ?v4) (pred_6 ?v1))
       :effect (and  (pred_6 ?v4)
		     (not (pred_6 ?v1))))


   (:action op_3
       :parameters (?v5 ?v2)
       :precondition  (and  (pred_1 ?v5) (pred_3 ?v2)
			    (pred_2 ?v5 ?v2) (pred_6 ?v2) (pred_5))
       :effect (and (pred_4 ?v5)
		    (not (pred_2 ?v5 ?v2)) 
		    (not (pred_5))))

   (:action op_1
       :parameters  (?v5  ?v2)
       :precondition  (and  (pred_1 ?v5) (pred_3 ?v2)
			    (pred_4 ?v5) (pred_6 ?v2))
       :effect (and (pred_2 ?v5 ?v2)
		    (pred_5)
		    (not (pred_4 ?v5)))))
