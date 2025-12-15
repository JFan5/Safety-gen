(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v6)
		(pred_3 ?v5)
		(pred_6 ?v4)
		(pred_2 ?v4)
		(pred_4 ?v5 ?v4)
		(pred_5)
		(pred_1 ?v5))

   (:action op_2
       :parameters  (?v2 ?v3)
       :precondition (and (not-eq ?v2 ?v3) 
                          (pred_6 ?v2) (pred_6 ?v3) (pred_2 ?v2))
       :effect (and  (pred_2 ?v3)
		     (not (pred_2 ?v2))))


   (:action op_3
       :parameters (?v1 ?v7)
       :precondition  (and  (pred_3 ?v1) (pred_6 ?v7)
			    (pred_4 ?v1 ?v7) (pred_2 ?v7) (pred_5))
       :effect (and (pred_1 ?v1)
		    (not (pred_4 ?v1 ?v7)) 
		    (not (pred_5))))

   (:action op_1
       :parameters  (?v1  ?v7)
       :precondition  (and  (pred_3 ?v1) (pred_6 ?v7)
			    (pred_1 ?v1) (pred_2 ?v7))
       :effect (and (pred_4 ?v1 ?v7)
		    (pred_5)
		    (not (pred_1 ?v1)))))
