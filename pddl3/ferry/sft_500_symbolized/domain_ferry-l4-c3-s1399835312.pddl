(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v6)
		(pred_5 ?v4)
		(pred_1 ?v8)
		(pred_6 ?v8)
		(pred_3 ?v4 ?v8)
		(pred_2)
		(pred_4 ?v4))

   (:action op_1
       :parameters  (?v5 ?v2)
       :precondition (and (not-eq ?v5 ?v2) 
                          (pred_1 ?v5) (pred_1 ?v2) (pred_6 ?v5))
       :effect (and  (pred_6 ?v2)
		     (not (pred_6 ?v5))))


   (:action op_3
       :parameters (?v1 ?v7)
       :precondition  (and  (pred_5 ?v1) (pred_1 ?v7)
			    (pred_3 ?v1 ?v7) (pred_6 ?v7) (pred_2))
       :effect (and (pred_4 ?v1)
		    (not (pred_3 ?v1 ?v7)) 
		    (not (pred_2))))

   (:action op_2
       :parameters  (?v1  ?v7)
       :precondition  (and  (pred_5 ?v1) (pred_1 ?v7)
			    (pred_4 ?v1) (pred_6 ?v7))
       :effect (and (pred_3 ?v1 ?v7)
		    (pred_2)
		    (not (pred_4 ?v1)))))
