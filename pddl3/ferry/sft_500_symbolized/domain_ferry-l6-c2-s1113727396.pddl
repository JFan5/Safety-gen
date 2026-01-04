(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v6)
		(pred_2 ?v5)
		(pred_1 ?v8)
		(pred_3 ?v8)
		(pred_6 ?v5 ?v8)
		(pred_5)
		(pred_4 ?v5))

   (:action op_2
       :parameters  (?v2 ?v7)
       :precondition (and (not-eq ?v2 ?v7) 
                          (pred_1 ?v2) (pred_1 ?v7) (pred_3 ?v2))
       :effect (and  (pred_3 ?v7)
		     (not (pred_3 ?v2))))


   (:action op_1
       :parameters (?v4 ?v1)
       :precondition  (and  (pred_2 ?v4) (pred_1 ?v1)
			    (pred_6 ?v4 ?v1) (pred_3 ?v1) (pred_5))
       :effect (and (pred_4 ?v4)
		    (not (pred_6 ?v4 ?v1)) 
		    (not (pred_5))))

   (:action op_3
       :parameters  (?v4  ?v1)
       :precondition  (and  (pred_2 ?v4) (pred_1 ?v1)
			    (pred_4 ?v4) (pred_3 ?v1))
       :effect (and (pred_6 ?v4 ?v1)
		    (pred_5)
		    (not (pred_4 ?v4)))))
