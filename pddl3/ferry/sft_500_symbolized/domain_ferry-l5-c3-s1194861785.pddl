(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v7)
		(pred_6 ?v5)
		(pred_4 ?v2)
		(pred_5 ?v2)
		(pred_1 ?v5 ?v2)
		(pred_2)
		(pred_3 ?v5))

   (:action op_1
       :parameters  (?v8 ?v1)
       :precondition (and (not-eq ?v8 ?v1) 
                          (pred_4 ?v8) (pred_4 ?v1) (pred_5 ?v8))
       :effect (and  (pred_5 ?v1)
		     (not (pred_5 ?v8))))


   (:action op_2
       :parameters (?v3 ?v4)
       :precondition  (and  (pred_6 ?v3) (pred_4 ?v4)
			    (pred_1 ?v3 ?v4) (pred_5 ?v4) (pred_2))
       :effect (and (pred_3 ?v3)
		    (not (pred_1 ?v3 ?v4)) 
		    (not (pred_2))))

   (:action op_3
       :parameters  (?v3  ?v4)
       :precondition  (and  (pred_6 ?v3) (pred_4 ?v4)
			    (pred_3 ?v3) (pred_5 ?v4))
       :effect (and (pred_1 ?v3 ?v4)
		    (pred_2)
		    (not (pred_3 ?v3)))))
