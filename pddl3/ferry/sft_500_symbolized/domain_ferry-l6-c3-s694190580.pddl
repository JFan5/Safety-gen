(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v3)
		(pred_4 ?v5)
		(pred_3 ?v8)
		(pred_5 ?v8)
		(pred_6 ?v5 ?v8)
		(pred_1)
		(pred_2 ?v5))

   (:action op_1
       :parameters  (?v2 ?v1)
       :precondition (and (not-eq ?v2 ?v1) 
                          (pred_3 ?v2) (pred_3 ?v1) (pred_5 ?v2))
       :effect (and  (pred_5 ?v1)
		     (not (pred_5 ?v2))))


   (:action op_2
       :parameters (?v4 ?v7)
       :precondition  (and  (pred_4 ?v4) (pred_3 ?v7)
			    (pred_6 ?v4 ?v7) (pred_5 ?v7) (pred_1))
       :effect (and (pred_2 ?v4)
		    (not (pred_6 ?v4 ?v7)) 
		    (not (pred_1))))

   (:action op_3
       :parameters  (?v4  ?v7)
       :precondition  (and  (pred_4 ?v4) (pred_3 ?v7)
			    (pred_2 ?v4) (pred_5 ?v7))
       :effect (and (pred_6 ?v4 ?v7)
		    (pred_1)
		    (not (pred_2 ?v4)))))
