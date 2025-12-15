(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v8)
		(pred_6 ?v3)
		(pred_3 ?v7)
		(pred_5 ?v7)
		(pred_2 ?v3 ?v7)
		(pred_1)
		(pred_4 ?v3))

   (:action op_2
       :parameters  (?v2 ?v6)
       :precondition (and (not-eq ?v2 ?v6) 
                          (pred_3 ?v2) (pred_3 ?v6) (pred_5 ?v2))
       :effect (and  (pred_5 ?v6)
		     (not (pred_5 ?v2))))


   (:action op_1
       :parameters (?v4 ?v1)
       :precondition  (and  (pred_6 ?v4) (pred_3 ?v1)
			    (pred_2 ?v4 ?v1) (pred_5 ?v1) (pred_1))
       :effect (and (pred_4 ?v4)
		    (not (pred_2 ?v4 ?v1)) 
		    (not (pred_1))))

   (:action op_3
       :parameters  (?v4  ?v1)
       :precondition  (and  (pred_6 ?v4) (pred_3 ?v1)
			    (pred_4 ?v4) (pred_5 ?v1))
       :effect (and (pred_2 ?v4 ?v1)
		    (pred_1)
		    (not (pred_4 ?v4)))))
