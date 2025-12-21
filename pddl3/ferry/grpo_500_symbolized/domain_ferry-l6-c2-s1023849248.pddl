(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v7)
		(pred_5 ?v5)
		(pred_1 ?v6)
		(pred_2 ?v6)
		(pred_6 ?v5 ?v6)
		(pred_4)
		(pred_3 ?v5))

   (:action op_1
       :parameters  (?v8 ?v1)
       :precondition (and (not-eq ?v8 ?v1) 
                          (pred_1 ?v8) (pred_1 ?v1) (pred_2 ?v8))
       :effect (and  (pred_2 ?v1)
		     (not (pred_2 ?v8))))


   (:action op_2
       :parameters (?v2 ?v4)
       :precondition  (and  (pred_5 ?v2) (pred_1 ?v4)
			    (pred_6 ?v2 ?v4) (pred_2 ?v4) (pred_4))
       :effect (and (pred_3 ?v2)
		    (not (pred_6 ?v2 ?v4)) 
		    (not (pred_4))))

   (:action op_3
       :parameters  (?v2  ?v4)
       :precondition  (and  (pred_5 ?v2) (pred_1 ?v4)
			    (pred_3 ?v2) (pred_2 ?v4))
       :effect (and (pred_6 ?v2 ?v4)
		    (pred_4)
		    (not (pred_3 ?v2)))))
