(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v7)
		(pred_1 ?v4)
		(pred_5 ?v5)
		(pred_4 ?v5)
		(pred_2 ?v4 ?v5)
		(pred_3)
		(pred_6 ?v4))

   (:action op_3
       :parameters  (?v2 ?v6)
       :precondition (and (not-eq ?v2 ?v6) 
                          (pred_5 ?v2) (pred_5 ?v6) (pred_4 ?v2))
       :effect (and  (pred_4 ?v6)
		     (not (pred_4 ?v2))))


   (:action op_1
       :parameters (?v8 ?v1)
       :precondition  (and  (pred_1 ?v8) (pred_5 ?v1)
			    (pred_2 ?v8 ?v1) (pred_4 ?v1) (pred_3))
       :effect (and (pred_6 ?v8)
		    (not (pred_2 ?v8 ?v1)) 
		    (not (pred_3))))

   (:action op_2
       :parameters  (?v8  ?v1)
       :precondition  (and  (pred_1 ?v8) (pred_5 ?v1)
			    (pred_6 ?v8) (pred_4 ?v1))
       :effect (and (pred_2 ?v8 ?v1)
		    (pred_3)
		    (not (pred_6 ?v8)))))
