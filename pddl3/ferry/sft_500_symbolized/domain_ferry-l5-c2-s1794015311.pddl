(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v6)
		(pred_6 ?v5)
		(pred_4 ?v4)
		(pred_1 ?v4)
		(pred_5 ?v5 ?v4)
		(pred_3)
		(pred_2 ?v5))

   (:action op_3
       :parameters  (?v2 ?v7)
       :precondition (and (not-eq ?v2 ?v7) 
                          (pred_4 ?v2) (pred_4 ?v7) (pred_1 ?v2))
       :effect (and  (pred_1 ?v7)
		     (not (pred_1 ?v2))))


   (:action op_2
       :parameters (?v8 ?v1)
       :precondition  (and  (pred_6 ?v8) (pred_4 ?v1)
			    (pred_5 ?v8 ?v1) (pred_1 ?v1) (pred_3))
       :effect (and (pred_2 ?v8)
		    (not (pred_5 ?v8 ?v1)) 
		    (not (pred_3))))

   (:action op_1
       :parameters  (?v8  ?v1)
       :precondition  (and  (pred_6 ?v8) (pred_4 ?v1)
			    (pred_2 ?v8) (pred_1 ?v1))
       :effect (and (pred_5 ?v8 ?v1)
		    (pred_3)
		    (not (pred_2 ?v8)))))
