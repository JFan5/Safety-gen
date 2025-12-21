(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v3)
		(pred_3 ?v8)
		(pred_5 ?v7)
		(pred_4 ?v7)
		(pred_6 ?v8 ?v7)
		(pred_2)
		(pred_1 ?v8))

   (:action op_2
       :parameters  (?v1 ?v6)
       :precondition (and (not-eq ?v1 ?v6) 
                          (pred_5 ?v1) (pred_5 ?v6) (pred_4 ?v1))
       :effect (and  (pred_4 ?v6)
		     (not (pred_4 ?v1))))


   (:action op_3
       :parameters (?v2 ?v4)
       :precondition  (and  (pred_3 ?v2) (pred_5 ?v4)
			    (pred_6 ?v2 ?v4) (pred_4 ?v4) (pred_2))
       :effect (and (pred_1 ?v2)
		    (not (pred_6 ?v2 ?v4)) 
		    (not (pred_2))))

   (:action op_1
       :parameters  (?v2  ?v4)
       :precondition  (and  (pred_3 ?v2) (pred_5 ?v4)
			    (pred_1 ?v2) (pred_4 ?v4))
       :effect (and (pred_6 ?v2 ?v4)
		    (pred_2)
		    (not (pred_1 ?v2)))))
