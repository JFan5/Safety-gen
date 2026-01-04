(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v7)
		(pred_3 ?v8)
		(pred_4 ?v4)
		(pred_2 ?v4)
		(pred_1 ?v8 ?v4)
		(pred_5)
		(pred_6 ?v8))

   (:action op_3
       :parameters  (?v5 ?v3)
       :precondition (and (not-eq ?v5 ?v3) 
                          (pred_4 ?v5) (pred_4 ?v3) (pred_2 ?v5))
       :effect (and  (pred_2 ?v3)
		     (not (pred_2 ?v5))))


   (:action op_2
       :parameters (?v2 ?v1)
       :precondition  (and  (pred_3 ?v2) (pred_4 ?v1)
			    (pred_1 ?v2 ?v1) (pred_2 ?v1) (pred_5))
       :effect (and (pred_6 ?v2)
		    (not (pred_1 ?v2 ?v1)) 
		    (not (pred_5))))

   (:action op_1
       :parameters  (?v2  ?v1)
       :precondition  (and  (pred_3 ?v2) (pred_4 ?v1)
			    (pred_6 ?v2) (pred_2 ?v1))
       :effect (and (pred_1 ?v2 ?v1)
		    (pred_5)
		    (not (pred_6 ?v2)))))
