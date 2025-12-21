(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v1)
		(pred_6 ?v2)
		(pred_5 ?v7)
		(pred_3 ?v7)
		(pred_1 ?v2 ?v7)
		(pred_2)
		(pred_4 ?v2))

   (:action op_3
       :parameters  (?v8 ?v4)
       :precondition (and (not-eq ?v8 ?v4) 
                          (pred_5 ?v8) (pred_5 ?v4) (pred_3 ?v8))
       :effect (and  (pred_3 ?v4)
		     (not (pred_3 ?v8))))


   (:action op_1
       :parameters (?v3 ?v5)
       :precondition  (and  (pred_6 ?v3) (pred_5 ?v5)
			    (pred_1 ?v3 ?v5) (pred_3 ?v5) (pred_2))
       :effect (and (pred_4 ?v3)
		    (not (pred_1 ?v3 ?v5)) 
		    (not (pred_2))))

   (:action op_2
       :parameters  (?v3  ?v5)
       :precondition  (and  (pred_6 ?v3) (pred_5 ?v5)
			    (pred_4 ?v3) (pred_3 ?v5))
       :effect (and (pred_1 ?v3 ?v5)
		    (pred_2)
		    (not (pred_4 ?v3)))))
