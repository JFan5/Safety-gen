(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v6)
		(pred_6 ?v3)
		(pred_2 ?v7)
		(pred_1 ?v7)
		(pred_4 ?v3 ?v7)
		(pred_5)
		(pred_3 ?v3))

   (:action op_1
       :parameters  (?v2 ?v4)
       :precondition (and (not-eq ?v2 ?v4) 
                          (pred_2 ?v2) (pred_2 ?v4) (pred_1 ?v2))
       :effect (and  (pred_1 ?v4)
		     (not (pred_1 ?v2))))


   (:action op_3
       :parameters (?v8 ?v1)
       :precondition  (and  (pred_6 ?v8) (pred_2 ?v1)
			    (pred_4 ?v8 ?v1) (pred_1 ?v1) (pred_5))
       :effect (and (pred_3 ?v8)
		    (not (pred_4 ?v8 ?v1)) 
		    (not (pred_5))))

   (:action op_2
       :parameters  (?v8  ?v1)
       :precondition  (and  (pred_6 ?v8) (pred_2 ?v1)
			    (pred_3 ?v8) (pred_1 ?v1))
       :effect (and (pred_4 ?v8 ?v1)
		    (pred_5)
		    (not (pred_3 ?v8)))))
