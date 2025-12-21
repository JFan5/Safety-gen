(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v6)
		(pred_4 ?v5)
		(pred_2 ?v3)
		(pred_5 ?v3)
		(pred_6 ?v5 ?v3)
		(pred_1)
		(pred_3 ?v5))

   (:action op_1
       :parameters  (?v4 ?v1)
       :precondition (and (not-eq ?v4 ?v1) 
                          (pred_2 ?v4) (pred_2 ?v1) (pred_5 ?v4))
       :effect (and  (pred_5 ?v1)
		     (not (pred_5 ?v4))))


   (:action op_3
       :parameters (?v2 ?v7)
       :precondition  (and  (pred_4 ?v2) (pred_2 ?v7)
			    (pred_6 ?v2 ?v7) (pred_5 ?v7) (pred_1))
       :effect (and (pred_3 ?v2)
		    (not (pred_6 ?v2 ?v7)) 
		    (not (pred_1))))

   (:action op_2
       :parameters  (?v2  ?v7)
       :precondition  (and  (pred_4 ?v2) (pred_2 ?v7)
			    (pred_3 ?v2) (pred_5 ?v7))
       :effect (and (pred_6 ?v2 ?v7)
		    (pred_1)
		    (not (pred_3 ?v2)))))
