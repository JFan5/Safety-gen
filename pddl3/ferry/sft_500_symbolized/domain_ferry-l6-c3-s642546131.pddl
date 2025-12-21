(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v2)
		(pred_4 ?v7)
		(pred_6 ?v5)
		(pred_1 ?v5)
		(pred_3 ?v7 ?v5)
		(pred_2)
		(pred_5 ?v7))

   (:action op_2
       :parameters  (?v1 ?v4)
       :precondition (and (not-eq ?v1 ?v4) 
                          (pred_6 ?v1) (pred_6 ?v4) (pred_1 ?v1))
       :effect (and  (pred_1 ?v4)
		     (not (pred_1 ?v1))))


   (:action op_1
       :parameters (?v6 ?v3)
       :precondition  (and  (pred_4 ?v6) (pred_6 ?v3)
			    (pred_3 ?v6 ?v3) (pred_1 ?v3) (pred_2))
       :effect (and (pred_5 ?v6)
		    (not (pred_3 ?v6 ?v3)) 
		    (not (pred_2))))

   (:action op_3
       :parameters  (?v6  ?v3)
       :precondition  (and  (pred_4 ?v6) (pred_6 ?v3)
			    (pred_5 ?v6) (pred_1 ?v3))
       :effect (and (pred_3 ?v6 ?v3)
		    (pred_2)
		    (not (pred_5 ?v6)))))
