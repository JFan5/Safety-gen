(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v2)
		(pred_4 ?v8)
		(pred_5 ?v1)
		(pred_1 ?v1)
		(pred_3 ?v8 ?v1)
		(pred_2)
		(pred_6 ?v8))

   (:action op_1
       :parameters  (?v5 ?v7)
       :precondition (and (not-eq ?v5 ?v7) 
                          (pred_5 ?v5) (pred_5 ?v7) (pred_1 ?v5))
       :effect (and  (pred_1 ?v7)
		     (not (pred_1 ?v5))))


   (:action op_3
       :parameters (?v4 ?v3)
       :precondition  (and  (pred_4 ?v4) (pred_5 ?v3)
			    (pred_3 ?v4 ?v3) (pred_1 ?v3) (pred_2))
       :effect (and (pred_6 ?v4)
		    (not (pred_3 ?v4 ?v3)) 
		    (not (pred_2))))

   (:action op_2
       :parameters  (?v4  ?v3)
       :precondition  (and  (pred_4 ?v4) (pred_5 ?v3)
			    (pred_6 ?v4) (pred_1 ?v3))
       :effect (and (pred_3 ?v4 ?v3)
		    (pred_2)
		    (not (pred_6 ?v4)))))
