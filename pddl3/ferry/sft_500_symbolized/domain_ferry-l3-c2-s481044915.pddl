(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v8)
		(pred_1 ?v2)
		(pred_4 ?v7)
		(pred_6 ?v7)
		(pred_3 ?v2 ?v7)
		(pred_5)
		(pred_2 ?v2))

   (:action op_2
       :parameters  (?v5 ?v4)
       :precondition (and (not-eq ?v5 ?v4) 
                          (pred_4 ?v5) (pred_4 ?v4) (pred_6 ?v5))
       :effect (and  (pred_6 ?v4)
		     (not (pred_6 ?v5))))


   (:action op_1
       :parameters (?v3 ?v1)
       :precondition  (and  (pred_1 ?v3) (pred_4 ?v1)
			    (pred_3 ?v3 ?v1) (pred_6 ?v1) (pred_5))
       :effect (and (pred_2 ?v3)
		    (not (pred_3 ?v3 ?v1)) 
		    (not (pred_5))))

   (:action op_3
       :parameters  (?v3  ?v1)
       :precondition  (and  (pred_1 ?v3) (pred_4 ?v1)
			    (pred_2 ?v3) (pred_6 ?v1))
       :effect (and (pred_3 ?v3 ?v1)
		    (pred_5)
		    (not (pred_2 ?v3)))))
