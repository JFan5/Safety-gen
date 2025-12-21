(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v7 ?v6)
		(pred_6 ?v3)
		(pred_5 ?v4)
		(pred_1 ?v4)
		(pred_3 ?v3 ?v4)
		(pred_4)
		(pred_2 ?v3))

   (:action op_3
       :parameters  (?v1 ?v2)
       :precondition (and (not-eq ?v1 ?v2) 
                          (pred_5 ?v1) (pred_5 ?v2) (pred_1 ?v1))
       :effect (and  (pred_1 ?v2)
		     (not (pred_1 ?v1))))


   (:action op_2
       :parameters (?v5 ?v8)
       :precondition  (and  (pred_6 ?v5) (pred_5 ?v8)
			    (pred_3 ?v5 ?v8) (pred_1 ?v8) (pred_4))
       :effect (and (pred_2 ?v5)
		    (not (pred_3 ?v5 ?v8)) 
		    (not (pred_4))))

   (:action op_1
       :parameters  (?v5  ?v8)
       :precondition  (and  (pred_6 ?v5) (pred_5 ?v8)
			    (pred_2 ?v5) (pred_1 ?v8))
       :effect (and (pred_3 ?v5 ?v8)
		    (pred_4)
		    (not (pred_2 ?v5)))))
