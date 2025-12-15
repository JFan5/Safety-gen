(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v6)
		(pred_3 ?v3)
		(pred_2 ?v8)
		(pred_6 ?v8)
		(pred_5 ?v3 ?v8)
		(pred_4)
		(pred_1 ?v3))

   (:action op_1
       :parameters  (?v2 ?v1)
       :precondition (and (not-eq ?v2 ?v1) 
                          (pred_2 ?v2) (pred_2 ?v1) (pred_6 ?v2))
       :effect (and  (pred_6 ?v1)
		     (not (pred_6 ?v2))))


   (:action op_2
       :parameters (?v4 ?v7)
       :precondition  (and  (pred_3 ?v4) (pred_2 ?v7)
			    (pred_5 ?v4 ?v7) (pred_6 ?v7) (pred_4))
       :effect (and (pred_1 ?v4)
		    (not (pred_5 ?v4 ?v7)) 
		    (not (pred_4))))

   (:action op_3
       :parameters  (?v4  ?v7)
       :precondition  (and  (pred_3 ?v4) (pred_2 ?v7)
			    (pred_1 ?v4) (pred_6 ?v7))
       :effect (and (pred_5 ?v4 ?v7)
		    (pred_4)
		    (not (pred_1 ?v4)))))
