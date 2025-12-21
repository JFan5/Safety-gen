(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v7 ?v2)
		(pred_2 ?v5)
		(pred_6 ?v6)
		(pred_4 ?v6)
		(pred_3 ?v5 ?v6)
		(pred_5)
		(pred_1 ?v5))

   (:action op_3
       :parameters  (?v4 ?v3)
       :precondition (and (not-eq ?v4 ?v3) 
                          (pred_6 ?v4) (pred_6 ?v3) (pred_4 ?v4))
       :effect (and  (pred_4 ?v3)
		     (not (pred_4 ?v4))))


   (:action op_2
       :parameters (?v8 ?v1)
       :precondition  (and  (pred_2 ?v8) (pred_6 ?v1)
			    (pred_3 ?v8 ?v1) (pred_4 ?v1) (pred_5))
       :effect (and (pred_1 ?v8)
		    (not (pred_3 ?v8 ?v1)) 
		    (not (pred_5))))

   (:action op_1
       :parameters  (?v8  ?v1)
       :precondition  (and  (pred_2 ?v8) (pred_6 ?v1)
			    (pred_1 ?v8) (pred_4 ?v1))
       :effect (and (pred_3 ?v8 ?v1)
		    (pred_5)
		    (not (pred_1 ?v8)))))
