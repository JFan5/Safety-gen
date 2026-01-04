(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v6)
		(pred_5 ?v7)
		(pred_1 ?v4)
		(pred_6 ?v4)
		(pred_2 ?v7 ?v4)
		(pred_3)
		(pred_4 ?v7))

   (:action op_2
       :parameters  (?v5 ?v1)
       :precondition (and (not-eq ?v5 ?v1) 
                          (pred_1 ?v5) (pred_1 ?v1) (pred_6 ?v5))
       :effect (and  (pred_6 ?v1)
		     (not (pred_6 ?v5))))


   (:action op_1
       :parameters (?v8 ?v2)
       :precondition  (and  (pred_5 ?v8) (pred_1 ?v2)
			    (pred_2 ?v8 ?v2) (pred_6 ?v2) (pred_3))
       :effect (and (pred_4 ?v8)
		    (not (pred_2 ?v8 ?v2)) 
		    (not (pred_3))))

   (:action op_3
       :parameters  (?v8  ?v2)
       :precondition  (and  (pred_5 ?v8) (pred_1 ?v2)
			    (pred_4 ?v8) (pred_6 ?v2))
       :effect (and (pred_2 ?v8 ?v2)
		    (pred_3)
		    (not (pred_4 ?v8)))))
