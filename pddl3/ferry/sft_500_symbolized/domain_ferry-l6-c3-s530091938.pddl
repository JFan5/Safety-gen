(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v3)
		(pred_3 ?v8)
		(pred_4 ?v5)
		(pred_6 ?v5)
		(pred_5 ?v8 ?v5)
		(pred_2)
		(pred_1 ?v8))

   (:action op_1
       :parameters  (?v2 ?v4)
       :precondition (and (not-eq ?v2 ?v4) 
                          (pred_4 ?v2) (pred_4 ?v4) (pred_6 ?v2))
       :effect (and  (pred_6 ?v4)
		     (not (pred_6 ?v2))))


   (:action op_3
       :parameters (?v1 ?v7)
       :precondition  (and  (pred_3 ?v1) (pred_4 ?v7)
			    (pred_5 ?v1 ?v7) (pred_6 ?v7) (pred_2))
       :effect (and (pred_1 ?v1)
		    (not (pred_5 ?v1 ?v7)) 
		    (not (pred_2))))

   (:action op_2
       :parameters  (?v1  ?v7)
       :precondition  (and  (pred_3 ?v1) (pred_4 ?v7)
			    (pred_1 ?v1) (pred_6 ?v7))
       :effect (and (pred_5 ?v1 ?v7)
		    (pred_2)
		    (not (pred_1 ?v1)))))
