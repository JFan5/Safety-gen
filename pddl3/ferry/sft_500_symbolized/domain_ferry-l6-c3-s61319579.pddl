(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v7)
		(pred_4 ?v3)
		(pred_5 ?v5)
		(pred_1 ?v5)
		(pred_6 ?v3 ?v5)
		(pred_2)
		(pred_3 ?v3))

   (:action op_3
       :parameters  (?v1 ?v4)
       :precondition (and (not-eq ?v1 ?v4) 
                          (pred_5 ?v1) (pred_5 ?v4) (pred_1 ?v1))
       :effect (and  (pred_1 ?v4)
		     (not (pred_1 ?v1))))


   (:action op_2
       :parameters (?v6 ?v2)
       :precondition  (and  (pred_4 ?v6) (pred_5 ?v2)
			    (pred_6 ?v6 ?v2) (pred_1 ?v2) (pred_2))
       :effect (and (pred_3 ?v6)
		    (not (pred_6 ?v6 ?v2)) 
		    (not (pred_2))))

   (:action op_1
       :parameters  (?v6  ?v2)
       :precondition  (and  (pred_4 ?v6) (pred_5 ?v2)
			    (pred_3 ?v6) (pred_1 ?v2))
       :effect (and (pred_6 ?v6 ?v2)
		    (pred_2)
		    (not (pred_3 ?v6)))))
